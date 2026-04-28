# R/cite.R
# cite_ref(key)       → cita individual parentética: (Autor, Año)
# cite_refs(c(keys))  → citas agrupadas:             (Autor1, Año1; Autor2, Año2)
# Ambas generan <a> con popover Bootstrap 5 (cita completa + URL copiable).

.cite_link <- function(key) {
  ref <- refs[[key]]
  if (is.null(ref)) {
    return(tags$span(class = "text-muted fst-italic", key))
  }
  url_line <- paste0(
    "<div class='mt-2 pt-2' style='border-top:1px solid #e2e8f0;'>",
    "<a href='", ref$url, "' target='_blank' rel='noopener' ",
    "style='font-size:0.78rem;word-break:break-all;'>",
    ref$url, "</a></div>"
  )
  tags$a(
    href                = ref$url,
    target              = "_blank",
    rel                 = "noopener",
    class               = "jn-cite",
    `data-bs-toggle`    = "popover",
    `data-bs-trigger`   = "hover focus",
    `data-bs-placement` = "top",
    `data-bs-html`      = "true",
    `data-bs-content`   = paste0(ref$full, url_line),
    HTML(ref$short)
  )
}

cite_ref <- function(key) {
  tagList("(", .cite_link(key), ")")
}

cite_refs <- function(keys) {
  n     <- length(keys)
  parts <- lapply(seq_along(keys), function(i) {
    link <- .cite_link(keys[[i]])
    if (i < n) tagList(link, "; ") else link
  })
  tagList("(", parts, ")")
}
