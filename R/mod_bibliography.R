# R/mod_bibliography.R
# Pestaña estática con la bibliografía completa organizada por temática.

mod_bibliography_ui <- function(id) {
  ns <- NS(id)

  bib_entry <- function(key) {
    ref <- refs[[key]]
    tags$li(
      class = "mb-2 lh-sm",
      HTML(ref$full),
      " ",
      tags$a(
        href   = ref$url,
        target = "_blank",
        class  = "text-muted small",
        style  = "white-space: nowrap;",
        bsicons::bs_icon("box-arrow-up-right"), " Acceso"
      )
    )
  }

  bib_section <- function(panel_value, icon_name, title, keys) {
    bslib::accordion_panel(
      value = panel_value,
      title = div(
        class = "d-flex align-items-center gap-2",
        bsicons::bs_icon(icon_name),
        title,
        tags$span(
          class = "badge rounded-pill ms-1",
          style = "background:#e2e4f0; color:#4f46e5; font-size:0.7rem;",
          length(keys)
        )
      ),
      tags$ol(
        class = "small mb-0",
        style = "padding-left: 1.2rem;",
        lapply(keys, bib_entry)
      )
    )
  }

  tagList(
    div(
      class = "container-lg py-4",

      div(
        class = "row mb-3",
        div(
          class = "col",
          h2(
            class = "mb-1",
            bsicons::bs_icon("journal-bookmark"), " Referencias bibliográficas"
          ),
          p(
            class = "text-muted mb-0",
            "Bibliografía completa de las fuentes citadas en la app, organizada por temática.",
            tags$br(),
            tags$small(
              "Haz clic en cualquier sección para expandirla. Haz clic en ",
              bsicons::bs_icon("box-arrow-up-right"), " Acceso para ir a la fuente original."
            )
          )
        )
      ),

      bslib::accordion(
        id    = ns("bib_acc"),
        open  = FALSE,
        multiple = TRUE,

        # ── 1. Justificación general ──────────────────────────────────────────
        bib_section(
          "p1", "rulers",
          "Justificación del tamaño de muestra",
          c(
            "lakensSampleSizeJustification2022",
            "cohen1992power",
            "giner-sorollaPowerDetectWhat2024",
            "bacchetti2005ethics",
            "richardsonSampleSizeJustification1998",
            "mccrumSampleSizeJustifications2022",
            "montgomerySampleSizeJustification2025",
            "teresiGuidelinesDesigningEvaluating2022",
            "changUpdateSampleSize2016",
            "chenWeek5Confidence2016"
          )
        ),

        # ── 2. Poder estadístico ──────────────────────────────────────────────
        bib_section(
          "p2", "bar-chart-fill",
          "Poder estadístico y diseños confirmatorios",
          c(
            "buttonPowerFailureWhy2013",
            "correllAvoidCohensSmall2020",
            "andersonSampleSizePlanningMore2017",
            "albersWhenPowerAnalyses2018",
            "lakensSimulationBasedPowerAnalysis2021",
            "lakensIntroductionSuperpower2025",
            "danzigerBalancingSensitivitySpecificity2022",
            "dickMeaningfulAssociationsRedux2025",
            "spathBestPracticesSevere2025",
            "carlsonEffectsTrainingLoad2022",
            "williamsReplySeanWilliams2023"
          )
        ),

        # ── 3. SESOI y equivalencia ───────────────────────────────────────────
        bib_section(
          "p3", "bullseye",
          "SESOI y pruebas de equivalencia",
          c(
            "lakensEquivalenceTestingPsychological2018",
            "anvariUsingAnchorbasedMethods2021",
            "riesthuisExpertOpinionsSmallest2021",
            "riesthuisSimulationBasedPowerAnalyses2024",
            "riesthuisReadyROCTutorial2025",
            "riesthuisWhenAreScientific2025",
            "riesthuisLensLegalProfessionals2025",
            "riesthuisPValuesPracticalRelevance2025"
          )
        ),

        # ── 4. Precisión y diseños especiales ────────────────────────────────
        bib_section(
          "p4", "rulers",
          "Precisión, diseños secuenciales y estudios piloto",
          c(
            "bonett2002sample",
            "quintanaStatisticalConsiderationsReporting2017",
            "pocockGroupSequentialMethods1977",
            "shiAccountingPilotStudy2021",
            "beetsInfluencePilotSmall2023"
          )
        ),

        # ── 5. Replicación y sesgo de publicación ─────────────────────────────
        bib_section(
          "p5", "arrow-repeat",
          "Replicación y sesgo de publicación",
          c(
            "simonsohnSmallTelescopesDetectability2015",
            "schwarzEvaluatingPsychologicalResearch2016",
            "costiganPerformingSmallTelescopesAnalysis2024",
            "kuhbergerPublicationBiasPsychology2014",
            "yangPublicationBiasImpacts2023",
            "mesquidaPublicationBiasStatistical2023"
          )
        ),

        # ── 6. Ciencia abierta y pre-registro ────────────────────────────────
        bib_section(
          "p6", "unlock",
          "Ciencia abierta y pre-registro",
          c(
            "hardwickeReducingBiasIncreasing2023",
            "nosekRegisteredReportsMethod2014",
            "reichPreregistrationRegisteredReports2021",
            "waldronNotAllPreregistrations2022"
          )
        ),

        # ── 7. Saturación cualitativa ─────────────────────────────────────────
        bib_section(
          "p7", "moisture",
          "Investigación cualitativa — Saturación",
          c(
            "guest2006saturation",
            "saunders2018saturation",
            "Hennink2021Sample",
            "Wutich2024Sample",
            "guestSimpleMethodAssess2020",
            "bowenNaturalisticInquirySaturation2008",
            "oreillyUnsatisfactorySaturationCritical2013",
            "thorneGreatSaturationDebate2020",
            "vasileiouCharacterisingJustifyingSample2018",
            "rahimiSaturationQualitativeResearch2024",
            "mouraMethodologicalPathReach2022",
            "nascimentoTheoreticalSaturationQualitative2018",
            "nelsonUsingConceptualDepth2017"
          )
        ),

        # ── 8. Muestreo cualitativo ───────────────────────────────────────────
        bib_section(
          "p8", "person-lines-fill",
          "Investigación cualitativa — Muestreo y estrategias",
          c(
            "patton2015qualitative",
            "maxwell2013qualitative",
            "sandelowskiSampleSizeQualitative1995",
            "malterudSampleSizeQualitative2016",
            "simCanSampleSize2018",
            "Robinson2014Sampling",
            "campbellPurposiveSamplingComplex2020",
            "boddySampleSizeQualitative2016",
            "Farrugia2019WASP",
            "mthuliDefineExplainJustify2022",
            "barbourTheoreticalSampling2022",
            "foleyInterviewingVehicleTheoretical2021",
            "Zabala2016Bootstrapping"
          )
        ),

        # ── 9. Cualitativo participativo, narrativo y ético ───────────────────
        bib_section(
          "p9", "people-fill",
          "Investigación cualitativa — Participativa, narrativa y ética",
          c(
            "israel2013cbpr",
            "who2021ethics",
            "Hearn2022Having",
            "Pelletier2020Exploring",
            "Taquette2022Ethical",
            "Flowerree2023Reasoning",
            "Imaz-Sheinbaum2021PRINCIPLES"
          )
        ),

        # ── 10. Diseños mixtos ────────────────────────────────────────────────
        bib_section(
          "p10", "shuffle",
          "Diseños mixtos",
          c(
            "creswell2018mixed",
            "Teddlie2016Mixed",
            "Javdani2023Mixed"
          )
        ),

        # ── 11. Guías de reporte y rigor ──────────────────────────────────────
        bib_section(
          "p11", "file-earmark-check",
          "Guías de reporte y rigor metodológico",
          c(
            "lincolnItRigorousTrustworthiness1986",
            "tongConsolidatedCriteriaReporting2007",
            "obrienStandardsReportingQualitative2014",
            "tongEnhancingTransparencyReporting2012",
            "ocathainQualityMixedMethods2008"
          )
        ),

        # ── 12. Recursos del autor ────────────────────────────────────────────
        bib_section(
          "p12", "person-badge",
          "Recursos del autor",
          c(
            "leongomez2025justn",
            "leongomezAnalisisPoderEstadistico2020",
            "leongomezPoderEstadisticoTamano2020a"
          )
        )
      )
    )
  )
}

mod_bibliography_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
