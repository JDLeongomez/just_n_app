# data/strategies.R
# Datos de las 12 estrategias. refs usa claves de data/refs.R.

strategies <- list(

  sesoi = list(
    id      = "sesoi",
    type    = "quant",
    name_es = "SESOI / Pruebas de equivalencia",
    when_es = "Ensayos cl\u00ednicos o confirmatorios con efecto m\u00ednimo de inter\u00e9s definido a priori.",
    tools   = c("TOSTER", "pwr", "pwrss"),
    warning = FALSE,
    refs    = c("lakensEquivalenceTestingPsychological2018", "lakensSampleSizeJustification2022")
  ),

  power = list(
    id       = "power",
    type     = "quant",
    name_es  = "Poder estad\u00edstico a priori",
    when_es  = "Estudios confirmatorios con hip\u00f3tesis cl\u00e1sica; efecto esperado de literatura.",
    tools    = c("pwr", "WebPower", "pwrss"),
    warning  = TRUE,
    warn_key = "warn_power",
    refs     = c("cohen1992power", "buttonPowerFailureWhy2013", "correllAvoidCohensSmall2020",
                 "albersWhenPowerAnalyses2018", "lakensSampleSizeJustification2022")
  ),

  precision = list(
    id      = "precision",
    type    = "quant",
    name_es = "Precisi\u00f3n de estimaciones",
    when_es = "Estudios descriptivos o de estimaci\u00f3n de par\u00e1metros (intervalos de confianza).",
    tools   = c("MBESS", "pwr"),
    warning = FALSE,
    refs    = c("bonett2002sample", "quintanaStatisticalConsiderationsReporting2017",
                "lakensSampleSizeJustification2022")
  ),

  sequential = list(
    id      = "sequential",
    type    = "quant",
    name_es = "Dise\u00f1os secuenciales / adaptativos",
    when_es = "Datos costosos o escasos; posibilidad de detenci\u00f3n anticipada.",
    tools   = c("gsDesign", "rpact"),
    warning = FALSE,
    refs    = c("pocockGroupSequentialMethods1977", "lakensSampleSizeJustification2022")
  ),

  prior = list(
    id      = "prior",
    type    = "quant",
    name_es = "Evidencia previa y comparabilidad",
    when_es = "Replicaciones o series de estudios comparables.",
    tools   = c("metafor", "puniform"),
    warning = FALSE,
    refs    = c("albersWhenPowerAnalyses2018", "lakensSampleSizeJustification2022")
  ),

  cost = list(
    id       = "cost",
    type     = "quant",
    name_es  = "Coste-beneficio / recursos",
    when_es  = "Pilotos o estudios con recursos severamente limitados.",
    tools    = c("pwr", "retrodesign"),
    warning  = TRUE,
    warn_key = "warn_cost",
    refs     = c("bacchetti2005ethics", "lakensSampleSizeJustification2022")
  ),

  saturation = list(
    id      = "saturation",
    type    = "qual",
    name_es = "Saturaci\u00f3n te\u00f3rica o de datos",
    when_es = "Investigaci\u00f3n exploratoria, teor\u00eda fundamentada, an\u00e1lisis tem\u00e1tico.",
    tools   = character(0),
    warning = FALSE,
    refs    = c("guest2006saturation", "saunders2018saturation", "Hennink2021Sample")
  ),

  diversity = list(
    id      = "diversity",
    type    = "qual",
    name_es = "Diversidad y representatividad",
    when_es = "Estudios que requieren cubrir m\u00faltiples subgrupos o perspectivas.",
    tools   = character(0),
    warning = FALSE,
    refs    = c("patton2015qualitative", "Robinson2014Sampling", "Wutich2024Sample")
  ),

  community = list(
    id      = "community",
    type    = "qual",
    name_es = "Muestreo guiado por comunidad",
    when_es = "Investigaci\u00f3n participativa basada en comunidad (CBPR).",
    tools   = character(0),
    warning = FALSE,
    refs    = c("israel2013cbpr", "Hearn2022Having", "Pelletier2020Exploring")
  ),

  ethics = list(
    id      = "ethics",
    type    = "qual",
    name_es = "Viabilidad y compromisos \u00e9ticos",
    when_es = "Comunidades vulnerables; compromisos \u00e9ticos con participantes.",
    tools   = character(0),
    warning = FALSE,
    refs    = c("bacchetti2005ethics", "Taquette2022Ethical", "who2021ethics")
  ),

  narrative = list(
    id      = "narrative",
    type    = "qual",
    name_es = "Justificaci\u00f3n narrativa / prop\u00f3sito",
    when_es = "Caso \u00fanico, etnograf\u00eda, investigaci\u00f3n de prop\u00f3sito espec\u00edfico.",
    tools   = character(0),
    warning = FALSE,
    refs    = c("maxwell2013qualitative", "Flowerree2023Reasoning", "Farrugia2019WASP")
  ),

  mixed = list(
    id      = "mixed",
    type    = "mixed",
    name_es = "Complementariedad en dise\u00f1os mixtos",
    when_es = "Dise\u00f1os que combinan componentes cuantitativos y cualitativos.",
    tools   = character(0),
    warning = FALSE,
    refs    = c("creswell2018mixed", "Teddlie2016Mixed", "Javdani2023Mixed")
  )
)
