# R/i18n.R
# Uso: i18n("key") devuelve el string en el idioma activo (opción "just_n_lang")

`%||%` <- function(x, y) if (!is.null(x)) x else y

i18n <- function(key, lang = getOption("just_n_lang", "es")) {
  strings <- if (lang == "es") strings_es else strings_en
  strings[[key]] %||% paste0("[", key, "]")
}
