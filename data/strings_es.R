# data/strings_es.R
# Todos los strings visibles al usuario en español.
# Nunca hardcodear texto en los módulos — usar i18n("key").

strings_es <- list(
  # Navegación
  nav_intro = "Introducción",
  nav_tree = "Árbol de decisiones",
  nav_quant = "Calculadoras",
  nav_qual = "Guías cualitativas",
  nav_montecarlo = "Monte Carlo",

  # Encabezado / footer
  app_title = "Just-N Framework: Aplicación Interactiva",
  app_subtitle = "Just-N Framework",
  app_doi = "Leongómez, J. D. (2026). Just-N Framework: Aplicación Interactiva (v1.0). Zenodo. https://doi.org/10.5281/zenodo.19860616",
  footer_author = "Juan David Leongómez — Universidad El Bosque, Bogotá",

  # Módulo: Introducción
  intro_heading = "¿Por qué justificar el tamaño de muestra?",
  intro_lead = paste0(
    "Elegir cuántos participantes incluir en un estudio es una de las decisiones ",
    "metodológicas más importantes (y frecuentemente mal justificadas) en ",
    "la investigación científica. Just-N Framework ofrece una ruta estructurada ",
    "para tomar esa decisión de forma transparente y rigurosa, independientemente ",
    "de la disciplina o el diseño del estudio."
  ),
  intro_how = "¿Cómo usar esta app?",
  intro_how_body = paste0(
    "Comienza en el Árbol de decisiones para identificar qué estrategia se adapta ",
    "mejor a tu estudio. Si tu diseño es cuantitativo, las Calculadoras te darán ",
    "el N recomendado con su curva de poder. Para diseños cualitativos o mixtos, ",
    "las Guías te orientan con criterios claros. La sección Monte Carlo muestra ",
    "cómo abordar diseños más complejos mediante simulación."
  ),
  intro_cite = "Cómo citar",

  # Módulo: Árbol de decisiones
  tree_heading = "Árbol de decisiones",
  tree_lead = "Responde las preguntas paso a paso para identificar la estrategia más adecuada para tu estudio.",
  tree_q_type = "¿Qué tipo de estudio estás planeando?",
  tree_opt_quant = "Cuantitativo",
  tree_opt_qual = "Cualitativo",
  tree_opt_mixed = "Mixto (cuantitativo + cualitativo)",
  tree_restart = "Comenzar de nuevo",
  tree_result_head = "Estrategia recomendada",

  # Módulo: Calculadoras cuantitativas
  quant_heading = "Calculadoras cuantitativas",
  quant_lead = "Calcula el tamaño de muestra necesario para diseños cuantitativos comunes.",
  quant_select = "Selecciona el diseño:",
  quant_corr = "Correlación de Pearson",
  quant_t_ind = "Prueba t independiente",
  quant_t_paired = "Prueba t pareada",
  quant_anova = "ANOVA de una vía",
  quant_alpha = "Nivel de significancia (α)",
  quant_power = "Poder objetivo (1 − β)",
  quant_effect = "Tamaño de efecto esperado",
  quant_r_label = "Correlación esperada (r)",
  quant_d_label = "d de Cohen esperado",
  quant_f_label = "f de Cohen esperado",
  quant_groups = "Número de grupos",
  quant_tails = "Tipo de prueba",
  quant_two_tail = "Bilateral",
  quant_one_tail = "Unilateral",
  quant_calc = "Calcular",
  quant_result_n = "N recomendado",
  quant_per_group = "(por grupo)",
  quant_pairs = "(pares)",
  quant_total = "(total)",
  quant_effect_tip = "¿Cómo elegir el tamaño de efecto?",
  quant_complex = paste0(
    "Para diseños más complejos (modelos mixtos, ANCOVA, diseños factoriales, ",
    "medidas repetidas), consulta la sección Monte Carlo."
  ),
  quant_cohen_warn = paste0(
    "Advertencia: evita usar las convenciones de Cohen (pequeño/mediano/grande) ",
    "sin justificación. Basa tu estimación en literatura previa o en el SESOI."
  ),

  # Módulo: Guías cualitativas y mixtas
  qual_heading = "Guías para estudios cualitativos y mixtos",
  qual_lead = paste0(
    "En estudios cualitativos y mixtos el tamaño de muestra no se calcula: ",
    "se justifica con criterios teóricos, metodológicos y prácticos. ",
    "Selecciona la estrategia que corresponde a tu diseño."
  ),
  qual_select = "Selecciona la estrategia:",

  # Módulo: Monte Carlo
  mc_heading = "Simulaciones Monte Carlo",
  mc_lead = paste0(
    "Cuando los paquetes estándar como pwr no cubren tu diseño, hay dos opciones: ",
    "paquetes especializados (como Superpower, para ANOVA factoriales) o simulación ",
    "Monte Carlo para cualquier diseño personalizado. ",
    "Esta sección es educativa: el código se muestra pero no se ejecuta en la app."
  ),
  mc_superpower_head = "Opción 1 — Paquete especializado: Superpower (ANOVA factoriales)",
  mc_why_head = "Opción 2 — Simulación Monte Carlo: para diseños sin paquete dedicado",
  mc_principle = "Principio general de la simulación Monte Carlo",
  mc_example = "Ejemplo comentado en R",
  mc_extension = "Extensión a otros diseños complejos",

  # Advertencias generales
  warn_cost = paste0(
    "⚠ Usar el costo o los recursos disponibles como único criterio para fijar N ",
    "es la estrategia menos deseable. Documenta claramente las limitaciones y ",
    "discute el impacto sobre la potencia del estudio."
  )
)
