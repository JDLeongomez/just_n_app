# R/mod_mixed.R

mod_mixed_ui <- function(id) {
  ns <- NS(id)
  s  <- strategies[["mixed"]]
  tagList(
    div(class = "container-lg py-4",
      h2("Diseño mixto", class = "mb-1"),
      p(class = "lead", s$when_es),
      hr(),
      strategy_details_es$mixed(),
      if (length(s$refs) > 0) tagList(
        hr(class = "mt-4 mb-2"),
        p(class = "fw-semibold small text-muted mb-1", "Referencias clave"),
        tags$ul(class = "small ps-3 mb-0",
          lapply(s$refs, function(key) tags$li(cite_ref(key))))
      )
    )
  )
}

mod_mixed_server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}
