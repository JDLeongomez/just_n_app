# R/mod_montecarlo.R

mc_code_example <- "set.seed(42)

simular_poder <- function(n, r_pob, alpha = 0.05, n_sims = 5000) {
  # n       : tamaño de muestra a evaluar
  # r_pob   : correlación hipotética/esperada en la población
  # n_sims  : número de simulaciones (>= 5000 recomendado)

  rechazos <- replicate(n_sims, {
    # 1. Simular datos desde la población esperada
    datos <- MASS::mvrnorm(
      n     = n,
      mu    = c(0, 0),
      Sigma = matrix(c(1, r_pob, r_pob, 1), 2, 2)
    )
    # 2. Aplicar el test
    p <- cor.test(datos[, 1], datos[, 2])$p.value
    # 3. ¿Se rechazó H0?
    p < alpha
  })

  mean(rechazos)  # proporción de rechazos = poder empírico
}

# Evaluar el poder para distintos tamaños de muestra
ns    <- seq(20, 200, by = 10)
poder <- sapply(ns, simular_poder, r_pob = 0.30)

# n necesario para ~80% de poder
ns[which(poder >= 0.80)[1]]"

step_card <- function(num, title, body) {
  div(
    class = "d-flex gap-3 mb-3",
    div(
      style = paste0(
        "flex-shrink:0; width:32px; height:32px; border-radius:50%;",
        "background:#4f46e5; color:#fff; font-weight:700;",
        "display:flex; align-items:center; justify-content:center; font-size:0.85rem;"
      ),
      num
    ),
    div(
      tags$strong(title), tags$br(),
      span(class = "text-muted small", body)
    )
  )
}

