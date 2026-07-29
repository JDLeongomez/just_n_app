# data/strategy_details_es.R
# Contenido narrativo detallado por estrategia (español).
# Cada entrada es una función sin argumentos que devuelve tagList().
# app.R debe sourciarlo después de source("R/cite.R").
#
# Entradas:
#   intro_importance  → mod_intro.R  (sección "Por qué justificar")
#   what_is_power     → mod_quant.R  (intro conceptual de poder)
#   sesoi, prior, saturation, diversity, community,
#   narrative, ethics, mixed → mod_qual.R (detalle por estrategia)

strategy_details_es <- list(
  # ── Sección para mod_intro.R ────────────────────────────────────────────────
  intro_importance = function() {
    tagList(
      p(
        "Justificar el tamaño de muestra antes de recolectar datos muestra que el
       estudio está diseñado para responder de forma informativa a sus preguntas,
       en lugar de basarse en lo que “se pudo conseguir” o en números
       arbitrarios. En estudios cuantitativos, una buena justificación, por
       ejemplo mediante análisis de poder, precisión deseada o alcance de la
       población, conecta el tamaño de muestra con el efecto mínimo de interés
       y con las inferencias que se quieren hacer; esto permite evaluar si el estudio
       tiene capacidad real para detectar o estimar los efectos relevantes y evita
       trabajos con muestras “demasiado pequeñas para aprender algo útil”",
        cite_refs(c("lakensSampleSizeJustification2022", "mccrumSampleSizeJustifications2022")), "."
      ),
      p(
        "En investigación cualitativa, aunque las lógicas son distintas, se pide cada
       vez más explicar por qué el número previsto de entrevistas o grupos es suficiente
       en función del diseño, la homogeneidad del grupo, la riqueza esperada de los
       datos y/o criterios como saturación o adecuación de datos, en lugar de usar
       reglas de oro sin reflexión",
        cite_refs(c("vasileiouCharacterisingJustifyingSample2018", "Hennink2021Sample", "simCanSampleSize2018", "boddySampleSizeQualitative2016", "mthuliDefineExplainJustify2022")),
        ". Se ha argumentado que, en investigación cualitativa, las muestras pueden ser
       muy pequeñas para justificar la saturación teórica o muy grandes para permitir
       la profundidad necesaria en cada caso",
        cite_ref("sandelowskiSampleSizeQualitative1995"), "."
      ),
      p(
        "Hoy es cada vez más común que revistas, guías de reporte y comités éticos
       incluyan la justificación de tamaño muestral entre sus requisitos, y cuando se
       usa pre-registro o formatos como ", tags$em("reportes registrados"),
        ", se espera explicitar el plan de muestreo y su racional antes de ver los
       resultados",
        cite_refs(c("waldronNotAllPreregistrations2022", "hardwickeReducingBiasIncreasing2023", "lakensSampleSizeJustification2022", "mccrumSampleSizeJustifications2022", "reichPreregistrationRegisteredReports2021", "nosekRegisteredReportsMethod2014")),
        ". Esto encaja con la agenda de ciencia abierta: aumenta la transparencia,
       permite distinguir análisis confirmatorios de exploratorios y ayuda a calibrar
       la confianza en los hallazgos. Además, obliga a los equipos a pensar por
       adelantado qué efectos consideran relevantes, qué calidad y profundidad de
       datos necesitan, y qué compromisos son razonables dada la pregunta y los
       recursos, tanto en enfoques cuantitativos como cualitativos",
        cite_refs(c("waldronNotAllPreregistrations2022", "vasileiouCharacterisingJustifyingSample2018", "Hennink2021Sample", "simCanSampleSize2018", "mthuliDefineExplainJustify2022")), "."
      )
    )
  },

  # ── Sección para mod_quant.R ────────────────────────────────────────────────
  what_is_power = function() {
    tagList(
      p("El poder estadístico es la probabilidad de que un estudio detecte un efecto
       real cuando ese efecto realmente existe. En términos simples, indica qué tan
       probable es obtener un resultado “estadísticamente significativo”
       (por ejemplo, p < 0.05) si en la población hay un efecto del tamaño
       que nos interesa detectar (el SESOI). Por ejemplo, un poder del 80 %
       significa que, si ese efecto es real, 8 de cada 10 veces que repitamos el
       estudio obtendremos un resultado significativo, mientras que en 2 de cada 10
       no lo detectaremos (falsos negativos)."),
      p(
        "El poder depende de varios factores: aumenta cuando el tamaño de muestra es
       mayor, cuando el efecto que buscamos es más grande, cuando los datos son menos
       variables y cuando usamos un umbral de significación más flexible (por ejemplo,
       0.05 en lugar de 0.01). Por eso, al planificar un estudio, los investigadores
       suelen fijar un poder objetivo (como 80 % o 90 %) y calcular cuántos
       participantes necesitan para tener una buena probabilidad de detectar el efecto
       mínimo que consideran relevante. Si el poder es bajo, el estudio corre el riesgo
       de no detectar efectos reales, incluso si estos existen",
        cite_refs(c("leongomezPoderEstadisticoTamano2020a", "leongomezAnalisisPoderEstadistico2020")), "."
      )
    )
  },

  # ── sesoi ───────────────────────────────────────────────────────────────────
  sesoi = function() {
    tagList(
      p(
        "En estudios confirmatorios, el tamaño de muestra se determina con base en el
       poder estadístico: la probabilidad de detectar un efecto real si este existe.
       El poder depende, entre otros factores, del tamaño del efecto que se quiere
       detectar (un efecto más pequeño exige una muestra más grande). Por tanto, para
       calcular el N, es necesario especificar de antemano qué tamaño de efecto se
       quiere tener capacidad de detectar. La forma más rigurosa de hacerlo es
       definir el SESOI (",
        tags$em("Smallest Effect Size of Interest"), ")."
      ),
      p(
        "El SESOI es el tamaño más pequeño de efecto que se considera relevante o que
       “vale la pena” detectar o descartar en un estudio. No es cualquier
       diferencia distinta de cero, sino la mínima diferencia que tendría importancia
       teórica o práctica; por ejemplo, que justifique cambiar una política o un
       tratamiento",
        cite_ref("lakensSampleSizeJustification2022"),
        ". Decidir explícitamente este umbral permite planear estudios más útiles: si
       se sabe cuál es el efecto mínimo que interesa, se puede calcular cuántas personas
       hacen falta para tener suficiente poder estadístico para detectar (o rechazar)
       justamente ese efecto, con un error conocido",
        cite_ref("lakensSampleSizeJustification2022"),
        ". En pruebas de equivalencia, el SESOI define los límites dentro de los cuales
       los efectos se consideran “tan pequeños que no importan”; así, se puede
       evaluar no solo si hay un efecto, sino también si un efecto relevante está ausente",
        cite_ref("lakensEquivalenceTestingPsychological2018"),
        ". En resumen, el SESOI conecta las decisiones de tamaño de muestra y poder con
       la pregunta científica real, en lugar de basarse solo en diferencias arbitrarias
       o en “cualquier efecto distinto de cero”",
        cite_refs(c("lakensEquivalenceTestingPsychological2018", "lakensSampleSizeJustification2022")), "."
      ),
      p(
        tags$strong("El SESOI se debe decidir."),
        " Se puede fijar preguntando a expertos o usuarios, usando el cambio mínimo
       percibido, haciendo un análisis coste–beneficio o derivándolo directamente
       de la pregunta teórica o práctica. Lo importante es elegirlo antes de ver los
       datos y justificarlo de forma clara y contextualizada."
      ),
      h5(class = "mt-4 mb-2", "Cómo determinar el SESOI"),
      tags$ol(
        tags$li(
          class = "mb-3",
          tags$strong("Basarse en la experiencia y en partes interesadas"), tags$br(),
          "Preguntar a expertos o usuarios qué diferencia considerarían importante.
         Por ejemplo, a investigadores de memoria se les pidió cuántos errores falsos
         considerarían relevantes en distintos escenarios; muchos situaron el SESOI en
         1–3 errores según el contexto",
          cite_refs(c("riesthuisExpertOpinionsSmallest2021", "riesthuisLensLegalProfessionals2025", "riesthuisPValuesPracticalRelevance2025")),
          ". Involucrar a profesionales (jueces, clínicos, docentes) y preguntarles:
         “¿A partir de qué cambio empezarías a actuar o cambiar una decisión?”",
          cite_refs(c("riesthuisLensLegalProfessionals2025", "dickMeaningfulAssociationsRedux2025")), "."
        ),
        tags$li(
          class = "mb-3",
          tags$strong("Usar la experiencia subjetiva de las personas (métodos ancla)"), tags$br(),
          "Pedir a las personas que indiquen si sienten que han cambiado “un poco”,
         “bastante”, etc., y ver qué diferencia media en la escala corresponde al
         mínimo cambio que notan como importante. Ese cambio se usa como SESOI",
          cite_ref("anvariUsingAnchorbasedMethods2021"),
          ". Útil cuando el objetivo es el cambio percibido (estado de ánimo, dolor,
         bienestar)", cite_ref("anvariUsingAnchorbasedMethods2021"), "."
        ),
        tags$li(
          class = "mb-3",
          tags$strong("Análisis coste–beneficio y umbrales prácticos"), tags$br(),
          "Comparar el efecto con: lo que pasaría sin intervención, la brecha que se quiere
         cerrar, el coste económico/ético del cambio",
          cite_ref("anvariUsingAnchorbasedMethods2021"),
          ". En ensayos de entrenamiento y dieta, se fijó por ejemplo una pérdida de 3.3 %
         del peso corporal como SESOI para considerar la pérdida de grasa relevante",
          cite_ref("carlsonEffectsTrainingLoad2022"), "."
        ),
        tags$li(
          class = "mb-3",
          tags$strong("Derivar el SESOI de la pregunta científica"), tags$br(),
          "Formular: “¿Qué efecto mínimo cambiaría mi teoría / política /
         recomendación?” y fijar ese valor como SESOI",
          cite_refs(c("lakensEquivalenceTestingPsychological2018", "riesthuisSimulationBasedPowerAnalyses2024", "riesthuisWhenAreScientific2025", "dickMeaningfulAssociationsRedux2025")), "."
        )
      ),
      h5(class = "mt-4 mb-2", "Enfoques para fijar el SESOI"),
      tags$div(
        class = "table-responsive",
        tags$table(
          class = "table table-sm table-bordered",
          tags$thead(
            class = "table-light",
            tags$tr(
              tags$th("Estrategia"),
              tags$th("Cuándo usarla"),
              tags$th("Referencias")
            )
          ),
          tags$tbody(
            tags$tr(
              tags$td("Opinión de expertos / profesionales"),
              tags$td("Relevancia práctica (clínica, legal, educativa)"),
              tags$td(
                cite_ref("riesthuisExpertOpinionsSmallest2021"), " ",
                cite_ref("riesthuisLensLegalProfessionals2025"), " ",
                cite_ref("riesthuisPValuesPracticalRelevance2025"), " ",
                cite_ref("riesthuisReadyROCTutorial2025"), " ",
                cite_ref("spathBestPracticesSevere2025")
              )
            ),
            tags$tr(
              tags$td("Cambio mínimo percibido (ancla)"),
              tags$td("Estados subjetivos (ánimo, dolor, bienestar)"),
              tags$td(cite_ref("anvariUsingAnchorbasedMethods2021"))
            ),
            tags$tr(
              tags$td("Coste–beneficio / umbral clínico"),
              tags$td("Intervenciones con costes claros"),
              tags$td(
                cite_ref("dickMeaningfulAssociationsRedux2025"), " ",
                cite_ref("anvariUsingAnchorbasedMethods2021"), " ",
                cite_ref("carlsonEffectsTrainingLoad2022")
              )
            ),
            tags$tr(
              tags$td("Pregunta teórica explícita"),
              tags$td("Estudios básicos / de teoría"),
              tags$td(
                cite_ref("lakensEquivalenceTestingPsychological2018"), " ",
                cite_ref("riesthuisSimulationBasedPowerAnalyses2024"), " ",
                cite_ref("riesthuisWhenAreScientific2025")
              )
            )
          )
        )
      ),
      h5(class = "mt-4 mb-2", "Cuando no tienes un SESOI: efectos de literatura previa"),
      div(
        class = "alert alert-warning d-flex gap-2 align-items-start small",
        tags$span("\u26a0\ufe0f"),
        div(
          tags$strong("Advertencia: "),
          "usar el efecto de un estudio previo o piloto como valor de referencia
         para calcular el poder es problemático. Los estudios pequeños producen
         estimaciones de efecto infladas e imprecisas, y el sesgo de publicación
         hace que los efectos publicados ya estén sobreestimados respecto al
         efecto real en la población."
        )
      ),
      p(
        "Si no puedes definir un SESOI a priori, usa meta-análisis o revisiones
       sistemáticas de alta calidad (con corrección de sesgo de publicación)
       como estimación conservadora, pero nunca un único estudio piloto o previo",
        cite_refs(c("albersWhenPowerAnalyses2018", "lakensSampleSizeJustification2022")),
        ". Para replicaciones, considera la técnica ",
        tags$em("Small Telescopes"),
        ": planifica una réplica con muestra ampliada y evalúa si el efecto
       replicado sería detectable con el 'telescopio pequeño' del estudio
       original",
        cite_ref("simonsohnSmallTelescopesDetectability2015"),
        ". Consulta el acordeón ",
        tags$em("Efectos de literatura previa: riesgos y alternativas"),
        " a continuación para más detalles."
      ),
      div(
        class = "card jn-example-card mt-3",
        div(
          class = "card-header py-2",
          tags$strong("Ejemplo de aplicación")
        ),
        div(
          class = "card-body py-2",
          p(
            "Un equipo evalúa si un programa breve de terapia en línea reduce
           los síntomas de ansiedad en estudiantes universitarios. Antes de
           calcular el tamaño de muestra, define el SESOI: d = 0,30, porque
           consideran que efectos menores no justificarían implementar el
           programa a gran escala. Con ese umbral, α = 0,05 y un poder
           objetivo del 90 %, realizan un análisis de poder para una prueba
           t de dos muestras independientes con hipótesis direccional
           (H₁: > 0), que indica que necesitan 191 participantes por
           grupo. Anticipando un 15 % de deserción, planean reclutar 220
           por grupo (440 en total), de modo que el estudio tenga poder
           suficiente para detectar, como mínimo, el efecto que han definido
           como relevante."
          )
        )
      )
    )
  },

  # ── prior ───────────────────────────────────────────────────────────────────
  prior = function() {
    tagList(
      p(
        "Usar el tamaño de efecto de un único estudio previo o de un estudio piloto como
       si fuera el “tamaño real” para calcular el tamaño de muestra es
       problemático porque esos efectos suelen estar inflados y son muy imprecisos.
       En los estudios piloto, las muestras pequeñas generan estimaciones de efecto
       muy inestables: por azar, muchas veces salen más grandes de lo que realmente
       son, y basar el cálculo de potencia en esas cifras lleva a estudios principales
       seriamente infrapoderados",
        cite_refs(c("albersWhenPowerAnalyses2018", "shiAccountingPilotStudy2021", "teresiGuidelinesDesigningEvaluating2022")),
        ". Además, debido al sesgo de publicación, los estudios pequeños solo se publican
       cuando encuentran efectos grandes y “significativos”, lo que hace que el
       efecto típico en la literatura ya esté sobreestimado respecto al verdadero efecto
       poblacional",
        cite_refs(c("andersonSampleSizePlanningMore2017", "yangPublicationBiasImpacts2023", "kuhbergerPublicationBiasPsychology2014")),
        ". Esto crea un círculo vicioso: se toman como referencia tamaños de efecto
       demasiado grandes, se planifican muestras demasiado pequeñas, y se siguen
       produciendo estudios con baja potencia y efectos exagerados",
        cite_refs(c("andersonSampleSizePlanningMore2017", "giner-sorollaPowerDetectWhat2024", "beetsInfluencePilotSmall2023", "lakensSampleSizeJustification2022", "simCanSampleSize2018", "mesquidaPublicationBiasStatistical2023")), "."
      ),
      h5(class = "mt-4 mb-2", "La técnica Small Telescopes"),
      p(
        "Una alternativa práctica para evaluar si un resultado de replicación es compatible
       con el efecto que “debería” haberse podido detectar en el estudio original
       es la conocida como ", tags$em("Small Telescopes"),
        " (“telescopio pequeño”). La idea es hacer una replicación con una muestra
       claramente mayor (por ejemplo, al menos 2.5 veces la original) y hacerse dos
       preguntas: (1) ¿el efecto en la réplica es estadísticamente significativo? y
       (2) dado ese tamaño de efecto observado, ¿habría sido posible detectarlo con el
       tamaño de muestra del estudio original?",
        cite_refs(c("simonsohnSmallTelescopesDetectability2015", "costiganPerformingSmallTelescopesAnalysis2024")), "."
      ),
      p(
        "Si el nuevo efecto no es significativo o es tan pequeño que el estudio original
       difícilmente lo habría detectado, se concluye que la evidencia original era débil
       o espuria, en lugar de simplemente hablar de “replicación fallida” por
       falta de poder",
        cite_refs(c("simonsohnSmallTelescopesDetectability2015", "costiganPerformingSmallTelescopesAnalysis2024")),
        ". De este modo, ", tags$em("Small Telescopes"),
        " ayuda a evitar que efectos inflados de estudios pequeños o sesgados por
       publicación sigan considerándose hallazgos sólidos, al exigir que el efecto
       replicado sea lo bastante grande como para haber sido visible con el
       “telescopio pequeño” original",
        cite_refs(c("simonsohnSmallTelescopesDetectability2015", "costiganPerformingSmallTelescopesAnalysis2024")), "."
      ),
      div(
        class = "card jn-example-card mt-3",
        div(
          class = "card-header py-2",
          tags$strong("Ejemplo de aplicación: Small Telescopes")
        ),
        div(
          class = "card-body py-2",
          p(
            "Un estudio original sobre un nuevo programa educativo informa
           d = 0,20 con n = 40 por grupo (p = 0,04). Para planear la
           réplica, ese d = 0,20 no se toma como la mejor estimación del
           efecto verdadero, sino como el efecto mínimo que el estudio
           original podía detectar razonablemente, es decir, el umbral del
           ",
            tags$em("telescopio pequeño"),
            ". Un análisis de potencia indica que detectar d = 0,20 con
           80 % de potencia requiere n = 200 por grupo. La réplica se
           diseña entonces con ese tamaño. Si no encuentra un efecto
           significativo (o si el efecto observado es menor que d = 0,20)
           se concluye que el efecto verdadero es probablemente más
           pequeño de lo que el estudio original podía ",
            tags$em("ver"),
            " con su telescopio, y que la evidencia inicial era débil.
           En cambio, si la réplica sí detecta un efecto comparable,
           la evidencia original queda respaldada",
            cite_refs(c("simonsohnSmallTelescopesDetectability2015", "costiganPerformingSmallTelescopesAnalysis2024")), "."
          )
        )
      )
    )
  },

  # ── saturation ──────────────────────────────────────────────────────────────
  saturation = function() {
    tagList(
      p(
        "En investigación cualitativa, la saturación teórica es el punto del análisis en
       que las categorías y conceptos están tan desarrollados que seguir recogiendo datos
       ya casi no aporta nada nuevo a la comprensión del fenómeno. No significa que sea
       imposible que aparezca algo distinto, sino que la teoría construida está
       suficientemente densa y completa para responder a las preguntas de investigación",
        cite_refs(c("nelsonUsingConceptualDepth2017", "saunders2018saturation", "mouraMethodologicalPathReach2022", "nascimentoTheoreticalSaturationQualitative2018")), "."
      ),
      p(
        "Es un proceso gradual en el que el investigador, analizando de
       forma continua lo que recoge, va ganando confianza en que las categorías tienen
       propiedades, dimensiones y variaciones bien descritas y que los nuevos datos solo
       repiten o ilustran lo ya entendido",
        cite_refs(c("nelsonUsingConceptualDepth2017", "saunders2018saturation", "mouraMethodologicalPathReach2022", "rahimiSaturationQualitativeResearch2024")), "."
      ),
      h5(class = "mt-4 mb-2", "Principales tipos de saturación"),
      tags$div(
        class = "table-responsive",
        tags$table(
          class = "table table-sm table-bordered",
          tags$thead(
            class = "table-light",
            tags$tr(
              tags$th("Tipo"),
              tags$th("¿Qué se satura?"),
              tags$th("Momento clave"),
              tags$th("Referencias")
            )
          ),
          tags$tbody(
            tags$tr(
              tags$td("Teórica"),
              tags$td("Categorías y teoría emergente"),
              tags$td("Muestreo y análisis"),
              tags$td(
                cite_ref("nelsonUsingConceptualDepth2017"), " ",
                cite_ref("saunders2018saturation"), " ",
                cite_ref("mouraMethodologicalPathReach2022"), " ",
                cite_ref("nascimentoTheoreticalSaturationQualitative2018")
              )
            ),
            tags$tr(
              tags$td("Temática inductiva"),
              tags$td("Códigos/temas nuevos"),
              tags$td("Análisis"),
              tags$td(
                cite_ref("saunders2018saturation"), " ",
                cite_ref("mouraMethodologicalPathReach2022"), " ",
                cite_ref("thorneGreatSaturationDebate2020")
              )
            ),
            tags$tr(
              tags$td("De datos"),
              tags$td("Aparición de información nueva en la recogida"),
              tags$td("Trabajo de campo"),
              tags$td(
                cite_ref("saunders2018saturation"), " ",
                cite_ref("rahimiSaturationQualitativeResearch2024")
              )
            )
          )
        )
      ),
      h5(class = "mt-4 mb-2", "Cómo se implementa en la práctica"),
      tags$ul(
        tags$li(
          class = "mb-2",
          tags$strong("Muestreo teórico y/o intencional:"),
          " decidir a quién entrevistar después de analizar lo ya obtenido, para
         “llenar huecos” en las categorías",
          cite_refs(c("nelsonUsingConceptualDepth2017", "barbourTheoreticalSampling2022", "foleyInterviewingVehicleTheoretical2021")), "."
        ),
        tags$li(
          class = "mb-2",
          tags$strong("Análisis simultáneo a la recogida:"),
          " codificar cada entrevista u observación antes de seguir, comparando
         constantemente con datos previos",
          cite_refs(c("mouraMethodologicalPathReach2022", "nelsonUsingConceptualDepth2017", "saunders2018saturation", "bowenNaturalisticInquirySaturation2008")), "."
        ),
        tags$li(
          class = "mb-2",
          tags$strong("Seguimiento sistemático de códigos y temas:"),
          " usar matrices, gráficos o rejillas de saturación para ver cuándo los nuevos
         casos solo repiten ideas ya presentes",
          cite_refs(c("mouraMethodologicalPathReach2022", "nelsonUsingConceptualDepth2017", "nascimentoTheoreticalSaturationQualitative2018")), "."
        ),
        tags$li(
          class = "mb-2",
          tags$strong("Juicio reflexivo del equipo:"),
          " discutir de forma crítica si los datos siguen aportando propiedades nuevas o
         solo más ejemplos de lo mismo; si solo hay repetición, se puede detener la
         recogida",
          cite_refs(c("mouraMethodologicalPathReach2022", "saunders2018saturation", "rahimiSaturationQualitativeResearch2024", "oreillyUnsatisfactorySaturationCritical2013")), "."
        )
      ),
      h5(class = "mt-4 mb-2", "Una técnica práctica para evaluar la saturación"),
      p(
        "Para evaluar la saturación de forma sistemática y reproducible, se ha
       propuesto una técnica práctica que puede aplicarse durante el análisis sin
       supuestos estadísticos adicionales",
        cite_ref("guestSimpleMethodAssess2020"),
        ". La lógica es sencilla: primero se analiza un pequeño grupo inicial de
       entrevistas (por ejemplo, 4) y se identifican todos los temas que aparecen; este
       conjunto funciona como referencia. Luego, se revisan las siguientes entrevistas
       en pequeños bloques (por ejemplo, de 2 o 3) y se cuenta cuántos temas nuevos
       surgen. A continuación, se calcula la proporción de nueva información y se evalúa
       frente a un umbral previamente definido (por ejemplo, ≤5 % para un
       criterio moderado o 0 % para uno más estricto)."
      ),
      p("Si la cantidad de información nueva cae por debajo del umbral, se considera que
       se ha alcanzado la saturación. Por ejemplo, si en las primeras 4 entrevistas se
       identifican 37 temas y las siguientes 2 solo aportan 1 tema nuevo
       (1/37 ≈ 3 %), esto indica saturación, lo que se reporta
       como “6+2”: seis entrevistas hasta el punto de saturación más dos
       adicionales para confirmarlo. Este enfoque es fácil de aplicar, no requiere
       supuestos estadísticos y permite ajustar el nivel de rigor según las decisiones
       del investigador."),
      div(
        class = "card jn-example-card mt-3",
        div(
          class = "card-header py-2",
          tags$strong("Ejemplo de aplicación")
        ),
        div(
          class = "card-body py-2",
          p(
            "Un equipo investiga las barreras percibidas para adherirse a un
           tratamiento crónico mediante entrevistas semiestructuradas. Cada
           entrevista se transcribe y codifica antes de programar la
           siguiente, y el muestreo teórico orienta a quién reclutar después
           para poner a prueba las categorías emergentes",
            cite_refs(c("nelsonUsingConceptualDepth2017", "barbourTheoreticalSampling2022")),
            ". Siguiendo la técnica de bloques, analizan primero 5 entrevistas
           iniciales e identifican 29 temas relacionados con barreras
           logísticas, emocionales y relacionales. Los dos bloques siguientes,
           de 2 entrevistas cada uno, aportan solo 1 y 0 temas nuevos
           respectivamente (menos del 5 % de información nueva)",
            cite_ref("guestSimpleMethodAssess2020"),
            ". El equipo considera alcanzada la saturación temática en la
           entrevista 7 y realiza 2 entrevistas adicionales de confirmación,
           reportando el resultado como “7+2” (9 entrevistas en total)."
          )
        )
      )
    )
  },

  # ── diversity ───────────────────────────────────────────────────────────────
  diversity = function() {
    tagList(
      p(
        "En investigación cualitativa, el tamaño de muestra no se calcula por fórmulas
       estadísticas clásicas, sino por cuánto ayuda a captar la diversidad de
       perspectivas relevantes para la pregunta de investigación, y cuán bien
       representadas quedan esas perspectivas en los datos",
        cite_ref("patton2015qualitative"),
        ". La metodología Q ilustra este principio al buscar mapear la pluralidad de
       puntos de vista, incluso minoritarios, más que estimar su frecuencia en la
       población",
        cite_ref("Zabala2016Bootstrapping"), "."
      ),
      tags$small(
        class = "text-muted fst-italic d-block my-2",
        tags$em("Q methodology"),
        " (o simplemente ",
        tags$em("Q"),
        ") es una metodología especial, mixta y centrada en la subjetividad,
       no un nombre genérico para toda la investigación cualitativa. Su rasgo
       distintivo es el uso del ",
        tags$em("Q-sort"),
        " y del análisis factorial por persona para identificar y describir de
       forma sistemática diferentes configuraciones de puntos de vista sobre
       un tema."
      ),
      h5(class = "mt-4 mb-2", "Criterio de diversidad de perspectivas"),
      p(
        "En metodología Q, las personas participantes se seleccionan para representar la
       diversidad del “concurso” de discursos sobre el tema, no para ser una
       muestra probabilística",
        cite_ref("Zabala2016Bootstrapping"),
        ". La muestra debe incluir personas con posiciones, intereses o experiencias
       contrastadas, de modo que emerjan distintos tipos de perspectiva, aunque algunos
       sean minoritarios o no se asocien a variables sociodemográficas obvias",
        cite_ref("Zabala2016Bootstrapping"),
        ". Patton generaliza este enfoque a otros diseños cualitativos mediante muestreo
       máximo de variación o muestreo de casos teóricamente relevantes",
        cite_ref("patton2015qualitative"), "."
      ),
      h5(class = "mt-4 mb-2", "Relación entre tamaño y diversidad"),
      tags$div(
        class = "table-responsive",
        tags$table(
          class = "table table-sm table-bordered",
          tags$thead(
            class = "table-light",
            tags$tr(
              tags$th("Aspecto"),
              tags$th("Enfoque cualitativo/Q"),
              tags$th("Referencias")
            )
          ),
          tags$tbody(
            tags$tr(
              tags$td("Objetivo"),
              tags$td("Mapear pluralidad de puntos de vista"),
              tags$td(
                cite_ref("Zabala2016Bootstrapping"), " ",
                cite_ref("patton2015qualitative")
              )
            ),
            tags$tr(
              tags$td("Criterio clave"),
              tags$td("Cobertura de discursos, no proporciones"),
              tags$td(
                cite_ref("Zabala2016Bootstrapping"), " ",
                cite_ref("patton2015qualitative")
              )
            ),
            tags$tr(
              tags$td("Tamaño típico"),
              tags$td("Pequeñas N, pero con gran heterogeneidad interna"),
              tags$td(cite_ref("Zabala2016Bootstrapping"))
            )
          )
        )
      ),
      h5(class = "mt-4 mb-2", "Representatividad de perspectivas"),
      p(
        "La “representatividad” se entiende como que cada perspectiva identificada
       quede bien definida por varios casos, con patrones estables y distinguibles entre
       sí",
        cite_ref("Zabala2016Bootstrapping"),
        ". En metodología Q, se busca que cada factor tenga varios Q-sorts con cargas
       altas y fiables, y se evalúa su estabilidad con medidas como errores estándar y
       bootstrapping",
        cite_ref("Zabala2016Bootstrapping"),
        ". Una vez que nuevas incorporaciones ya no añaden perspectivas ni matices
       relevantes (saturación teórica o de puntos de vista), aumentar la muestra deja
       de ser eficiente, aunque no haya un número fijo universal",
        cite_refs(c("Zabala2016Bootstrapping", "patton2015qualitative")), "."
      ),
      div(
        class = "card jn-example-card mt-3",
        div(
          class = "card-header py-2",
          tags$strong("Ejemplo de aplicación")
        ),
        div(
          class = "card-body py-2",
          p(
            "En un estudio cualitativo sobre la experiencia de cuidar a un familiar con
           demencia, el equipo define el tamaño de muestra a partir de diversidad y
           representatividad de perspectivas. Mediante muestreo intencional, trazan cuotas
           mínimas para cubrir variación clave: al menos 3 hombres y 3 mujeres, distintos
           rangos de edad, cuidadores convivientes y no convivientes, y tres contextos
           urbanos y rurales",
            cite_refs(c("campbellPurposiveSamplingComplex2020", "Robinson2014Sampling", "simCanSampleSize2018")),
            ". Comienzan entrevistando a 15 personas buscando máxima variación",
            cite_refs(c("vasileiouCharacterisingJustifyingSample2018", "sandelowskiSampleSizeQualitative1995")),
            ". Durante el análisis, si aparece una voz nueva (p. ej., cuidadores
           inmigrantes), añaden deliberadamente más casos con ese perfil hasta que cada
           tipo de experiencia esté descrito por varios participantes y no emerjan matices
           sustantivos nuevos",
            cite_refs(c("Hennink2021Sample", "malterudSampleSizeQualitative2016", "guestSimpleMethodAssess2020")),
            ". El tamaño final (quizá 18–22 entrevistas) se justifica no porque
           “represente estadísticamente” a todos los cuidadores, sino porque logra
           una cobertura suficiente de la gama de experiencias",
            cite_refs(c("Hennink2021Sample", "vasileiouCharacterisingJustifyingSample2018", "sandelowskiSampleSizeQualitative1995", "campbellPurposiveSamplingComplex2020")), "."
          )
        )
      )
    )
  },

  # ── community ───────────────────────────────────────────────────────────────
  community = function() {
    tagList(
      p(
        "En la investigación cualitativa con muestreo guiado por la comunidad
       (o participativa), el tamaño de muestra no se fija solo por criterios formales,
       sino por un equilibrio entre la diversidad de voces que la comunidad considera
       clave y los recursos disponibles. A menudo se parte de una muestra intencional
       amplia y variada, planificada junto con socios comunitarios, y se ajusta durante
       el trabajo de campo según la experiencia acumulada y las prioridades locales",
        cite_refs(c("Pelletier2020Exploring", "israel2013cbpr")), "."
      ),
      p(
        "Israel y colegas destacan que, en investigación participativa comunitaria, se
       busca representar subgrupos relevantes (por ejemplo, edad, género, tipo de barrio,
       rol en la comunidad) definidos conjuntamente por investigadores y actores locales,
       usando estrategias como muestreo intencional y de máximo contraste para captar
       distintas experiencias hasta lograr suficiencia de información más que un número
       predeterminado",
        cite_ref("israel2013cbpr"),
        ". Estudios cualitativos recientes con socios comunitarios en zonas rurales o en
       comunidades migrantes y refugiadas muestran tamaños de muestra pequeños pero
       cuidadosamente diseñados (por ejemplo, 8–12 participantes), seleccionados para
       cubrir distintos territorios, trayectorias y grados de experiencia con la temática",
        cite_refs(c("Pelletier2020Exploring", "Hearn2022Having")), "."
      ),
      h5(class = "mt-4 mb-2", "Ejemplos de decisiones de tamaño en estudios participativos"),
      tags$div(
        class = "table-responsive",
        tags$table(
          class = "table table-sm table-bordered",
          tags$thead(
            class = "table-light",
            tags$tr(
              tags$th("Contexto"),
              tags$th("Ejemplo de tamaño y lógica"),
              tags$th("Referencias")
            )
          ),
          tags$tbody(
            tags$tr(
              tags$td("Rurales y remotos (salud y actividad física)"),
              tags$td("12 personas con variación en edad, género, tamaño de comunidad y
                     experiencia previa; guiado por matriz de reclutamiento y redes locales"),
              tags$td(cite_ref("Pelletier2020Exploring"), " ", cite_ref("Hearn2022Having"))
            ),
            tags$tr(
              tags$td("Comunidades refugiadas/migrantes"),
              tags$td("8 investigadores comunitarios de 5 grupos, seleccionados por su rol de
                     enlace y por diversidad lingüística y cultural"),
              tags$td(cite_ref("Hearn2022Having"))
            )
          )
        )
      ),
      p(
        class = "text-muted small fst-italic mt-1",
        tags$strong("Nota: "),
        "Los números anteriores son ejemplos ilustrativos, no reglas ni recomendaciones
       específicas. El tamaño final debe ajustarse según el tamaño y la estructura de la
       comunidad, la diversidad de perspectivas que se desea captar, los recursos
       disponibles y el rol de los socios comunitarios."
      ),
      p(
        "El tamaño de muestra en este enfoque se decide ", tags$strong("colaborativamente"),
        ", priorizando la relevancia comunitaria, la diversidad de perspectivas clave y la
       saturación temática. Herramientas como matrices de reclutamiento, identificación de
       “campeones” locales y el rol activo de investigadores comunitarios ayudan
       a ajustar el tamaño y composición de la muestra a lo que la propia comunidad
       considera necesario y manejable."
      ),
      div(
        class = "card jn-example-card mt-3",
        div(
          class = "card-header py-2",
          tags$strong("Ejemplo de aplicación")
        ),
        div(
          class = "card-body py-2",
          p("En una investigación participativa sobre acceso a servicios de salud en una
           comunidad rural, el equipo académico se reúne con el comité comunitario para
           decidir el tamaño de muestra. Primero, mapean en conjunto los grupos clave:
           mujeres embarazadas, adultos mayores y cuidadores de niños pequeños. La comunidad
           explica que las mujeres embarazadas son pocas (unas 15), pero muy relevantes, así
           que acuerdan incluirlas a todas. Para los adultos mayores, el comité sugiere que
           10 entrevistas serían suficientes para cubrir distintos barrios y condiciones de
           salud, y proponen nombres concretos de personas con experiencias diversas. Para
           cuidadores de niños pequeños, acuerdan hacer 3 grupos focales de 6–8 personas
           cada uno, porque la comunidad considera que es un tamaño manejable y que permite
           que todas las personas hablen. Así, el tamaño de muestra se define de forma
           conjunta, priorizando pertinencia y viabilidad según el criterio de la propia
           comunidad.")
        )
      )
    )
  },

  # ── narrative ───────────────────────────────────────────────────────────────
  narrative = function() {
    tagList(
      p(
        "En investigación cualitativa, el tamaño de muestra se decide menos por
       “cuántos casos” y más por para qué se necesita cada caso. En lugar de
       aplicar reglas fijas, el diseño parte de los objetivos del estudio, del marco
       conceptual y de las preguntas de investigación, y se justifica de forma narrativa:
       se cuenta una historia razonada sobre por qué ese conjunto de participantes,
       contextos o documentos es adecuado para generar el tipo de comprensión buscada",
        cite_ref("maxwell2013qualitative"), "."
      ),
      p(
        "En este enfoque se construye una ", tags$em("narrativa de diseño"),
        " donde se articula cómo cada decisión metodológica (incluido el tamaño de
       muestra) contribuye a alcanzar las metas del estudio: qué se quiere entender,
       qué variación de experiencias es crucial incluir, qué profundidad de análisis se
       persigue y qué amenazas a la validez se intentan manejar",
        cite_ref("maxwell2013qualitative"),
        ". La muestra se presenta así como parte de un relato coherente que organiza y da
       sentido a un material inicialmente indeterminado, mostrando una forma de pensar
       racional, no solo una enumeración de casos",
        cite_ref("Imaz-Sheinbaum2021PRINCIPLES"), "."
      ),
      p(
        "El papel de la narrativa es guiar el razonamiento del lector sobre qué es posible,
       plausible y relevante lograr con esa muestra: la historia del diseño muestra por qué,
       dado cierto propósito, ese número y tipo de casos hacen probable obtener la
       comprensión deseada y sostener determinadas afirmaciones",
        cite_refs(c("Flowerree2023Reasoning", "Imaz-Sheinbaum2021PRINCIPLES", "maxwell2013qualitative")),
        ". La evaluación de la adecuación del tamaño de muestra se hace entonces valorando
       la calidad y coherencia de esta narrativa racional, más que el cumplimiento de un
       umbral numérico fijo."
      ),
      div(
        class = "card jn-example-card mt-3",
        div(
          class = "card-header py-2",
          tags$strong("Ejemplo de aplicación")
        ),
        div(
          class = "card-body py-2",
          p("Para un estudio cualitativo sobre el acceso a la actividad física en comunidades
           rurales, se define un muestreo intencional orientado por propósito, con el
           objetivo de capturar diversidad relevante en experiencias y contextos. Se
           seleccionan inicialmente 12 participantes distribuidos en tres grupos etarios
           (jóvenes 18–29, adultos 30–59 y adultos mayores 60+), procurando
           representación de distintos géneros y de tres tipos de asentamiento (aldea
           pequeña, pueblo mediano y municipio). Además, se incluyen perfiles estratégicos
           que pueden aportar perspectivas complementarias, como al menos dos personas con
           experiencia en liderazgo comunitario y un trabajador del sector salud local. Este
           tamaño inicial permite equilibrar variedad de puntos de vista con la profundidad
           necesaria en entrevistas semiestructuradas. La muestra no se considera fija:
           durante el análisis, se evalúa la saturación temática y, si se identifican
           vacíos en subgrupos clave o emergen temas poco desarrollados, se incorporan
           participantes adicionales de manera dirigida.")
        )
      )
    )
  },

  # ── ethics ──────────────────────────────────────────────────────────────────
  ethics = function() {
    tagList(
      p(
        "En investigación cualitativa, el tamaño de muestra no se fija por fórmulas
       estadísticas, sino por el equilibrio entre lo ideal para responder a la pregunta
       de investigación y lo posible y responsable dadas las condiciones reales del
       estudio. Robinson propone decidir el tamaño “tomando en cuenta lo ideal y lo
       práctico”, articulando objetivos (p. ej., profundidad idiográfica vs. amplitud
       comparativa) con los recursos disponibles de tiempo, personal y financiación",
        cite_ref("Robinson2014Sampling"),
        ". Farrugia subraya que la planificación del muestreo debe considerar desde el
       inicio la carga de trabajo analítico (entrevistas extensas, transcripción,
       codificación) y la lógica de saturación teórica, para evitar producir más datos de
       los que se pueden manejar con rigor",
        cite_refs(c("Farrugia2019WASP", "Robinson2014Sampling")), "."
      ),
      p(
        "Desde una perspectiva ética, ampliar o reducir la muestra implica impactos directos
       sobre los participantes. La revisión de dilemas éticos en investigación cualitativa
       muestra que los estudios con temas sensibles y poblaciones vulnerables pueden generar
       daños emocionales, conflictos de confidencialidad y difuminación de roles entre
       investigador y “terapeuta”",
        cite_ref("Taquette2022Ethical"),
        ". Por ello, el tamaño de muestra debería ser el mínimo necesario para alcanzar los
       objetivos del estudio sin exponer innecesariamente a más personas al riesgo de daño,
       respetando la autonomía, la confidencialidad y el consentimiento continuo",
        cite_ref("Taquette2022Ethical"),
        ". Un muestreo bien justificado y transparente aumenta la integridad, la calidad y
       la confianza en la investigación",
        cite_refs(c("Taquette2022Ethical", "Farrugia2019WASP", "Robinson2014Sampling")), "."
      ),
      h5(class = "mt-4 mb-2", "Factores prácticos y éticos que influyen en el tamaño de muestra"),
      tags$div(
        class = "table-responsive",
        tags$table(
          class = "table table-sm table-bordered",
          tags$thead(
            class = "table-light",
            tags$tr(
              tags$th("Factor"),
              tags$th("Implicación en tamaño muestral"),
              tags$th("Referencias")
            )
          ),
          tags$tbody(
            tags$tr(
              tags$td("Recursos (tiempo, equipo, dinero)"),
              tags$td("Limita cuántas entrevistas pueden analizarse con rigor"),
              tags$td(cite_ref("Farrugia2019WASP"), " ", cite_ref("Robinson2014Sampling"))
            ),
            tags$tr(
              tags$td("Objetivo del estudio (profundidad vs. amplitud)"),
              tags$td("Orienta hacia muestras más pequeñas (profundidad) o más grandes (amplitud)"),
              tags$td(cite_ref("Robinson2014Sampling"))
            ),
            tags$tr(
              tags$td("Temas sensibles / poblaciones vulnerables"),
              tags$td("Justifica usar el mínimo necesario para reducir daños"),
              tags$td(cite_ref("Taquette2022Ethical"))
            ),
            tags$tr(
              tags$td("Riesgos de confidencialidad y carga emocional"),
              tags$td("Desaconseja reclutar más personas de las necesarias"),
              tags$td(cite_ref("Taquette2022Ethical"))
            )
          )
        )
      ),
      p("El tamaño de muestra en cualitativo se decide como un compromiso entre calidad del
       conocimiento y cuidado de las personas: debe ser lo suficientemente grande para
       lograr saturación y responder a la pregunta, pero lo bastante acotado para ser viable
       de analizar y éticamente responsable con el tiempo, la exposición y los riesgos
       asumidos por quienes participan."),
      div(
        class = "card jn-example-card mt-3",
        div(
          class = "card-header py-2",
          tags$strong("Ejemplo de aplicación")
        ),
        div(
          class = "card-body py-2",
          p(
            "En un estudio sobre la experiencia de médicos de familia frente al burnout, una
           investigadora define como universo a médicos en centros públicos urbanos con al
           menos 3 años de ejercicio, y excluye a quienes estén en baja psiquiátrica activa
           para evitar agravar su malestar",
            cite_ref("Robinson2014Sampling"),
            ". Por tiempo y presupuesto, solo puede hacer entre 10 y 15 entrevistas en
           profundidad, un rango que permite análisis detallado sin sobrecargarla de datos",
            cite_refs(c("Robinson2014Sampling", "Farrugia2019WASP")),
            ". Para no dejar fuera voces clave, decide un muestreo intencional con cuotas
           mínimas: al menos 4 mujeres, 4 hombres y 4 médicos con hijos",
            cite_refs(c("Robinson2014Sampling", "Farrugia2019WASP")),
            ". Recluta cuidando la autonomía y evitando presiones indebidas",
            cite_refs(c("Robinson2014Sampling", "Taquette2022Ethical")),
            ". Si detecta mucho sufrimiento en alguna entrevista, acorta la duración y ofrece
           información de apoyo psicológico, priorizando no dañar sobre ampliar la muestra,
           aun si eso la deja con 11 en lugar de 15 participantes",
            cite_refs(c("Robinson2014Sampling", "Taquette2022Ethical")), "."
          )
        )
      )
    )
  },

  # ── mixed ───────────────────────────────────────────────────────────────────
  mixed = function() {
    tagList(
      p(
        "En diseños mixtos, la complementariedad implica que los datos cuantitativos y
       cualitativos aborden dimensiones distintas pero relacionadas del mismo fenómeno,
       de modo que un enfoque “complete” o “elabore” al otro",
        cite_ref("Javdani2023Mixed"),
        ". Esto desplaza la pregunta de “¿cuántos casos necesito en total?” a
       “¿cuántos casos necesito en cada componente para que, juntos, produzcan una
       comprensión más rica y útil del problema?”"
      ),
      h5(class = "mt-4 mb-2", "Lógica de la complementariedad"),
      p(
        "La complementariedad se diferencia de la triangulación (que busca convergencia) y
       de la expansión (que amplía hacia fenómenos distintos): aquí se buscan aspectos
       diferentes de lo mismo; por ejemplo, cambios medibles en cuestionarios y, a
       la vez, significados o experiencias que explican esos cambios",
        cite_ref("Javdani2023Mixed"),
        ". Esto exige tamaños de muestra suficientes para que cada componente capture bien
       “su” dimensión: el cuantitativo debe tener potencia o precisión aceptable,
       y el cualitativo suficiente variedad y profundidad para iluminar mecanismos,
       contextos y voces."
      ),
      p(
        "Teddlie y Yu plantean que el muestreo mixto combina estrategias probabilísticas y
       intencionales, ajustando tamaños según el diseño (secuencial, concurrente,
       multinivel) y el rol de cada componente",
        cite_ref("Teddlie2016Mixed"),
        ". En diseños secuenciales, los resultados iniciales pueden guiar la selección y
       número de casos cualitativos posteriores (o viceversa), para maximizar la
       complementariedad",
        cite_refs(c("Javdani2023Mixed", "Teddlie2016Mixed")),
        ". Creswell y Plano Clark enmarcan estas decisiones dentro del propósito del diseño
       y la prioridad relativa de cada fase, más que en una regla numérica fija",
        cite_ref("creswell2018mixed"), "."
      ),
      h5(class = "mt-4 mb-2", "Criterios por componente"),
      tags$div(
        class = "table-responsive",
        tags$table(
          class = "table table-sm table-bordered",
          tags$thead(
            class = "table-light",
            tags$tr(
              tags$th("Componente"),
              tags$th("Objetivo complementario principal"),
              tags$th("Criterio clave de tamaño"),
              tags$th("Referencias")
            )
          ),
          tags$tbody(
            tags$tr(
              tags$td("Cuantitativo"),
              tags$td("Estimar cambios/relaciones generales"),
              tags$td("Precisión / potencia"),
              tags$td(
                cite_ref("Javdani2023Mixed"), " ",
                cite_ref("Teddlie2016Mixed"), " ",
                cite_ref("creswell2018mixed")
              )
            ),
            tags$tr(
              tags$td("Cualitativo"),
              tags$td("Profundizar significados, contextos, voces múltiples"),
              tags$td("Saturación / diversidad"),
              tags$td(
                cite_ref("Javdani2023Mixed"), " ",
                cite_ref("Teddlie2016Mixed"), " ",
                cite_ref("creswell2018mixed")
              )
            )
          )
        )
      ),
      p("El tamaño de muestra basado en complementariedad se decide a partir del papel
       específico de cada componente para iluminar el mismo fenómeno desde ángulos
       distintos, articulando criterios de potencia (cuantitativo) y de saturación/
       diversidad (cualitativo) dentro de un diseño coherente."),
      div(
        class = "card jn-example-card mt-3",
        div(
          class = "card-header py-2",
          tags$strong("Ejemplo de aplicación")
        ),
        div(
          class = "card-body py-2",
          p("En un estudio mixto sobre la adherencia a tratamientos para diabetes en adultos,
           se decide un muestreo basado en complementariedad. Primero, se selecciona una
           muestra cuantitativa de 250 pacientes de tres centros de salud mediante muestreo
           sistemático, para estimar niveles de adherencia y asociarlos con variables
           sociodemográficas y clínicas. A partir de estos resultados, se identifican cuatro
           perfiles contrastantes (alta/baja adherencia combinada con alta/baja percepción
           de apoyo social). Luego, se elige intencionalmente una submuestra cualitativa de
           16 participantes (4 por perfil), buscando que las entrevistas en profundidad
           complementen los datos numéricos: se exploran las razones subjetivas de la
           adherencia, las experiencias con el sistema de salud y las dinámicas familiares.
           Así, el tamaño y composición de ambas muestras se justifican por cómo cada una
           complementa la comprensión obtenida con la otra fase del diseño mixto.")
        )
      )
    )
  },

  # ── precision ────────────────────────────────────────────────────────────────
  precision = function() {
    tagList(
      p(
        "La estrategia de tamaño de muestra basada en precisión busca que el
       intervalo de confianza del efecto estimado sea lo suficientemente estrecho
       para hacer afirmaciones útiles sobre su magnitud, con independencia de
       la significación estadística",
        cite_refs(c("lakensSampleSizeJustification2022", "bonett2002sample")),
        ". En lugar de preguntar '¿qué N necesito para detectar un efecto de
       tamaño X?', la pregunta es '¿qué N necesito para estimar el efecto con
       una precisión de ±ε?'"
      ),
      p(
        "Este enfoque es especialmente adecuado para estudios descriptivos, donde
       el objetivo principal es caracterizar la magnitud de un fenómeno o relación,
       no confirmar una hipótesis a priori",
        cite_refs(c("quintanaStatisticalConsiderationsReporting2017", "lakensSampleSizeJustification2022")), "."
      ),
      h5(class = "mt-4 mb-2", "Cálculo del N por precisión"),
      p(
        "El paquete ", tags$code("MBESS"),
        " ofrece funciones específicas para este enfoque:"
      ),
      tags$ul(
        tags$li(
          tags$code("ss.aipe.r()"),
          " — N para estimar una correlación con un ancho de IC 95% deseado"
        ),
        tags$li(
          tags$code("ss.aipe.smd()"),
          " — N para estimar una diferencia estandarizada de medias"
        )
      ),
      div(
        class = "jn-code-block",
        "# N para estimar r = 0.30 con IC 95% de ancho total \u2264 0.20 (margen \u00b10.10)
library(MBESS)
ss.aipe.r(rho = 0.30, conf.level = 0.95, width = 0.20)

# N para diferencia de medias (d = 0.50, ancho total \u2264 0.40)
ss.aipe.smd(delta = 0.50, conf.level = 0.95, width = 0.40)"
      ),
      div(
        class = "alert alert-info small mt-3",
        bsicons::bs_icon("info-circle"),
        " MBESS no está disponible en esta app. Usa estos códigos en R
       local. Como primera aproximación interactiva, usa la calculadora de poder
       con un poder objetivo alto (\u2265 95\u00a0%). Esto garantiza estimaciones
       más precisas y curvas de poder más pronunciadas."
      ),
      h5(class = "mt-4 mb-2", "Fórmula rápida para correlaciones de Pearson"),
      p("Para correlaciones de Pearson, una aproximación basada en la transformación
       de Fisher-z permite calcular el N sin software especializado:"),
      div(
        class = "jn-code-block",
        "# N para IC 95% con margen de error \u03b5 en escala Fisher-z
n_por_precision <- function(epsilon, conf = 0.95) {
  z_crit <- qnorm(1 - (1 - conf) / 2)
  ceiling((z_crit / epsilon)^2 + 3)
}

# Ejemplo: \u03b5 = 0.10 en escala z (\u2248 \u00b10.10 en r para valores bajos)
n_por_precision(epsilon = 0.10)  # \u2248 387 participantes"
      ),
      div(
        class = "card jn-example-card mt-3",
        div(class = "card-header py-2", tags$strong("Ejemplo de aplicación")),
        div(
          class = "card-body py-2",
          p(
            "Una investigadora quiere estimar la correlación entre ansiedad rasgo y
           rendimiento académico en estudiantes universitarios. No tiene una
           hipótesis confirmatoria, sino que busca describir la magnitud de la
           relación con suficiente precisión para informar la práctica clínica.
           Define como margen de error aceptable ±0.10 en r (IC 95%). Usando la
           fórmula de Fisher-z, calcula que necesita aproximadamente 385
           participantes, suficiente para que el IC 95% de la correlación
           observada no exceda ±0.10, independientemente de si el resultado
           es 'estadísticamente significativo'.",
            cite_ref("quintanaStatisticalConsiderationsReporting2017"), "."
          )
        )
      )
    )
  },

  # ── sequential ───────────────────────────────────────────────────────────────
  sequential = function() {
    tagList(
      p(
        "Los diseños secuenciales (o adaptativos) permiten realizar análisis
       intermedios durante la recogida de datos y detener el estudio antes si la
       evidencia es suficientemente clara, ya sea para rechazar o para aceptar
       la hipótesis nula. Son especialmente útiles cuando los datos son costosos,
       escasos o implican riesgos para los participantes",
        cite_refs(c("pocockGroupSequentialMethods1977", "lakensSampleSizeJustification2022")), "."
      ),
      h5(class = "mt-4 mb-2", "¿Por qué usar diseños secuenciales?"),
      tags$ul(
        tags$li(
          class = "mb-1",
          tags$strong("Detención anticipada por eficacia: "),
          "si el efecto es grande y claro, se puede concluir antes y reducir
         el número de participantes necesarios."
        ),
        tags$li(
          class = "mb-1",
          tags$strong("Detención por futilidad: "),
          "si el efecto es claramente menor que el SESOI, se puede detener
         el estudio y reasignar recursos a otras preguntas."
        ),
        tags$li(
          class = "mb-1",
          tags$strong("Adaptación del tamaño muestral: "),
          "ajustar el N máximo según la variabilidad observada en los
         análisis intermedios."
        )
      ),
      div(
        class = "alert alert-warning d-flex gap-2 align-items-start small mt-2",
        tags$span("\u26a0\ufe0f"),
        div(
          "Los diseños secuenciales requieren planificar las reglas de parada ",
          tags$strong("antes de comenzar."),
          " Realizar análisis intermedios sin control formal de la tasa de error
         aumenta la tasa de error tipo I de forma difícil de cuantificar."
        )
      ),
      h5(class = "mt-4 mb-2", "Paquetes en R"),
      tags$div(
        class = "table-responsive",
        tags$table(
          class = "table table-sm table-bordered",
          tags$thead(
            class = "table-light",
            tags$tr(
              tags$th("Paquete"), tags$th("Uso principal"), tags$th("Notas")
            )
          ),
          tags$tbody(
            tags$tr(
              tags$td(tags$code("gsDesign")),
              tags$td("Diseños de grupo secuencial clásicos (O'Brien-Fleming, Pocock)"),
              tags$td("Instalación local — no disponible en esta app")
            ),
            tags$tr(
              tags$td(tags$code("rpact")),
              tags$td("Diseños adaptativos confirmatorios completos"),
              tags$td("Instalación local — no disponible en esta app")
            )
          )
        )
      ),
      h5(class = "mt-4 mb-2", "Ejemplo básico con gsDesign"),
      div(
        class = "jn-code-block",
        "library(gsDesign)

# Diseño con 3 análisis (2 intermedios + 1 final)
# Objetivo: 80% de poder para d = 0.50, alpha = 0.05
# Límites O'Brien-Fleming (conservadores al principio del reclutamiento)
diseno <- gsDesign(
  k         = 3,       # número de análisis incluyendo el final
  test.type = 2,       # bilateral
  alpha     = 0.05,
  beta      = 0.20,    # 1 - poder = 0.20
  delta     = 0.50,    # tamaño de efecto esperado (d de Cohen)
  sfu       = sfLDOF   # límites O'Brien-Fleming
)

diseno$n.I          # tamaños de muestra en cada análisis intermedio
diseno$upper$bound  # valores Z críticos para detención anticipada"
      ),
      div(
        class = "card jn-example-card mt-3",
        div(class = "card-header py-2", tags$strong("Ejemplo de aplicación")),
        div(
          class = "card-body py-2",
          p("Un equipo clínico evalúa una intervención psicológica breve en
           pacientes con dolor crónico. Los participantes son difíciles de
           reclutar y cada sesión requiere muchas horas de clínico especializado.
           Con gsDesign, planifican 3 análisis: uno provisional a los 30
           participantes, otro a los 60 y el análisis final a los 90. Si a
           los 30 el efecto supera el límite O'Brien-Fleming, pueden detener
           el estudio y publicar los resultados. Si a los 60 el efecto es menor
           que el SESOI, detienen por futilidad. El tamaño máximo planificado
           (90) garantiza un 80% de poder para d = 0.50. Este diseño puede
           ahorrar hasta un 40% de participantes en los escenarios más favorables.")
        )
      )
    )
  },

  # ── cost ─────────────────────────────────────────────────────────────────────
  cost = function() {
    tagList(
      div(
        class = "alert alert-warning d-flex gap-2 align-items-start",
        tags$span("\u26a0\ufe0f"),
        div(
          tags$strong("Estrategia de último recurso: "),
          "el análisis por coste-beneficio solo es apropiado cuando las
         restricciones de recursos son genuinas e inevitables. Si el estudio
         resultante no tiene poder suficiente para responder sus preguntas de
         forma informativa, considera rediseñarlo, reducir su alcance o
         posponer su realización."
        )
      ),
      p(
        "Cuando los recursos son severamente limitados, la estrategia consiste
       en calcular el N máximo alcanzable y evaluar honestamente qué puede y
       qué no puede concluirse con ese tamaño. Esto implica razonar en la
       dirección inversa al análisis de poder clásico: en lugar de '¿qué N
       necesito para X poder?', la pregunta es '¿qué poder tendré con el N
       que puedo alcanzar?'",
        cite_ref("lakensSampleSizeJustification2022"), "."
      ),
      h5(class = "mt-4 mb-2", "Análisis inverso de poder"),
      p(
        "Dado el N máximo disponible, se calcula el efecto mínimo detectable
       (MDE: ", tags$em("minimum detectable effect"),
        ") (el efecto más pequeño que podría detectarse con ese N, dado el
       alfa y el poder objetivo). Si el MDE supera el SESOI, el estudio no
       tiene valor confirmatorio y debe replantearse."
      ),
      div(
        class = "jn-code-block",
        "library(pwr)

# Dado N = 50 por grupo, alpha = 0.05, poder = 0.80
# ¿Cuál es el efecto mínimo detectable (d) para t de dos muestras?
pwr.t.test(
  n         = 50,
  sig.level = 0.05,
  power     = 0.80,
  type      = 'two.sample'
)$d  # efecto mínimo detectable

# O calcular el poder para un efecto específico dado N fijo:
pwr.t.test(n = 50, d = 0.30, sig.level = 0.05,
           type = 'two.sample')$power"
      ),
      h5(class = "mt-4 mb-2", "Tasa de error con muestras pequeñas: retrodesign"),
      p(
        "El paquete ", tags$code("retrodesign"),
        " calcula, dado un N y un efecto esperado, la tasa de error tipo M
       (factor de exageración del efecto si se obtiene significación) y tipo S
       (probabilidad de obtener el signo incorrecto del efecto). Estas métricas
       permiten comunicar honestamente las limitaciones del estudio antes de
       recolectar datos."
      ),
      div(
        class = "jn-code-block",
        "library(retrodesign)

# Dado d esperado = 0.30 y N = 30 por grupo
retrodesign(A = 0.30, s = sqrt(2 / 30), alpha = 0.05)
# power       : probabilidad de detectar el efecto si es real
# typeS       : P(obtener signo incorrecto del efecto)
# exaggeration: factor de exageración del efecto si el resultado es significativo"
      ),
      div(
        class = "card jn-example-card mt-3",
        div(class = "card-header py-2", tags$strong("Ejemplo de aplicación")),
        div(
          class = "card-body py-2",
          p(
            "Un investigador realiza un estudio piloto con 20 participantes por
           condición para evaluar la viabilidad de un paradigma experimental
           antes de solicitar financiamiento para el estudio principal. Con
           N = 20 por grupo, calcula con pwr que puede detectar efectos
           d \u2265 0.65 con un 80% de poder (un umbral alto). Reconoce que el
           estudio no tiene valor confirmatorio para efectos pequeños o
           medianos. En el manuscrito, reporta explícitamente el poder
           post-hoc para el efecto esperado (d \u2248 0.40) y el MDE del diseño,
           y enmarca los resultados como preliminares con enfoque en estimación
           de parámetros para el diseño del estudio principal.",
            cite_ref("lakensSampleSizeJustification2022"), "."
          )
        )
      )
    )
  }
)
