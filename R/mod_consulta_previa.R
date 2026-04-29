# R/mod_consulta_previa.R
# Tarjeta de aviso sobre Consulta Previa / FPIC, reutilizable en las
# pestañas Cualitativo y Mixto.

consulta_previa_card <- function() {
  div(
    class = "container-lg pt-4 pb-2",
    bslib::card(
      class = "border-warning",
      bslib::card_header(
        style = "background-color: #fffbeb; color: #78350f;",
        div(
          class = "d-flex align-items-center gap-2 fw-semibold",
          bsicons::bs_icon("exclamation-triangle-fill",
            style = "color: #d97706;"
          ),
          "Consulta Previa / CLPI: requisito previo a la definición de la muestra"
        )
      ),
      bslib::card_body(
        p(
          "Si tu investigación involucra comunidades indígenas u otros pueblos
          étnicos reconocidos por la legislación de tu país, la ",
          tags$strong("Consulta Previa"), " (o Consentimiento Libre, Previo e
          Informado — CLPI — en términos internacionales) es un ",
          tags$strong("derecho fundamental"), " que debe completarse ",
          tags$em("antes"), " de definir la muestra. Omitirla es una grave falta ética que puede invalidar por completo el diseño del estudio."
        ),
        tags$ul(
          class = "mb-3",
          tags$li(
            class = "mb-2",
            tags$strong("¿Qué es?"), " Un proceso mediante el cual los
            grupos étnicos son informados y participan en decisiones sobre
            proyectos o investigaciones que los afectan. Va más allá del
            consentimiento individual y puede determinar quiénes participan,
            bajo qué condiciones y cómo se recolectan los datos",
            cite_ref("fitzpatrick2016consent"), "."
          ),
          tags$li(
            class = "mb-2",
            tags$strong("¿Por qué importa para el tamaño de muestra?"),
            " El proceso puede redefinir o restringir quiénes pueden ser
            incluidos. Una muestra definida antes de la consulta puede
            volverse inviable o éticamente inaceptable",
            cite_ref("cancino2024ethics"), "."
          ),
          tags$li(
            tags$strong("¿Consentimiento individual o colectivo?"),
            " La evidencia indica que ambos son necesarios: primero con
            líderes o asambleas comunitarias, luego con individuos.
            Los formularios institucionales estándar suelen ser insuficientes
            y pueden chocar con normas locales y tradiciones orales",
            cite_ref("fitzpatrick2016consent"), "."
          )
        ),
        div(
          class = "alert alert-warning border-warning small mb-2 py-2",
          bsicons::bs_icon("globe-americas"), " ",
          tags$strong("Base legal:"),
          " El Convenio 169 de la OIT establece este derecho en más de 20
          países latinoamericanos (entre ellos Colombia, Bolivia, Perú,
          Ecuador, Chile y México)", cite_ref("barrera2016fpic"), ".",
          " Como ejemplo, en ", tags$strong("Colombia"),
          " el marco legal incluye la Ley 21 de 1991 y el Decreto 1320 de
          1998, y aplica a comunidades indígenas, ROM, afrocolombianas,
          raizales y palenqueras", cite_ref("mininteriorConsultaPrevia"), "."
        ),
        div(
          class = "small text-muted",
          bsicons::bs_icon("link-45deg"), " Ejemplo de recurso institucional: ",
          tags$a(
            "Proceso de Consulta Previa — Ministerio del Interior de Colombia",
            href   = "https://www.mininterior.gov.co/proceso-de-consuta-previa/",
            target = "_blank"
          )
        )
      )
    )
  )
}