mod_montecarlo_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "container-lg py-4",
      div(
        class = "row justify-content-center",
        div(
          class = "col-lg-9",
          h2(i18n("mc_heading"), class = "mb-1"),
          p(class = "lead text-muted mb-4", i18n("mc_lead")),

          # ── Opción 1: Superpower ──────────────────────────────────────────
          bslib::card(
            class = "mb-3",
            bslib::card_header(
              div(
                class = "d-flex align-items-center gap-2",
                bsicons::bs_icon("grid-fill", style = "color:#4f46e5"),
                i18n("mc_superpower_head")
              )
            ),
            bslib::card_body(
              p(HTML(paste0(
                "Para diseños <strong>ANOVA factoriales</strong> (con dos o más factores, ",
                "con o sin medidas repetidas), el paquete <code>Superpower</code> ofrece una ",
                "solución basada en simulación que va más allá de lo que <code>pwr</code> puede ",
                "hacer. En lugar de asumir un tamaño de efecto global, <code>Superpower</code> ",
                "parte de la estructura completa del diseño: medias esperadas por celda, ",
                "desviaciones estándar y correlaciones entre medidas repetidas."
              ))),
              div(
                class = "alert alert-warning small",
                bsicons::bs_icon("exclamation-triangle-fill"), " ",
                tags$strong("Superpower"),
                " no está disponible en esta app (WASM). Usa los ejemplos de
                 código siguientes en R local."
              ),
              h6(
                "1. Definir el diseño con ", tags$code("ANOVA_design()"),
                class = "mt-3 mb-1"
              ),
              div(
                class = "jn-code-block mb-3",
"library(Superpower)

# Ejemplo: diseño 2x3 mixto
# Factor A (entre sujetos, 'b'): 2 niveles
# Factor B (intra sujetos, 'w'): 3 niveles
diseno <- ANOVA_design(
  design     = \"2b*3w\",          # b = between, w = within
  n          = 30,               # n por celda (punto de partida)
  mu         = c(0, 0.3, 0.5,   # medias esperadas por celda
                 0, 0.2, 0.6),
  sd         = 1,                # desviación estándar (puede ser vector)
  r          = 0.5,              # correlación entre medidas repetidas
  labelnames = c(\"grupo\", \"control\", \"experimental\",
                 \"tiempo\", \"t1\", \"t2\", \"t3\")
)"
              ),
              h6(
                "2. Estimar el poder con ", tags$code("ANOVA_power()"),
                class = "mb-1"
              ),
              div(
                class = "jn-code-block mb-3",
"resultado <- ANOVA_power(
  design_result = diseno,
  alpha_level   = 0.05,
  nsims         = 5000,        # número de simulaciones
  verbose       = FALSE
)

resultado$main_results  # poder para cada efecto principal e interacción"
              ),
              p(
                class = "small text-muted",
                "La salida reporta el poder simulado para ",
                tags$strong("cada efecto"),
                " del modelo (efectos principales e interacción), lo que permite
                 ajustar el N según el efecto de interés primario. Para encontrar
                 el N óptimo, itera ",
                tags$code("ANOVA_design()"),
                " con distintos valores de ",
                tags$code("n"),
                ", o usa ",
                tags$code("power_twoway_between()"),
                " para un primer tanteo analítico antes de simular."
              ),
              p(
                class = "small text-muted mb-0",
                "Documentación y ejemplos adicionales en la guía de ",
                cite_ref("leongomezAnalisisPoderEstadistico2020"),
                ", la documentación oficial de Superpower ",
                cite_ref("lakensIntroductionSuperpower2025"),
                " y el artículo metodológico ",
                cite_ref("lakensSimulationBasedPowerAnalysis2021"), "."
              )
            )
          ),

          # ── Opción 2: Monte Carlo ─────────────────────────────────────────
          bslib::card(
            class = "mb-3",
            bslib::card_header(
              div(
                class = "d-flex align-items-center gap-2",
                bsicons::bs_icon("question-circle-fill", style = "color:#4f46e5"),
                i18n("mc_why_head")
              )
            ),
            bslib::card_body(
              p(HTML(paste0(
                "Cuando el diseño va más allá de lo que cubren tanto <code>pwr</code> como ",
                "<code>Superpower</code>, la simulación Monte Carlo es la solución. ",
                "Es la opción cuando el diseño incluye:"
              ))),
              div(
                class = "row g-2",
                lapply(
                  c(
                    "Modelos mixtos (lme4)",
                    "ANCOVA / covariables",
                    "Distribuciones no normales",
                    "Mediación / moderación",
                    "Medidas repetidas con estructura personalizada",
                    "Cualquier diseño personalizado"
                  ),
                  function(x) {
                    div(
                      class = "col-md-4",
                      div(
                        class = "d-flex align-items-center gap-2 small p-2 rounded",
                        style = "background:#f8f9ff; border:1px solid #e2e4f0;",
                        bsicons::bs_icon("check-circle-fill",
                          style = "color:#059669; flex-shrink:0;"
                        ), x
                      )
                    )
                  }
                )
              )
            )
          ),

          # ── Principio general ─────────────────────────────────────────────
          bslib::card(
            class = "mb-3",
            bslib::card_header(
              div(
                class = "d-flex align-items-center gap-2",
                bsicons::bs_icon("diagram-3-fill", style = "color:#4f46e5"),
                i18n("mc_principle")
              )
            ),
            bslib::card_body(
              step_card(
                "1", "Definir la población",
                "Especifica la estructura del efecto esperado (correlación, diferencia de medias, etc.)."
              ),
              step_card(
                "2", "Extraer muestras repetidamente",
                "Simula >= 5 000 muestras de tamaño N desde esa población."
              ),
              step_card(
                "3", "Aplicar el test estadístico",
                "Ejecuta el análisis planificado sobre cada muestra simulada."
              ),
              step_card(
                "4", "Estimar el poder empírico",
                "El poder = proporción de simulaciones en que se rechaza H0."
              )
            )
          ),

          # ── Ejemplo en R ──────────────────────────────────────────────────
          bslib::card(
            class = "mb-3",
            bslib::card_header(
              div(
                class = "d-flex align-items-center gap-2",
                bsicons::bs_icon("code-slash", style = "color:#4f46e5"),
                i18n("mc_example")
              )
            ),
            bslib::card_body(
              p(class = "small text-muted mb-3", HTML(paste0(
                "Ejemplo: poder para <strong>correlación de Pearson</strong> ",
                "(r = 0.30, alpha = 0.05). ",
                "El mismo patrón se extiende a cualquier diseño."
              ))),
              div(class = "jn-code-block", mc_code_example)
            )
          ),

          # ── Extensión ─────────────────────────────────────────────────────
          bslib::card(
            bslib::card_header(
              div(
                class = "d-flex align-items-center gap-2",
                bsicons::bs_icon("arrow-right-circle-fill", style = "color:#4f46e5"),
                i18n("mc_extension")
              )
            ),
            bslib::card_body(
              p(class = "mb-0", HTML(paste0(
                "Para <strong>modelos mixtos</strong>, reemplaza el paso 1 usando ",
                "<a href='https://lme4.github.io/lme4/reference/simulate.merMod.html' target='_blank'><code>lme4::simulate()</code></a> ",
                "o generando datos con la estructura de efectos fijos y aleatorios esperada. ",
                "Para <strong>ANCOVA</strong>, incluye la covariable en la simulación. ",
                "El principio es siempre el mismo: simular → aplicar test → contar rechazos."
              )))
            )
          )
        )
      )
    )
  )
}

mod_montecarlo_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
