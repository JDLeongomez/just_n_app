# R/mod_quant.R

mod_quant_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(class = "container-lg py-4",
      div(class = "mb-3",
        h2(i18n("quant_heading"), class = "mb-1"),
        p(class = "text-muted", i18n("quant_lead"))
      ),
      bslib::layout_columns(
        col_widths = c(4, 8),

        # ── Columna izquierda: controles ──
        tagList(
          bslib::card(
            class = "jn-controls-card",
            bslib::card_header("Parámetros"),
            bslib::card_body(
              selectInput(ns("design"), i18n("quant_select"),
                choices = c(
                  `Correlación de Pearson` = "corr",
                  `Prueba t independiente` = "t_ind",
                  `Prueba t pareada`       = "t_paired",
                  `ANOVA de una vía`       = "anova"
                )
              ),
              uiOutput(ns("effect_ui")),
              div(class = "row g-2",
                div(class = "col-6",
                  numericInput(ns("alpha"), HTML("&alpha;"), value = 0.05,
                               min = 0.001, max = 0.2, step = 0.005)
                ),
                div(class = "col-6",
                  numericInput(ns("power_target"), HTML("1&minus;&beta;"), value = 0.80,
                               min = 0.5, max = 0.99, step = 0.01)
                )
              ),
              uiOutput(ns("extra_ui")),
              actionButton(ns("calc"), i18n("quant_calc"),
                           class = "btn btn-primary w-100 mt-1",
                           icon = icon("calculator"))
            )
          ),
          bslib::accordion(
            class = "mt-2",
            bslib::accordion_panel(
              title = "¿Qué es poder estadístico?",
              icon  = bsicons::bs_icon("info-circle"),
              div(class = "small", strategy_details_es$what_is_power())
            ),
            bslib::accordion_panel(
              title = i18n("quant_effect_tip"),
              icon  = bsicons::bs_icon("question-circle"),
              div(class = "small",
                p(class = "fw-semibold mb-1", "Prioriza en este orden:"),
                tags$ol(class = "ps-3 mb-2",
                  tags$li(HTML("<strong>SESOI</strong> definido a priori — la opción más sólida.")),
                  tags$li("Meta-análisis o estudios previos de alta calidad."),
                  tags$li(HTML("Convenciones de Cohen <em>solo como último recurso</em>."))
                ),
                div(class = "alert alert-warning small p-2 mb-0",
                  HTML(paste0("\u26a0\ufe0f ", i18n("quant_cohen_warn"))))
              )
            ),
            open = FALSE
          ),
          div(class = "alert alert-info small mt-2 mb-0",
            bsicons::bs_icon("info-circle"), " ", i18n("quant_complex"))
        ),

        # ── Columna derecha: resultado + gráfico ──
        tagList(
          uiOutput(ns("result_ui")),
          bslib::card(
            class = "mt-3",
            bslib::card_header("Curva de poder estadístico"),
            bslib::card_body(class = "jn-plot-area p-2",
              plotOutput(ns("power_plot"), height = "360px")
            )
          )
        )
      ),

      # ── Contexto metodológico (ancho completo) ──────────────────────────────
      bslib::accordion(
        class = "mt-4",
        bslib::accordion_panel(
          title = "SESOI: cómo determinar el efecto mínimo de interés",
          icon  = bsicons::bs_icon("bullseye"),
          strategy_details_es$sesoi()
        ),
        bslib::accordion_panel(
          title = "Efectos de literatura previa: riesgos y alternativas",
          icon  = bsicons::bs_icon("exclamation-triangle"),
          strategy_details_es$prior()
        ),
        open = FALSE
      )
    )
  )
}

