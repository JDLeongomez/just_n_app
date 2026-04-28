# R/mod_intro.R

mod_intro_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(class = "container-lg py-4",

      # Hero
      div(class = "jn-hero",
        div(class = "d-flex align-items-center gap-4 flex-wrap",
          tags$img(
            src   = "just-n-logo.svg",
            class = "jn-hero-logo flex-shrink-0",
            alt   = "Just-N logo"
          ),
          div(
            h1(i18n("app_title")),
            p(class = "lead mt-2", i18n("intro_lead")),
            tags$a(
              class = "badge-doi",
              href  = "https://doi.org/10.5281/zenodo.19860616",
              target = "_blank",
              "\U0001F517 DOI: 10.5281/zenodo.19860616"
            )
          )
        )
      ),

      # Tres tipos de estudio
      div(class = "row g-3 mb-4",
        div(class = "col-md-4",
          div(class = "jn-feature-card jn-tab-link",
              onclick = "Shiny.setInputValue('go_tab', 'Cuantitativo', {priority: 'event'})",
            div(class = "jn-feature-icon",
                style = "background:#ede9fe; color:#4f46e5;", "\U0001F4CA"),
            h5("Cuantitativo"),
            p("Poder estadístico, precisión, SESOI, diseños secuenciales y más. Calculadoras integradas."),
            div(class = "jn-tab-link-hint", bsicons::bs_icon("arrow-right-circle"), " Ir a Cuantitativo")
          )
        ),
        div(class = "col-md-4",
          div(class = "jn-feature-card jn-tab-link",
              onclick = "Shiny.setInputValue('go_tab', 'Cualitativo', {priority: 'event'})",
            div(class = "jn-feature-icon",
                style = "background:#d1fae5; color:#059669;", "\U0001F465"),
            h5("Cualitativo"),
            p("Saturación, diversidad, muestreo comunitario, justificación narrativa y compromisos éticos."),
            div(class = "jn-tab-link-hint", style = "color:#059669;",
                bsicons::bs_icon("arrow-right-circle"), " Ir a Cualitativo")
          )
        ),
        div(class = "col-md-4",
          div(class = "jn-feature-card jn-tab-link",
              onclick = "Shiny.setInputValue('go_tab', 'Mixto', {priority: 'event'})",
            div(class = "jn-feature-icon",
                style = "background:#fef3c7; color:#d97706;", "\U0001F500"),
            h5("Mixto"),
            p("Complementariedad cuanti–cuali en diseños que integran ambos componentes."),
            div(class = "jn-tab-link-hint", style = "color:#d97706;",
                bsicons::bs_icon("arrow-right-circle"), " Ir a Mixto")
          )
        )
      ),

      # Por qué justificar el tamaño de muestra
      bslib::accordion(
        class = "mb-4",
        bslib::accordion_panel(
          title = "¿Por qué justificar el tamaño de muestra?",
          icon  = bsicons::bs_icon("question-circle"),
          strategy_details_es$intro_importance()
        ),
        open = TRUE
      ),

      # Cómo funciona
      div(class = "row g-4 mb-4",
        div(class = "col-lg-6",
          bslib::card(
            bslib::card_header(i18n("intro_how")),
            bslib::card_body(
              div(class = "jn-steps",
                div(class = "jn-step",
                  div(class = "jn-step-num"),
                  div(class = "jn-step-body",
                    tags$strong("Selecciona tu tipo de estudio"),
                    "Ve a la pestaña Cuantitativo, Cualitativo o Mixto según tu diseño."
                  )
                ),
                div(class = "jn-step",
                  div(class = "jn-step-num"),
                  div(class = "jn-step-body",
                    tags$strong("Sigue el árbol de decisiones"),
                    "Responde las preguntas paso a paso. Recibirás una guía detallada
                     con criterios, herramientas R y referencias para tu estrategia."
                  )
                ),
                div(class = "jn-step",
                  div(class = "jn-step-num"),
                  div(class = "jn-step-body",
                    tags$strong("Usa las herramientas interactivas"),
                    "Para estudios cuantitativos, aparecen calculadoras adaptadas a tu
                     objetivo: poder (SESOI), precisión por IC, análisis inverso de poder,
                     y más."
                  )
                ),
                div(class = "jn-step",
                  div(class = "jn-step-num"),
                  div(class = "jn-step-body",
                    tags$strong("Monte Carlo para diseños complejos"),
                    "Al final de la pestaña Cuantitativo encontrarás código comentado
                     para estimar poder por simulación cuando los paquetes estándar no
                     cubren tu diseño."
                  )
                )
              )
            )
          )
        ),
        div(class = "col-lg-6",
          bslib::card(
            bslib::card_header(i18n("intro_cite")),
            bslib::card_body(
              p(class = "small text-muted mb-2", "Si usas esta app en tu investigación, cita:"),
              div(class = "p-3 rounded",
                  style = "background:#f8f9ff; border-left:3px solid #4f46e5; font-size:0.85rem;",
                i18n("app_doi")
              ),
              hr(style = "margin:1rem 0;"),
              div(class = "d-flex align-items-center gap-2 mb-2",
                tags$strong("Juan David Leongómez"),
                tags$a(
                  href  = "https://orcid.org/0000-0002-0092-6298",
                  target = "_blank",
                  title = "ORCID: 0000-0002-0092-6298",
                  tags$img(src = "orcid_logo.svg", height = "20px",
                           alt = "ORCID iD", style = "vertical-align:middle;")
                )
              ),
              p(class = "small text-muted mb-1",
                "Laboratorio de Evolución del Comportamiento Humano (EvoCo / CODEC)"
              ),
              p(class = "small text-muted mb-1",
                tags$a(
                  href = "https://www.unbosque.edu.co", target = "_blank",
                  style = "color:inherit;",
                  "Universidad El Bosque"
                ),
                ", Bogotá, Colombia"
              ),
              p(class = "small mb-0",
                tags$a(
                  href = "mailto:jleongomez@unbosque.edu.co",
                  class = "text-muted",
                  bsicons::bs_icon("envelope"), " jleongomez@unbosque.edu.co"
                )
              )
            )
          )
        )
      )
    )
  )
}

mod_intro_server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}
