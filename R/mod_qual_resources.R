# R/mod_qual_resources.R
# Sección educativa fija para la pestaña Cualitativo:
# criterios de rigor y guías de reporte.

mod_qual_resources_ui <- function(id) {
  tagList(
    div(
      class = "jn-section-break container-lg",
      tags$hr(class = "jn-section-hr"),
      div(
        class = "jn-section-tag",
        bsicons::bs_icon("award"), " Rigor y reporte"
      )
    ),
    div(
      class = "container-lg pb-5",
      div(
        class = "row g-4",

        # ── Criterios de rigor ──────────────────────────────────────────────
        div(
          class = "col-lg-6",
          bslib::card(
            bslib::card_header(
              div(
                class = "d-flex align-items-center gap-2",
                bsicons::bs_icon("shield-check"),
                tagList(
                  "Criterios de rigor ",
                  cite_ref("lincolnItRigorousTrustworthiness1986")
                )
              )
            ),
            bslib::card_body(
              p(
                class = "small text-muted mb-3",
                "El rigor en investigación cualitativa no se evalúa con los mismos
                 criterios que la investigación cuantitativa. Lincoln & Guba proponen cuatro criterios de ", tags$em("trustworthiness"),
                cite_ref("lincolnItRigorousTrustworthiness1986"),
                ":"
              ),
              tags$table(
                class = "table table-sm table-bordered small",
                tags$thead(
                  class = "table-light",
                  tags$tr(
                    tags$th("Criterio"),
                    tags$th("Equivale a"),
                    tags$th("Estrategias clave")
                  )
                ),
                tags$tbody(
                  tags$tr(
                    tags$td(tags$strong("Credibilidad")),
                    tags$td("Validez interna"),
                    tags$td("Triangulación, member checking, descripción densa")
                  ),
                  tags$tr(
                    tags$td(tags$strong("Transferibilidad")),
                    tags$td("Validez externa"),
                    tags$td("Descripción densa del contexto y la muestra")
                  ),
                  tags$tr(
                    tags$td(tags$strong("Dependabilidad")),
                    tags$td("Fiabilidad"),
                    tags$td("Auditoría del proceso, documentación")
                  ),
                  tags$tr(
                    tags$td(tags$strong("Confirmabilidad")),
                    tags$td("Objetividad"),
                    tags$td("Reflexividad, auditoría de datos")
                  )
                )
              ),
              div(
                class = "alert alert-light border small mt-2 mb-0",
                bsicons::bs_icon("info-circle"), " ",
                "Una justificación sólida del tamaño de muestra contribuye
                 directamente a la ", tags$strong("credibilidad"), " y la ",
                tags$strong("transferibilidad"), " del estudio."
              )
            )
          )
        ),

        # ── Guías de reporte ────────────────────────────────────────────────
        div(
          class = "col-lg-6",
          bslib::card(
            bslib::card_header(
              div(
                class = "d-flex align-items-center gap-2",
                bsicons::bs_icon("file-earmark-check"),
                "Guías de reporte recomendadas"
              )
            ),
            bslib::card_body(
              p(
                class = "small text-muted mb-3",
                "Las guías de reporte indican qué información debe incluirse
                 al publicar investigación cualitativa. Muchas revistas las
                 exigen como parte del proceso editorial."
              ),
              tags$table(
                class = "table table-sm table-bordered small",
                tags$thead(
                  class = "table-light",
                  tags$tr(
                    tags$th("Guía"),
                    tags$th("Para qué diseño"),
                    tags$th("Referencia")
                  )
                ),
                tags$tbody(
                  tags$tr(
                    tags$td(
                      tags$strong("COREQ"), tags$br(),
                      tags$span(class = "text-muted", style = "font-size:0.85em;",
                        "Consolidated Criteria for Reporting Qualitative Research")
                    ),
                    tags$td("Entrevistas y grupos focales"),
                    tags$td(cite_ref("tongConsolidatedCriteriaReporting2007"))
                  ),
                  tags$tr(
                    tags$td(
                      tags$strong("SRQR"), tags$br(),
                      tags$span(class = "text-muted", style = "font-size:0.85em;",
                        "Standards for Reporting Qualitative Research")
                    ),
                    tags$td("Investigación cualitativa general"),
                    tags$td(cite_ref("obrienStandardsReportingQualitative2014"))
                  ),
                  tags$tr(
                    tags$td(
                      tags$strong("ENTREQ"), tags$br(),
                      tags$span(class = "text-muted", style = "font-size:0.85em;",
                        "Enhancing Transparency in Reporting the Synthesis of Qualitative Research")
                    ),
                    tags$td("Síntesis cualitativa"),
                    tags$td(cite_ref("tongEnhancingTransparencyReporting2012"))
                  ),
                  tags$tr(
                    tags$td(
                      tags$strong("GRAMMS"), tags$br(),
                      tags$span(class = "text-muted", style = "font-size:0.85em;",
                        "Good Reporting of A Mixed Methods Study")
                    ),
                    tags$td("Diseños mixtos"),
                    tags$td(cite_ref("ocathainQualityMixedMethods2008"))
                  )
                )
              ),
              div(
                class = "alert alert-light border small mt-2 mb-0",
                bsicons::bs_icon("search"), " Busca el checklist de cada guía en ",
                tags$a("EQUATOR Network",
                  href = "https://www.equator-network.org",
                  target = "_blank"
                ),
                " para acceder a checklists descargables."
              )
            )
          )
        )
      )
    )
  )
}

mod_qual_resources_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
