library(shiny)
library(bslib)
library(pwr)

# Cargar datos y helpers
source("data/strings_es.R")
source("data/strings_en.R")
source("data/refs.R")
source("data/strategies.R")
source("R/i18n.R")
source("R/theme.R")
source("R/cite.R")
source("data/strategy_details_es.R")

# Idioma por defecto
options(just_n_lang = "es")

# Cargar módulos
source("R/mod_intro.R")
source("R/mod_tree.R")
source("R/mod_quant.R")
source("R/mod_montecarlo.R")
source("R/mod_mixed.R")
source("R/mod_qual_resources.R")
source("R/mod_consulta_previa.R")
source("R/mod_bibliography.R")

# ── UI ──────────────────────────────────────────────────────────────────────

ui <- page_navbar(
  id           = "main_nav",
  window_title = "Just-N Framework: Aplicación Interactiva",
  title = div(
    tags$img(src = "just-n-logo.svg", height = "38px", class = "me-2"),
    span(i18n("app_subtitle"), class = "text-muted small fw-normal")
  ),
  theme = bs_theme(
    version = 5,
    bootswatch = "flatly",
    primary = "#4f46e5",
    success = "#059669",
    warning = "#d97706",
    "font-size-base" = "0.95rem",
    "border-radius" = "0.5rem",
    "card-border-color" = "#e2e4f0",
    "accordion-border-color" = "#e2e4f0"
  ),
  header = tags$head(
    tags$link(rel = "icon", type = "image/svg+xml", href = "just-n-logo.svg"),
    tags$link(rel = "stylesheet", href = "custom.css"),
    tags$script(src = "cite.js"),
    tags$script(HTML("
      Shiny.addCustomMessageHandler('scrollToTools', function(msg) {
        setTimeout(function() {
          var el = document.getElementById('quant_tools_panel');
          if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }, 200);
      });

      document.addEventListener('DOMContentLoaded', function() {
        if (window.innerWidth < 768) {
          var banner = document.createElement('div');
          banner.className = 'alert alert-warning alert-dismissible fade show m-0 rounded-0';
          banner.setAttribute('role', 'alert');
          banner.style.cssText = 'position: sticky; top: 56px; z-index: 1040; font-size: 0.85rem; border-left: none; border-right: none;';
          banner.innerHTML = '<strong>💻 Mejor experiencia en computador:</strong> Esta aplicación está diseñada para pantallas grandes. Para aprovecharla al máximo, ábrela en un computador o tableta. <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Cerrar\"></button>';
          document.body.prepend(banner);
        }
      });
    "))
  ),
  footer = div(
    class = "just-n-footer",
    i18n("footer_author"), " ",
    tags$a(
      href  = "https://orcid.org/0000-0002-0092-6298",
      target = "_blank",
      title = "ORCID: 0000-0002-0092-6298",
      tags$img(src = "orcid_logo.svg", height = "14px",
               alt = "ORCID", style = "vertical-align:middle; margin:0 3px;")
    ),
    " | ",
    tags$a(
      href = "https://doi.org/10.5281/zenodo.19860616",
      target = "_blank", "DOI: 10.5281/zenodo.19860616"
    ),
    " | ",
    tags$a(
      href = "https://github.com/jdleongomez/just_n_app/issues",
      target = "_blank",
      bsicons::bs_icon("github"), " Comentarios / Issues"
    )
  ),
  fillable = FALSE,
  nav_spacer(),
  nav_panel(
    title = i18n("nav_intro"),
    icon  = bsicons::bs_icon("house"),
    mod_intro_ui("intro")
  ),
  nav_panel(
    title = "Cuantitativo",
    icon = bsicons::bs_icon("calculator"),
    mod_tree_ui("tree_quant", initial_step = "quant"),
    uiOutput("quant_tools_panel"),
    uiOutput("montecarlo_panel")
  ),
  nav_panel(
    title = "Cualitativo",
    icon = bsicons::bs_icon("people"),
    consulta_previa_card(),
    mod_tree_ui("tree_qual", initial_step = "qual"),
    uiOutput("qual_detail_panel"),
    mod_qual_resources_ui("qual_res")
  ),
  nav_panel(
    title = "Mixto",
    icon  = bsicons::bs_icon("shuffle"),
    mod_mixed_ui("mixed")
  ),
  nav_panel(
    title = "Referencias",
    icon  = bsicons::bs_icon("journal-bookmark"),
    mod_bibliography_ui("bib")
  )
)

# ── Server ───────────────────────────────────────────────────────────────────

server <- function(input, output, session) {
  mod_intro_server("intro")

  observeEvent(input$go_tab, {
    nav_select("main_nav", input$go_tab)
  })

  tree_quant_strategy <- mod_tree_server("tree_quant", initial_step = "quant")

  observeEvent(tree_quant_strategy(), {
    req(tree_quant_strategy())
    session$sendCustomMessage("scrollToTools", list())
  })
  mod_quant_server("quant")
  mod_montecarlo_server("mc")

  output$montecarlo_panel <- renderUI({
    if (isTRUE(tree_quant_strategy() == "sesoi")) {
      tagList(
        div(class = "jn-section-break container-lg",
          tags$hr(class = "jn-section-hr"),
          div(class = "jn-section-tag",
            bsicons::bs_icon("diagram-3"), " Simulaciones Monte Carlo")
        ),
        mod_montecarlo_ui("mc")
      )
    }
  })

  tree_qual_strategy <- mod_tree_server("tree_qual", initial_step = "qual")

  output$qual_detail_panel <- renderUI({
    strategy <- tree_qual_strategy()
    req(strategy)
    detail <- strategy_details_es[[strategy]]
    if (!is.null(detail)) {
      div(class = "container-lg py-2", detail())
    }
  })

  mod_qual_resources_server("qual_res")
  mod_mixed_server("mixed")
  mod_bibliography_server("bib")

  # ── Panel dinámico contextual (tab Cuantitativo) ──────────────────────────
  output$quant_tools_panel <- renderUI({
    strategy <- tree_quant_strategy()

    if (is.null(strategy)) {
      div(
        class = "container-lg py-2",
        div(
          class = "alert alert-light border text-muted text-center py-5 my-0",
          style = "border-style: dashed !important;",
          bsicons::bs_icon("arrow-left-circle", size = "1.5em"),
          tags$p(
            class = "mb-0 mt-2",
            "Selecciona un objetivo en el árbol de decisiones",
            tags$br(),
            "para ver las herramientas disponibles."
          )
        )
      )
    } else if (strategy == "sesoi") {
      mod_quant_ui("quant")

    } else if (strategy == "precision") {
      tagList(
        div(class = "container-lg py-2", strategy_details_es$precision()),
        div(
          class = "container-lg py-4",
          h2("Calculadora de precisión (IC)", class = "mb-1"),
          p(
            class = "text-muted mb-4",
            "Calcula el N necesario para estimar una correlación de Pearson con
             un ancho de intervalo de confianza deseado, usando la transformación
             de Fisher-z."
          ),
          bslib::layout_columns(
            col_widths = c(4, 8),
            bslib::card(
              bslib::card_header("Parámetros"),
              bslib::card_body(
                sliderInput("prec_epsilon",
                  HTML("Margen de error (&epsilon;) en escala <em>r</em>"),
                  min = 0.02, max = 0.30, value = 0.10, step = 0.01
                ),
                radioButtons("prec_conf", "Nivel de confianza",
                  choices = c("90 %" = 0.90, "95 %" = 0.95, "99 %" = 0.99),
                  selected = 0.95
                )
              )
            ),
            tagList(
              uiOutput("precision_result_ui"),
              div(
                class = "alert alert-info small mt-3",
                bsicons::bs_icon("info-circle"), " ",
                "Para diferencias de medias, usa ",
                tags$code("MBESS::ss.aipe.smd()"), " en R local.
                 La guía arriba incluye el código necesario."
              )
            )
          )
        )
      )

    } else if (strategy == "cost") {
      tagList(
        div(class = "container-lg py-2", strategy_details_es$cost()),
        div(
          class = "container-lg py-4",
          h2("Calculadora inversa de poder", class = "mb-1"),
          p(
            class = "text-muted mb-4",
            "Dado el N disponible, calcula el poder estadístico y el efecto
             mínimo detectable (MDE)."
          ),
          bslib::layout_columns(
            col_widths = c(4, 8),
            bslib::card(
              bslib::card_header("Parámetros"),
              bslib::card_body(
                selectInput("cost_design", "Diseño",
                  choices = c(
                    `Prueba t independiente` = "t_ind",
                    `Prueba t pareada`       = "t_paired",
                    `Correlación de Pearson` = "corr",
                    `ANOVA de una vía`       = "anova"
                  )
                ),
                numericInput("cost_n", "N disponible",
                  value = 30, min = 5, max = 10000, step = 5
                ),
                conditionalPanel(
                  condition = "input.cost_design == 'anova'",
                  numericInput("cost_groups", "Número de grupos",
                    value = 3, min = 2, max = 20, step = 1
                  )
                ),
                div(
                  class = "row g-2",
                  div(
                    class = "col-6",
                    numericInput("cost_alpha", HTML("&alpha;"),
                      value = 0.05, min = 0.001, max = 0.2, step = 0.005
                    )
                  ),
                  div(
                    class = "col-6",
                    numericInput("cost_effect",
                      HTML("Efecto esperado<br><small class='text-muted'>d / r / f</small>"),
                      value = 0.30, min = 0.01, max = 2.0, step = 0.01
                    )
                  )
                )
              )
            ),
            uiOutput("cost_result_ui")
          )
        )
      )

    } else if (strategy == "sequential") {
      tagList(
        div(class = "container-lg py-2", strategy_details_es$sequential()),
        div(
          class = "container-lg py-4",
          div(
            class = "alert alert-info d-flex gap-2 align-items-start",
            bsicons::bs_icon("info-circle"),
            div(
              tags$strong("Los diseños secuenciales requieren paquetes no disponibles en WASM."),
              " Usa ", tags$code("gsDesign"), " o ", tags$code("rpact"),
              " en R local con el código de ejemplo en la guía arriba."
            )
          ),
          bslib::card(
            bslib::card_header("Recursos para diseños secuenciales"),
            bslib::card_body(
              tags$ul(
                class = "mb-0",
                tags$li(
                  tags$code("gsDesign"), " — ",
                  tags$a("keaven.github.io/gsDesign",
                    href = "https://keaven.github.io/gsDesign/", target = "_blank"
                  )
                ),
                tags$li(
                  tags$code("rpact"), " — ",
                  tags$a("www.rpact.org",
                    href = "https://www.rpact.org", target = "_blank"
                  )
                ),
                tags$li(
                  "Tutorial AGILE: ",
                  tags$a("doi.org/10.1186/s12874-022-01593-x",
                    href = "https://doi.org/10.1186/s12874-022-01593-x",
                    target = "_blank"
                  )
                )
              )
            )
          )
        )
      )

    } else if (strategy == "prior") {
      tagList(
        div(class = "container-lg py-2", strategy_details_es$prior()),
        div(
          class = "container-lg py-4",
          bslib::card(
            bslib::card_header("Recursos para replicaciones"),
            bslib::card_body(
              tags$ul(
                class = "mb-0",
                tags$li(
                  "Small Telescopes (Simonsohn, 2015): ",
                  tags$a("doi.org/10.1177/0956797614567341",
                    href = "https://doi.org/10.1177/0956797614567341/", target = "_blank"
                  )
                ),
                tags$li(
                  tags$code("metafor"), " — meta-análisis con corrección de sesgo: ",
                  tags$a("metafor-project.org",
                    href = "https://www.metafor-project.org/", target = "_blank"
                  )
                ),
                tags$li(
                  tags$code("puniform"), " — corrección de sesgo de publicación: ",
                  tags$a("CRAN",
                    href = "https://cran.r-project.org/package=puniform",
                    target = "_blank"
                  )
                )
              )
            )
          )
        )
      )

    } else {
      NULL
    }
  })

  # Calculadora de precisión: N por Fisher-z (reactiva al slider, sin botón)
  output$precision_result_ui <- renderUI({
    req(input$prec_epsilon, input$prec_conf)
    eps <- as.numeric(input$prec_epsilon)
    conf <- as.numeric(input$prec_conf)
    z_c <- qnorm(1 - (1 - conf) / 2)
    n <- ceiling((z_c / eps)^2 + 3)
    bslib::value_box(
      title = paste0(
        "N requerido (IC ", round(conf * 100),
        " %, epsilon = ±", eps, ")"
      ),
      value = n,
      showcase = bsicons::bs_icon("people-fill"),
      theme = "primary"
    )
  })

  # Calculadora inversa de poder (reactiva a los inputs, sin botón)
  output$cost_result_ui <- renderUI({
    req(input$cost_n, input$cost_alpha, input$cost_effect, input$cost_design)
    n <- input$cost_n
    alpha <- input$cost_alpha
    effect <- input$cost_effect
    design <- input$cost_design
    k <- if (!is.null(input$cost_groups)) input$cost_groups else 3

    res <- tryCatch(
      switch(design,
        "t_ind" = {
          pw <- pwr::pwr.t.test(
            n = n, d = effect, sig.level = alpha,
            type = "two.sample"
          )$power
          mde <- pwr::pwr.t.test(
            n = n, sig.level = alpha, power = 0.80,
            type = "two.sample"
          )$d
          list(power = pw, mde = mde, mde_label = "d (Cohen)", n_label = "por grupo")
        },
        "t_paired" = {
          pw <- pwr::pwr.t.test(
            n = n, d = effect, sig.level = alpha,
            type = "paired"
          )$power
          mde <- pwr::pwr.t.test(
            n = n, sig.level = alpha, power = 0.80,
            type = "paired"
          )$d
          list(power = pw, mde = mde, mde_label = "d (Cohen)", n_label = "pares")
        },
        "corr" = {
          pw <- pwr::pwr.r.test(n = n, r = effect, sig.level = alpha)$power
          mde <- pwr::pwr.r.test(n = n, sig.level = alpha, power = 0.80)$r
          list(power = pw, mde = mde, mde_label = "r (Pearson)", n_label = "total")
        },
        "anova" = {
          pw <- pwr::pwr.anova.test(
            k = k, n = n, f = effect,
            sig.level = alpha
          )$power
          mde <- pwr::pwr.anova.test(
            k = k, n = n, sig.level = alpha,
            power = 0.80
          )$f
          list(power = pw, mde = mde, mde_label = "f (Cohen)", n_label = "por grupo")
        }
      ),
      error = function(e) list(error = e$message)
    )

    if (!is.null(res$error)) {
      return(div(class = "alert alert-danger small", res$error))
    }

    power_theme <- if (res$power >= 0.80) "success" else if (res$power >= 0.50) "warning" else "danger"

    tagList(
      bslib::layout_columns(
        col_widths = c(6, 6),
        bslib::value_box(
          title    = paste0("Poder con N = ", n, " (", res$n_label, ")"),
          value    = paste0(round(res$power * 100, 1), "%"),
          showcase = bsicons::bs_icon("bar-chart-fill"),
          theme    = power_theme
        ),
        bslib::value_box(
          title    = paste0("MDE al 80 %: ", res$mde_label),
          value    = round(res$mde, 3),
          showcase = bsicons::bs_icon("bullseye"),
          theme    = "secondary"
        )
      ),
      if (res$power < 0.80) {
        div(
          class = "alert alert-warning small mt-2",
          "Con este N el poder es ",
          paste0(round(res$power * 100, 1), "%"),
          " — inferior al umbral convencional del 80 %. Considera si el
           estudio puede responder de forma informativa a tus preguntas de
           investigación."
        )
      }
    )
  })
}

shinyApp(ui, server)