mod_quant_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$effect_ui <- renderUI({
      switch(
        input$design,
        "corr"     = sliderInput(ns("effect"), i18n("quant_r_label"),
                                 min = -0.99, max = 0.99, value = 0.30, step = 0.01),
        "t_ind"    = ,
        "t_paired" = sliderInput(ns("effect"), i18n("quant_d_label"),
                                 min = 0.01, max = 2.0, value = 0.50, step = 0.01),
        "anova"    = sliderInput(ns("effect"), i18n("quant_f_label"),
                                 min = 0.01, max = 1.5, value = 0.25, step = 0.01)
      )
    })

    output$extra_ui <- renderUI({
      if (input$design == "anova") {
        numericInput(ns("groups"), i18n("quant_groups"),
                     value = 3, min = 2, max = 20, step = 1)
      } else {
        alt_choices <- c(
          "Bilateral (H\u2081: \u2260 0)"          = "two.sided",
          "Direccional positiva (H\u2081: > 0)" = "greater",
          "Direccional negativa (H\u2081: < 0)" = "less"
        )
        radioButtons(ns("alternative"), i18n("quant_tails"), choices = alt_choices)
      }
    })

    result <- eventReactive(input$calc, {
      req(input$effect, input$alpha, input$power_target)
      e  <- input$effect
      a  <- input$alpha
      pw <- input$power_target
      alt <- if (!is.null(input$alternative)) input$alternative else "two.sided"

      tryCatch(
        switch(
          input$design,
          "corr" = {
            res <- pwr::pwr.r.test(r = e, sig.level = a, power = pw, alternative = alt)
            list(n = ceiling(res$n), label = i18n("quant_total"),
                 design = "corr", e = e, a = a, alt = alt, k = NULL)
          },
          "t_ind" = {
            res <- pwr::pwr.t.test(d = e, sig.level = a, power = pw,
                                   type = "two.sample", alternative = alt)
            list(n = ceiling(res$n), label = i18n("quant_per_group"),
                 design = "t_ind", e = e, a = a, alt = alt, k = NULL)
          },
          "t_paired" = {
            res <- pwr::pwr.t.test(d = e, sig.level = a, power = pw,
                                   type = "paired", alternative = alt)
            list(n = ceiling(res$n), label = i18n("quant_pairs"),
                 design = "t_paired", e = e, a = a, alt = alt, k = NULL)
          },
          "anova" = {
            k   <- if (!is.null(input$groups)) input$groups else 3
            res <- pwr::pwr.anova.test(k = k, f = e, sig.level = a, power = pw)
            list(n = ceiling(res$n), label = i18n("quant_per_group"),
                 design = "anova", e = e, a = a, alt = "two.sided", k = k)
          }
        ),
        error = function(err) list(error = conditionMessage(err))
      )
    })

    output$result_ui <- renderUI({
      res <- result()
      if (!is.null(res$error)) {
        return(div(class = "alert alert-danger", res$error))
      }
      bslib::value_box(
        title    = paste(i18n("quant_result_n"), res$label),
        value    = res$n,
        showcase = bsicons::bs_icon("people-fill"),
        theme    = "primary"
      )
    })

    # Función auxiliar para calcular poder puntual según diseño
    calc_power_at_n <- function(n, res) {
      switch(
        res$design,
        "corr"     = pwr::pwr.r.test(n = n, r = res$e, sig.level = res$a,
                                      alternative = res$alt)$power,
        "t_ind"    = pwr::pwr.t.test(n = n, d = res$e, sig.level = res$a,
                                      type = "two.sample",
                                      alternative = res$alt)$power,
        "t_paired" = pwr::pwr.t.test(n = n, d = res$e, sig.level = res$a,
                                      type = "paired",
                                      alternative = res$alt)$power,
        "anova"    = pwr::pwr.anova.test(k = res$k, n = n, f = res$e,
                                          sig.level = res$a)$power
      )
    }

    output$power_plot <- renderPlot({
      res <- result()
      req(!is.null(res) && is.null(res$error))

      half      <- max(60, round(res$n * 0.6))
      ns_range  <- seq(max(5, res$n - half), res$n + half, length.out = 120)
      pw_vals   <- sapply(ns_range, calc_power_at_n, res = res)
      shade_idx <- which(ns_range <= res$n)

      op <- par(
        bg = "transparent", mar = c(4, 5, 1, 1), family = "sans",
        col.axis = "#64748b", col.lab = "#64748b", fg = "#64748b"
      )
      on.exit(par(op))

      plot(ns_range, pw_vals, type = "n",
           xlim = range(ns_range), ylim = c(0, 1),
           xlab = "Tama\u00f1o de muestra (N)",
           ylab = "Poder estad\u00edstico (1 \u2212 \u03b2)",
           yaxt = "n", bty = "l")

      axis(2, at = seq(0, 1, 0.2),
           labels = paste0(seq(0, 100, 20), "%"),
           col.axis = "#64748b", las = 1)

      abline(h = seq(0, 1, 0.2), col = "#e2e4f0", lty = 1, lwd = 0.8)
      abline(v = pretty(ns_range, n = 6), col = "#e2e4f0", lty = 1, lwd = 0.8)

      polygon(
        c(ns_range[shade_idx], rev(ns_range[shade_idx])),
        c(pw_vals[shade_idx],  rep(0, length(shade_idx))),
        col = adjustcolor("#4f46e5", alpha.f = 0.08), border = NA
      )

      lines(ns_range, pw_vals, col = "#4f46e5", lwd = 2)
      abline(h = input$power_target, lty = 2, col = "#94a3b8", lwd = 1.5)
      abline(v = res$n,              lty = 3, col = "#059669", lwd = 1.8)

      points(res$n, input$power_target,
             col = "#059669", pch = 21, bg = "white", cex = 2.5, lwd = 2)

      text(res$n, 0.10,
           labels = paste0("N = ", res$n),
           col = "#059669", font = 2, cex = 0.85, adj = c(-0.1, 0.5))

      text(min(ns_range) + diff(range(ns_range)) * 0.01,
           input$power_target + 0.05,
           labels = paste0("Poder objetivo = ",
                           round(input$power_target * 100), "%"),
           col = "#64748b", cex = 0.80, adj = c(0, 0))
    }, bg = "transparent")
  })
}
