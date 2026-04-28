# R/mod_tree.R

step_labels <- list(
  type  = "Tipo de estudio",
  quant = "Cuantitativo",
  qual  = "Cualitativo",
  done  = "Resultado"
)

choice_btn <- function(id, label, color = "primary") {
  actionButton(id, label,
    class = paste0("btn btn-outline-", color, " jn-choice-btn w-100"))
}

mod_tree_ui <- function(id, initial_step = "type") {
  ns <- NS(id)
  heading <- switch(initial_step,
    type  = i18n("tree_heading"),
    quant = "Estrategia cuantitativa",
    qual  = "Estrategia cualitativa"
  )
  tagList(
    div(class = "container-lg py-4",
      div(class = "row g-4",

        # Panel izquierdo: preguntas
        div(class = "col-lg-5",
          h2(heading, class = "mb-1"),
          p(class = "text-muted small mb-3", i18n("tree_lead")),
          uiOutput(ns("breadcrumb_ui")),
          uiOutput(ns("question_ui")),
          uiOutput(ns("restart_btn"))
        ),

        # Panel derecho: resultado
        div(class = "col-lg-7",
          uiOutput(ns("result_ui"))
        )
      )
    )
  )
}

mod_tree_server <- function(id, initial_step = "type") {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    state <- reactiveValues(
      step     = initial_step,
      history  = character(0),
      strategy = NULL
    )

    observeEvent(input$restart, {
      state$step     <- initial_step
      state$history  <- character(0)
      state$strategy <- NULL
    })

    go <- function(next_step, strategy = NULL) {
      state$history  <- c(state$history, state$step)
      state$step     <- next_step
      state$strategy <- strategy
    }

    output$restart_btn <- renderUI({
      if (state$step == initial_step && length(state$history) == 0) return(NULL)
      actionButton(ns("restart"),
        tagList(bsicons::bs_icon("arrow-counterclockwise"), " ",
                i18n("tree_restart")),
        class = "btn jn-restart-btn mt-3")
    })

    output$breadcrumb_ui <- renderUI({
      hist <- c(state$history, state$step)
      labels <- sapply(hist, function(s) step_labels[[s]] %||% s)
      items <- lapply(seq_along(labels), function(i) {
        if (i < length(labels))
          tagList(tags$span(class = "text-muted", labels[[i]]),
                  tags$span(class = "sep mx-1 text-muted", "\u203a"))
        else
          tags$span(class = "fw-semibold", labels[[i]])
      })
      div(class = "jn-breadcrumb mb-3", items)
    })

    output$question_ui <- renderUI({
      switch(state$step,

        "type" = bslib::card(bslib::card_body(
          div(class = "jn-question-label", i18n("tree_q_type")),
          div(class = "d-grid gap-2",
            choice_btn(ns("pick_quant"), paste0("\U0001F4CA  ", i18n("tree_opt_quant")), "primary"),
            choice_btn(ns("pick_qual"),  paste0("\U0001F465  ", i18n("tree_opt_qual")),  "success"),
            choice_btn(ns("pick_mixed"), paste0("\U0001F500  ", i18n("tree_opt_mixed")), "warning")
          )
        )),

        "quant" = bslib::card(bslib::card_body(
          div(class = "jn-question-label", "\u00BFCu\u00e1l es el objetivo principal del estudio?"),
          div(class = "d-grid gap-2",
            choice_btn(ns("q_confirm"),     "Confirmatorio \u2014 prueba de hip\u00f3tesis"),
            choice_btn(ns("q_descriptive"), "Descriptivo \u2014 estimaci\u00f3n de par\u00e1metros"),
            choice_btn(ns("q_sequential"),  "Datos costosos o escasos"),
            choice_btn(ns("q_prior"),       "Replicaci\u00f3n o comparabilidad"),
            choice_btn(ns("q_cost"),        "\u26a0\ufe0f  Recursos o tiempo muy limitados")
          )
        )),

        "qual" = bslib::card(bslib::card_body(
          div(class = "jn-question-label", "\u00bfCu\u00e1l describe mejor tu enfoque cualitativo?"),
          div(class = "d-grid gap-2",
            choice_btn(ns("qual_sat"), "Exploratorio / Tem\u00e1tico / Teor\u00eda fundamentada", "success"),
            choice_btn(ns("qual_div"), "M\u00faltiples subgrupos o perspectivas", "success"),
            choice_btn(ns("qual_com"), "Investigaci\u00f3n participativa (CBPR)", "success"),
            choice_btn(ns("qual_nar"), "Caso \u00fanico / Etnograf\u00eda", "success"),
            choice_btn(ns("qual_eth"), "Comunidades vulnerables", "success")
          )
        )),

        "done" = NULL
      )
    })

    # Navegación
    observeEvent(input$pick_quant,    go("quant"))
    observeEvent(input$pick_qual,     go("qual"))
    observeEvent(input$pick_mixed,    go("done", "mixed"))
    observeEvent(input$q_confirm,     go("done", "sesoi"))
    observeEvent(input$q_descriptive, go("done", "precision"))
    observeEvent(input$q_sequential,  go("done", "sequential"))
    observeEvent(input$q_prior,       go("done", "prior"))
    observeEvent(input$q_cost,        go("done", "cost"))
    observeEvent(input$qual_sat,      go("done", "saturation"))
    observeEvent(input$qual_div,      go("done", "diversity"))
    observeEvent(input$qual_com,      go("done", "community"))
    observeEvent(input$qual_nar,      go("done", "narrative"))
    observeEvent(input$qual_eth,      go("done", "ethics"))

    output$result_ui <- renderUI({
      req(state$strategy)
      s    <- strategies[[state$strategy]]
      type <- s$type

      accent <- switch(type,
        quant = list(bg = "#ede9fe", color = "#4f46e5", label = "Cuantitativa"),
        qual  = list(bg = "#d1fae5", color = "#059669", label = "Cualitativa"),
        mixed = list(bg = "#fef3c7", color = "#d97706", label = "Mixta")
      )

      warn_ui <- if (isTRUE(s$warning)) {
        div(class = "alert alert-warning d-flex gap-2 align-items-start small mt-3 mb-0",
          tags$span("\u26a0\ufe0f"),
          div(i18n(s$warn_key))
        )
      }

      tools_ui <- if (length(s$tools) > 0) {
        tagList(
          p(class = "text-muted small mb-1 fw-semibold", "Herramientas R"),
          div(lapply(s$tools, function(t) tags$span(class = "jn-tools-pill", t)))
        )
      }

      refs_ui <- if (length(s$refs) > 0) {
        tagList(
          p(class = "text-muted small mb-1 fw-semibold mt-3", "Referencias clave"),
          tags$ul(class = "small ps-3 mb-0",
            lapply(s$refs, function(key) tags$li(cite_ref(key))))
        )
      }

      detail_content <- strategy_details_es[[state$strategy]]
      detail_ui <- if (!is.null(detail_content)) {
        div(class = "mt-3", detail_content())
      }

      tagList(
        bslib::card(
          bslib::card_header(
            div(class = "d-flex align-items-center gap-2",
              div(class = "jn-result-badge",
                  style = paste0("background:", accent$bg, "; color:", accent$color),
                  accent$label),
              span(i18n("tree_result_head"))
            )
          ),
          bslib::card_body(
            h4(class = "mb-1", s$name_es),
            p(class = "text-muted mb-0", s$when_es),
            warn_ui,
            {if (length(s$tools) > 0 || length(s$refs) > 0) hr(class = "my-3")},
            tools_ui,
            refs_ui
          )
        ),
        detail_ui
      )
    })

    reactive(state$strategy)
  })
}
