# data/refs.R
# Metadatos de todas las referencias. Cada entrada:
#   short : texto corto para mostrar en la UI (Autor, año)
#   full  : cita APA completa en HTML (con <em> para títulos)
#   url   : DOI o URL al que enlaza

refs <- list(

  cohen1992power = list(
    short = "Cohen, 1992",
    full  = "Cohen, J. (1992). A power primer. <em>Psychological Bulletin</em>, <em>112</em>(1), 155\u2013159.",
    url   = "https://doi.org/10.1037/0033-2909.112.1.155"
  ),

  lakensSampleSizeJustification2022 = list(
    short = "Lakens, 2022",
    full  = "Lakens, D. (2022). Sample size justification. <em>Collabra: Psychology</em>, <em>8</em>(1), 33267.",
    url   = "https://doi.org/10.1525/collabra.33267"
  ),

  bonett2002sample = list(
    short = "Bonett, 2002",
    full  = "Bonett, D. G. (2002). Sample size requirements for estimating intraclass correlations with desired precision. <em>Statistics in Medicine</em>, <em>21</em>(9), 1331\u20131335.",
    url   = "https://doi.org/10.1002/sim.1108"
  ),

  pocockGroupSequentialMethods1977 = list(
    short = "Pocock, 1977",
    full  = "Pocock, S. J. (1977). Group sequential methods in the design and analysis of clinical trials. <em>Biometrika</em>, <em>64</em>(2), 191\u2013199.",
    url   = "https://doi.org/10.1093/biomet/64.2.191"
  ),

  bacchetti2005ethics = list(
    short = "Bacchetti et al., 2005",
    full  = "Bacchetti, P., Wolf, L. E., Segal, M. R., &amp; McCulloch, C. E. (2005). Ethics and sample size. <em>American Journal of Epidemiology</em>, <em>161</em>(2), 105\u2013110.",
    url   = "https://doi.org/10.1093/aje/kwi014"
  ),

  lakensEquivalenceTestingPsychological2018 = list(
    short = "Lakens et al., 2018",
    full  = "Lakens, D., Scheel, A. M., &amp; Isager, P. M. (2018). Equivalence testing for psychological research: A tutorial. <em>Advances in Methods and Practices in Psychological Science</em>, <em>1</em>(2), 259\u2013269.",
    url   = "https://doi.org/10.1177/2515245918770963"
  ),

  buttonPowerFailureWhy2013 = list(
    short = "Button et al., 2013",
    full  = "Button, K. S., et al. (2013). Power failure: why small sample size undermines the reliability of neuroscience. <em>Nature Reviews Neuroscience</em>, <em>14</em>(5), 365\u2013376.",
    url   = "https://doi.org/10.1038/nrn3475"
  ),

  guest2006saturation = list(
    short = "Guest et al., 2006",
    full  = "Guest, G., Bunce, A., &amp; Johnson, L. (2006). How many interviews are enough? An experiment with data saturation and variability. <em>Field Methods</em>, <em>18</em>(1), 59\u201382.",
    url   = "https://doi.org/10.1177/1525822X05279903"
  ),

  saunders2018saturation = list(
    short = "Saunders et al., 2018",
    full  = "Saunders, B., et al. (2018). Saturation in qualitative research: exploring its conceptualization and operationalization. <em>Quality &amp; Quantity</em>, <em>52</em>(4), 1893\u20131907.",
    url   = "https://doi.org/10.1007/s11135-017-0574-8"
  ),

  patton2015qualitative = list(
    short = "Patton, 2015",
    full  = "Patton, M. Q. (2015). <em>Qualitative Research &amp; Evaluation Methods</em> (4th ed.). SAGE Publications.",
    url   = "https://us.sagepub.com/en-us/nam/qualitative-research-evaluation-methods/book232962"
  ),

  israel2013cbpr = list(
    short = "Israel et al., 2013",
    full  = "Israel, B. A., Eng, E., Schulz, A. J., &amp; Parker, E. A. (2013). <em>Methods for Community-Based Participatory Research for Health</em> (2nd ed.). Jossey-Bass/Wiley.",
    url   = "https://www.wiley.com/en-us/Methods+for+Community-Based+Participatory+Research+for+Health%2C+2nd+Edition-p-9781118021866"
  ),

  who2021ethics = list(
    short = "WHO, 2021",
    full  = "World Health Organization. (2021). <em>Ethics and safety in participatory research: WHO guidance</em>.",
    url   = "https://www.who.int/teams/health-ethics-governance"
  ),

  creswell2018mixed = list(
    short = "Creswell &amp; Plano Clark, 2018",
    full  = "Creswell, J. W., &amp; Plano Clark, V. L. (2018). <em>Designing and Conducting Mixed Methods Research</em> (3rd ed.). SAGE Publications.",
    url   = "https://us.sagepub.com/en-us/nam/designing-and-conducting-mixed-methods-research/book241842"
  ),

  maxwell2013qualitative = list(
    short = "Maxwell, 2013",
    full  = "Maxwell, J. A. (2013). <em>Qualitative Research Design: An Interactive Approach</em> (3rd ed.). SAGE Publications.",
    url   = "https://us.sagepub.com/en-us/nam/qualitative-research-design/book234502"
  ),

  Hennink2021Sample = list(
    short = "Hennink &amp; Kaiser, 2021",
    full  = "Hennink, M., &amp; Kaiser, B. (2021). Sample sizes for saturation in qualitative research: A systematic review of empirical tests. <em>Social Science &amp; Medicine</em>, 114523.",
    url   = "https://doi.org/10.1016/j.socscimed.2021.114523"
  ),

  Wutich2024Sample = list(
    short = "Wutich et al., 2024",
    full  = "Wutich, A., et al. (2024). Sample sizes for 10 types of qualitative data analysis: An integrative review, empirical guidance, and next steps. <em>International Journal of Qualitative Methods</em>, <em>23</em>.",
    url   = "https://doi.org/10.1177/16094069241296206"
  ),

  Zabala2016Bootstrapping = list(
    short = "Zabala &amp; Pascual, 2016",
    full  = "Zabala, A., &amp; Pascual, U. (2016). Bootstrapping Q methodology to improve the understanding of human perspectives. <em>PLoS ONE</em>, <em>11</em>.",
    url   = "https://doi.org/10.1371/journal.pone.0148087"
  ),

  Hearn2022Having = list(
    short = "Hearn et al., 2022",
    full  = "Hearn, F., et al. (2022). Having a say in research directions: The role of community researchers in participatory research with communities of refugee and migrant background. <em>International Journal of Environmental Research and Public Health</em>, <em>19</em>.",
    url   = "https://doi.org/10.3390/ijerph19084844"
  ),

  Pelletier2020Exploring = list(
    short = "Pelletier et al., 2020",
    full  = "Pelletier, C., Pousette, A., Ward, K., &amp; Fox, G. (2020). Exploring the perspectives of community members as research partners in rural and remote areas. <em>Research Involvement and Engagement</em>, <em>6</em>.",
    url   = "https://doi.org/10.1186/s40900-020-0179-6"
  ),

  Robinson2014Sampling = list(
    short = "Robinson, 2014",
    full  = "Robinson, O. (2014). Sampling in interview-based qualitative research: A theoretical and practical guide. <em>Qualitative Research in Psychology</em>, <em>11</em>, 25\u201341.",
    url   = "https://doi.org/10.1080/14780887.2013.801543"
  ),

  Farrugia2019WASP = list(
    short = "Farrugia, 2019",
    full  = "Farrugia, B. (2019). WASP (write a scientific paper): Sampling in qualitative research. <em>Early Human Development</em>, <em>133</em>, 69\u201371.",
    url   = "https://doi.org/10.1016/j.earlhumdev.2019.03.016"
  ),

  Taquette2022Ethical = list(
    short = "Taquette &amp; Matta Souza, 2022",
    full  = "Taquette, S., &amp; Matta Souza, L. M. B. (2022). Ethical dilemmas in qualitative research: A critical literature review. <em>International Journal of Qualitative Methods</em>, <em>21</em>.",
    url   = "https://doi.org/10.1177/16094069221078731"
  ),

  Teddlie2016Mixed = list(
    short = "Teddlie &amp; Yu, 2016",
    full  = "Teddlie, C., &amp; Yu, F. (2016). Mixed methods sampling: A typology with examples. <em>Journal of Mixed Methods Research</em>, <em>1</em>, 77\u2013100.",
    url   = "https://doi.org/10.1177/2345678906292430"
  ),

  Javdani2023Mixed = list(
    short = "Javdani et al., 2023",
    full  = "Javdani, S., et al. (2023). Mixed methods in community psychology: A values-forward synthesis. <em>American Journal of Community Psychology</em>.",
    url   = "https://doi.org/10.1002/ajcp.12703"
  ),

  Flowerree2023Reasoning = list(
    short = "Flowerree, 2023",
    full  = "Flowerree, A. K. (2023). Reasoning through narrative. <em>Episteme</em>, <em>20</em>, 912\u2013926.",
    url   = "https://doi.org/10.1017/epi.2024.8"
  ),

  quintanaStatisticalConsiderationsReporting2017 = list(
    short = "Quintana, 2017",
    full  = "Quintana, D. S. (2017). Statistical considerations for reporting and planning heart rate variability case-control studies. <em>Psychophysiology</em>, <em>54</em>(3), 344\u2013349.",
    url   = "https://doi.org/10.1111/psyp.12798"
  ),

  albersWhenPowerAnalyses2018 = list(
    short = "Albers &amp; Lakens, 2018",
    full  = "Albers, C., &amp; Lakens, D. (2018). When power analyses based on pilot data are biased: Inaccurate effect size estimators and follow-up bias. <em>Journal of Experimental Social Psychology</em>, <em>74</em>, 187\u2013195.",
    url   = "https://doi.org/10.1016/j.jesp.2017.09.004"
  ),

  correllAvoidCohensSmall2020 = list(
    short = "Correll et al., 2020",
    full  = "Correll, J., Mellinger, C., McClelland, G. H., &amp; Judd, C. M. (2020). Avoid Cohen's \u2018small\u2019, \u2018medium\u2019, and \u2018large\u2019 for power analysis. <em>Trends in Cognitive Sciences</em>, <em>24</em>(3), 200\u2013207.",
    url   = "https://doi.org/10.1016/j.tics.2019.12.009"
  ),

  leongomezAnalisisPoderEstadistico2020 = list(
    short = "Leong\u00f3mez, 2020",
    full  = "Leong\u00f3mez, J. D. (2020). An\u00e1lisis de poder estad\u00edstico y c\u00e1lculo de tama\u00f1o de muestra en R: Gu\u00eda pr\u00e1ctica. <em>Zenodo</em>.",
    url   = "https://doi.org/10.5281/zenodo.3988776"
  ),

  leongomez2025justn = list(
    short = "Leong\u00f3mez, 2025",
    full  = "Leong\u00f3mez, J. D. (2025). Just-N Framework: Aplicaci\u00f3n Interactiva (v1.3). <em>Zenodo</em>.",
    url   = "https://doi.org/10.5281/zenodo.16934468"
  ),

  # --- Nuevas entradas generadas desde referencias.bib ---

  `Imaz-Sheinbaum2021PRINCIPLES` = list(
    short = "Imaz-Sheinbaum, 2021",
    full  = "Imaz-Sheinbaum, M. (2021). Principles of Narrative Reason. <em>History and Theory</em>, <em>60</em>, 249–270.",
    url   = "https://doi.org/10.1111/HITH.12205"
  ),

  andersonSampleSizePlanningMore2017 = list(
    short = "Anderson et al., 2017",
    full  = "Anderson, S. F., Kelley, K., &amp; Maxwell, S. E. (2017). Sample-Size Planning for More Accurate Statistical Power: A Method Adjusting Sample Effect Sizes for Publication Bias and Uncertainty. <em>Psychological Science</em>, <em>28</em>(11), 1547–1562.",
    url   = "https://doi.org/10.1177/0956797617723724"
  ),

  anvariUsingAnchorbasedMethods2021 = list(
    short = "Anvari &amp; Lakens, 2021",
    full  = "Anvari, F., &amp; Lakens, D. (2021). Using Anchor-Based Methods to Determine the Smallest Effect Size of Interest. <em>Journal of Experimental Social Psychology</em>, <em>96</em>, 104159.",
    url   = "https://doi.org/10.1016/j.jesp.2021.104159"
  ),

  barbourTheoreticalSampling2022 = list(
    short = "Barbour, 2022",
    full  = "Barbour, R. S. (2022). <em>Theoretical Sampling</em>. SAGE Publications Ltd.",
    url   = "https://doi.org/10.4135/9781526421036785176"
  ),

  beetsInfluencePilotSmall2023 = list(
    short = "Beets et al., 2023",
    full  = "Beets, M. W., Weaver, R. G., Ioannidis, J. P. A., Pfledderer, C. D., Jones, A., Von Klinggraeff, L., &amp; Armstrong, B. (2023). Influence of Pilot and Small Trials in Meta-Analyses of Behavioral Interventions: A Meta-Epidemiological Study. <em>Systematic Reviews</em>, <em>12</em>(1), 21.",
    url   = "https://doi.org/10.1186/s13643-023-02184-7"
  ),

  boddySampleSizeQualitative2016 = list(
    short = "Boddy, 2016",
    full  = "Boddy, C. R. (2016). Sample Size for Qualitative Research. <em>Qualitative Market Research: An International Journal</em>, <em>19</em>(4), 426–432.",
    url   = "https://doi.org/10.1108/QMR-06-2016-0053"
  ),

  bowenNaturalisticInquirySaturation2008 = list(
    short = "Bowen, 2008",
    full  = "Bowen, G. A. (2008). Naturalistic Inquiry and the Saturation Concept: A Research Note. <em>Qualitative Research</em>, <em>8</em>(1), 137–152.",
    url   = "https://doi.org/10.1177/1468794107085301"
  ),

  campbellPurposiveSamplingComplex2020 = list(
    short = "Campbell et al., 2020",
    full  = "Campbell, S., Greenwood, M., Prior, S., Shearer, T., Walkem, K., Young, S., Bywaters, D., &amp; Walker, K. (2020). Purposive Sampling: Complex or Simple? Research Case Examples. <em>Journal of Research in Nursing</em>, <em>25</em>(8), 652–661.",
    url   = "https://doi.org/10.1177/1744987120927206"
  ),

  carlsonEffectsTrainingLoad2022 = list(
    short = "Carlson et al., 2022",
    full  = "Carlson, L., Gschneidner, D., Steele, J., &amp; Fisher, J. (2022). The Effects of Training Load During Dietary Intervention Upon Fat Loss: A Randomized Crossover Trial. <em>Research Quarterly for Exercise and Sport</em>, <em>94</em>, 990–1000.",
    url   = "https://doi.org/10.1080/02701367.2022.2097625"
  ),

  changUpdateSampleSize2016 = list(
    short = "Chang, 2016",
    full  = "Chang, B. (2016). Update and Sample Size Justification. <em></em>.",
    url   = "https://consensus.app/papers/update-and-sample-size-justification-chang/32c3dfba81ca527cadb80aba6074fc72/"
  ),

  chenWeek5Confidence2016 = list(
    short = "Chen et al., 2016",
    full  = "Chen, S. C., Lakens, D., Yang, C. K., Kung, C. C., 詹雅淇, Chan, S., Hung, Y. Y., Yen, J., &amp; Cheung, P. (2016). Week 5: Confidence Intervals, Sample Size Justification, P-Curve Analysis. <em></em>.",
    url   = "https://consensus.app/papers/week-5-confidence-intervals-sample-size-justification-chen-lakens/65183aaa9d94572b8b3da8b8a00cbfc9/"
  ),

  costiganPerformingSmallTelescopesAnalysis2024 = list(
    short = "Costigan et al., 2024",
    full  = "Costigan, S., Ruscio, J., &amp; Crawford, J. T. (2024). Performing Small-Telescopes Analysis by Resampling: Empirically Constructing Confidence Intervals and Estimating Statistical Power for Measures of Effect Size. <em>Advances in Methods and Practices in Psychological Science</em>, <em>7</em>(1), 25152459241227865.",
    url   = "https://doi.org/10.1177/25152459241227865"
  ),

  danzigerBalancingSensitivitySpecificity2022 = list(
    short = "Danziger et al., 2022",
    full  = "Danziger, M., Collazo, A., Dirnagl, U., &amp; Toelch, U. (2022). Balancing Sensitivity and Specificity in Preclinical Research. <em>bioRxiv</em>.",
    url   = "https://doi.org/10.1101/2022.01.17.476585"
  ),

  dickMeaningfulAssociationsRedux2025 = list(
    short = "Dick et al., 2025",
    full  = "Dick, A., Comer, J., Bayat, M., Curtis, M., Hayes, T., Pruden, S., Hawes, S., Gonzalez, R., Laird, A., &amp; Graziano, P. (2025). Meaningful Associations Redux: Quantifying and Interpreting Effect Size in the Context of the Adolescent Brain and Cognitive Development Study. <em>Developmental Cognitive Neuroscience</em>, <em>76</em>.",
    url   = "https://doi.org/10.1016/j.dcn.2025.101630"
  ),

  foleyInterviewingVehicleTheoretical2021 = list(
    short = "Foley et al., 2021",
    full  = "Foley, G., Timonen, V., Conlon, C., &amp; O’Dare, C. E. (2021). Interviewing as a Vehicle for Theoretical Sampling in Grounded Theory. <em>International Journal of Qualitative Methods</em>, <em>20</em>, 1609406920980957.",
    url   = "https://doi.org/10.1177/1609406920980957"
  ),

  `giner-sorollaPowerDetectWhat2024` = list(
    short = "Giner-Sorolla et al., 2024",
    full  = "Giner-Sorolla, R., Montoya, A. K., Reifman, A., Carpenter, T., LewisJr, N. A., Aberson, C. L., Bostyn, D. H., Conrique, B. G., Ng, B. W., Schoemann, A. M., &amp; Soderberg, C. (2024). Power to Detect What? Considerations for Planning and Evaluating Sample Size. <em>Personality and Social Psychology Review</em>, <em>28</em>(3), 276–301.",
    url   = "https://doi.org/10.1177/10888683241228328"
  ),

  guestSimpleMethodAssess2020 = list(
    short = "Guest et al., 2020",
    full  = "Guest, G., Namey, E., &amp; Chen, M. (2020). A Simple Method to Assess and Report Thematic Saturation in Qualitative Research. <em>PLOS ONE</em>, <em>15</em>(5), e0232076.",
    url   = "https://doi.org/10.1371/journal.pone.0232076"
  ),

  hardwickeReducingBiasIncreasing2023 = list(
    short = "Hardwicke &amp; Wagenmakers, 2023",
    full  = "Hardwicke, T. E., &amp; Wagenmakers, E. J. (2023). Reducing Bias, Increasing Transparency and Calibrating Confidence with Preregistration. <em>Nature Human Behaviour</em>, <em>7</em>(1), 15–26.",
    url   = "https://doi.org/10.1038/s41562-022-01497-2"
  ),

  kuhbergerPublicationBiasPsychology2014 = list(
    short = "Kühberger et al., 2014",
    full  = "Kühberger, A., Fritz, A., &amp; Scherndl, T. (2014). Publication Bias in Psychology: A Diagnosis Based on the Correlation between Effect Size and Sample Size. <em>PLOS ONE</em>, <em>9</em>(9), e105825.",
    url   = "https://doi.org/10.1371/journal.pone.0105825"
  ),

  lakensIntroductionSuperpower2025 = list(
    short = "Lakens &amp; Caldwell, 2025",
    full  = "Lakens, D., &amp; Caldwell, A. R. (2025). <em>Introduction to Superpower</em>. The Comprehensive R Archive Network.",
    url   = "https://cran.r-project.org/web/packages/Superpower/vignettes/intro_to_superpower.html"
  ),

  lakensSimulationBasedPowerAnalysis2021 = list(
    short = "Lakens &amp; Caldwell, 2021",
    full  = "Lakens, D., &amp; Caldwell, A. R. (2021). Simulation-Based Power Analysis for Factorial Analysis of Variance Designs. <em>Advances in Methods and Practices in Psychological Science</em>, <em>4</em>(1), 2515245920951503.",
    url   = "https://doi.org/10.1177/2515245920951503"
  ),

  leongomezPoderEstadisticoTamano2020a = list(
    short = "Leongómez, 2020",
    full  = "Leongómez, J. D. (2020). <em>Poder Estadístico y Tamaño de Muestra En R [Statistical Power and Sample Size Calculation in R]</em>. YouTube: Investigación Abierta.",
    url   = "https://www.youtube.com/playlist?list=PLHk7UNt35ccVdyHqnQ6oXVYA6JBNFrE1x"
  ),

  malterudSampleSizeQualitative2016 = list(
    short = "Malterud et al., 2016",
    full  = "Malterud, K., Siersma, V. D., &amp; Guassora, A. D. (2016). Sample Size in Qualitative Interview Studies: Guided by Information Power. <em>Qualitative Health Research</em>, <em>26</em>(13), 1753–1760.",
    url   = "https://doi.org/10.1177/1049732315617444"
  ),

  mccrumSampleSizeJustifications2022 = list(
    short = "McCrum et al., 2022",
    full  = "McCrum, C., family=Beek, G. P. U., Schumacher, C., Janssen, S., &amp; Van Hooren, B. (2022). Sample Size Justifications in Gait \\& Posture. <em>Gait \\& Posture</em>, <em>92</em>, 333–337.",
    url   = "https://doi.org/10.1016/j.gaitpost.2021.12.010"
  ),

  mesquidaPublicationBiasStatistical2023 = list(
    short = "Mesquida et al., 2023",
    full  = "Mesquida, C., Murphy, J., Lakens, D., &amp; Warne, J. (2023). Publication Bias, Statistical Power and Reporting Practices in the Journal of Sports Sciences: Potential Barriers to Replicability. <em>Journal of Sports Sciences</em>, <em>41</em>(16), 1507–1517.",
    url   = "https://doi.org/10.1080/02640414.2023.2269357"
  ),

  montgomerySampleSizeJustification2025 = list(
    short = "Montgomery, 2025",
    full  = "Montgomery, R. (2025). Sample Size Justification in Feasibility Studies: Moving beyond Published Guidance. <em>Pilot and Feasibility Studies</em>, <em>11</em>.",
    url   = "https://doi.org/10.1186/s40814-025-01675-9"
  ),

  mouraMethodologicalPathReach2022 = list(
    short = "Moura et al., 2022",
    full  = "Moura, G. O. P. U., Silva, Í. R., Silva, G. P. P. U., Santos, K. A., Crespo, M. D. C. A., &amp; Silva, G. M. P. U. (2022). Methodological Path to Reach the Degree of Saturation in Qualitative Research: Grounded Theory. <em>Revista Brasileira de Enfermagem</em>, <em>75</em>, e20201379.",
    url   = "https://doi.org/10.1590/0034-7167-2020-1379"
  ),

  mthuliDefineExplainJustify2022 = list(
    short = "Mthuli et al., 2022",
    full  = "Mthuli, S. A., Ruffin, F., &amp; Singh, N. (2022). ‘Define, Explain, Justify, Apply’ (DEJA): An Analytic Tool for Guiding Qualitative Research Sample Size. <em>International Journal of Social Research Methodology</em>, <em>25</em>(6), 809–821.",
    url   = "https://doi.org/10.1080/13645579.2021.1941646"
  ),

  nascimentoTheoreticalSaturationQualitative2018 = list(
    short = "Nascimento et al., 2018",
    full  = "Nascimento, L. D. C. N., family=Souza, G. V. P. U., Oliveira, I. C. D. S., family=Moraes, G. R. M. M. P. U., family=Aguiar, G. C. B. P. U., &amp; family=Silva, G. F. P. U. (2018). Theoretical Saturation in Qualitative Research: An Experience Report in Interview with Schoolchildren. <em>Revista Brasileira de Enfermagem</em>, <em>71</em>, 228–233.",
    url   = "https://doi.org/10.1590/0034-7167-2016-0616"
  ),

  nelsonUsingConceptualDepth2017 = list(
    short = "Nelson, 2017",
    full  = "Nelson, J. (2017). Using Conceptual Depth Criteria: Addressing the Challenge of Reaching Saturation in Qualitative Research. <em>Qualitative Research</em>, <em>17</em>(5), 554–570.",
    url   = "https://doi.org/10.1177/1468794116679873"
  ),

  nosekRegisteredReportsMethod2014 = list(
    short = "Nosek &amp; Lakens, 2014",
    full  = "Nosek, B. A., &amp; Lakens, D. (2014). Registered Reports: A Method to Increase the Credibility of Published Results. <em>Social Psychology</em>, <em>45</em>(3), 137–141.",
    url   = "https://doi.org/10.1027/1864-9335/a000192"
  ),

  oreillyUnsatisfactorySaturationCritical2013 = list(
    short = "O’Reilly &amp; Parker, 2013",
    full  = "O’Reilly, M., &amp; Parker, N. (2013). ‘Unsatisfactory Saturation’: A Critical Exploration of the Notion of Saturated Sample Sizes in Qualitative Research. <em>Qualitative Research</em>, <em>13</em>(2), 190–197.",
    url   = "https://doi.org/10.1177/1468794112446106"
  ),

  rahimiSaturationQualitativeResearch2024 = list(
    short = "Rahimi &amp; khatooni, 2024",
    full  = "Rahimi, S., &amp; khatooni, M. (2024). Saturation in Qualitative Research: An Evolutionary Concept Analysis. <em>International Journal of Nursing Studies Advances</em>, <em>6</em>, 100174.",
    url   = "https://doi.org/10.1016/j.ijnsa.2024.100174"
  ),

  reichPreregistrationRegisteredReports2021 = list(
    short = "Reich, 2021",
    full  = "Reich, J. (2021). Preregistration and Registered Reports. <em>Educational Psychologist</em>, <em>56</em>(2), 101–109.",
    url   = "https://doi.org/10.1080/00461520.2021.1900851"
  ),

  richardsonSampleSizeJustification1998 = list(
    short = "Richardson &amp; Leurgans, 1998",
    full  = "Richardson, D., &amp; Leurgans, S. (1998). Sample Size Justification in Phase III/IV Clinical Trials. <em>Neuroepidemiology</em>, <em>17</em>, 63–66.",
    url   = "https://doi.org/10.1159/000026154"
  ),

  riesthuisExpertOpinionsSmallest2021 = list(
    short = "Riesthuis et al., 2021",
    full  = "Riesthuis, P., Mangiulli, I., Broers, N., &amp; Otgaar, H. (2021). Expert Opinions on the Smallest Effect Size of Interest in False Memory Research. <em>Applied Cognitive Psychology</em>.",
    url   = "https://doi.org/10.1002/acp.3911"
  ),

  riesthuisLensLegalProfessionals2025 = list(
    short = "Riesthuis et al., 2025",
    full  = "Riesthuis, P., Rassin, E., Bücken, C., Booker, A., Chin, J., Goldfarb, D., Deferme, D., &amp; Otgaar, H. (2025). Through the Lens of Legal Professionals: Examining the Smallest Effect Size of Interest for Eyewitness Memory Research. <em>The International Journal of Evidence \\& Proof</em>.",
    url   = "https://doi.org/10.1177/13657127251357630"
  ),

  riesthuisPValuesPracticalRelevance2025 = list(
    short = "Riesthuis et al., 2025",
    full  = "Riesthuis, P., Otgaar, H., Setiawan, T., Sumampouw, N., &amp; Bücken, C. (2025). From P-Values to Practical Relevance:  An Introduction to Effect Sizes Through a Legal Psychological Example. <em>Psychological Research on Urban Society</em>, <em>8</em>(2).",
    url   = "https://doi.org/10.7454/proust.v8i2.1204"
  ),

  riesthuisReadyROCTutorial2025 = list(
    short = "Riesthuis et al., 2025",
    full  = "Riesthuis, P., Otgaar, H., &amp; Bücken, C. (2025). Ready to ROC? A Tutorial on Simulation-Based Power Analyses for Null Hypothesis Significance, Minimum-Effect, and Equivalence Testing for ROC Curve Analyses. <em>Behavior Research Methods</em>, <em>57</em>.",
    url   = "https://doi.org/10.3758/s13428-025-02646-x"
  ),

  riesthuisSimulationBasedPowerAnalyses2024 = list(
    short = "Riesthuis, 2024",
    full  = "Riesthuis, P. (2024). Simulation-Based Power Analyses for the Smallest Effect Size of Interest: A Confidence-Interval Approach for Minimum-Effect and Equivalence Testing. <em>Advances in Methods and Practices in Psychological Science</em>, <em>7</em>.",
    url   = "https://doi.org/10.1177/25152459241240722"
  ),

  riesthuisWhenAreScientific2025 = list(
    short = "Riesthuis &amp; Cribbie, 2025",
    full  = "Riesthuis, P., &amp; Cribbie, R. (2025). When Are Scientific Findings Deemed Practically or Theoretically Relevant? A Literature Review on Minimum-Effect Testing. <em>The Quantitative Methods for Psychology</em>.",
    url   = "https://doi.org/10.20982/tqmp.21.2.p082"
  ),

  sandelowskiSampleSizeQualitative1995 = list(
    short = "Sandelowski, 1995",
    full  = "Sandelowski, M. (1995). Sample Size in Qualitative Research. <em>Research in Nursing \\& Health</em>, <em>18</em>(2), 179–183.",
    url   = "https://doi.org/10.1002/nur.4770180211"
  ),

  schwarzEvaluatingPsychologicalResearch2016 = list(
    short = "Schwarz &amp; Clore, 2016",
    full  = "Schwarz, N., &amp; Clore, G. L. (2016). Evaluating Psychological Research Requires More Than Attention to the N: A Comment on Simonsohn’s (2015) “Small Telescopes”. <em>Psychological Science</em>, <em>27</em>(10), 1407–1409.",
    url   = "https://doi.org/10.1177/0956797616653102"
  ),

  shiAccountingPilotStudy2021 = list(
    short = "Shi et al., 2021",
    full  = "Shi, Y., Liu, F., Li, S., &amp; Chen, J. (2021). Accounting for Pilot Study Uncertainty in Sample Size Determination of Randomized Controlled Trials. <em>Statistics in Biopharmaceutical Research</em>, <em>13</em>(2), 192–202.",
    url   = "https://doi.org/10.1080/19466315.2020.1831951"
  ),

  simCanSampleSize2018 = list(
    short = "Sim et al., 2018",
    full  = "Sim, J., Saunders, B., Waterfield, J., &amp; Kingstone, T. (2018). Can Sample Size in Qualitative Research Be Determined a Priori?. <em>International Journal of Social Research Methodology</em>, <em>21</em>(5), 619–634.",
    url   = "https://doi.org/10.1080/13645579.2018.1454643"
  ),

  simonsohnSmallTelescopesDetectability2015 = list(
    short = "Simonsohn, 2015",
    full  = "Simonsohn, U. (2015). Small Telescopes: Detectability and the Evaluation of Replication Results. <em>Psychological Science</em>, <em>26</em>(5), 559–569.",
    url   = "https://doi.org/10.1177/0956797614567341"
  ),

  spathBestPracticesSevere2025 = list(
    short = "Späth, 2025",
    full  = "Späth, C. (2025). From Best Practices to Severe Testing: A~Methodological Response to Büsch and Loffing (2024). <em>German Journal of Exercise and Sport Research</em>.",
    url   = "https://doi.org/10.1007/s12662-025-01072-7"
  ),

  teresiGuidelinesDesigningEvaluating2022 = list(
    short = "Teresi et al., 2022",
    full  = "Teresi, J. A., Yu, X., Stewart, A. L., &amp; Hays, R. D. (2022). Guidelines for Designing and Evaluating Feasibility Pilot Studies. <em>Medical Care</em>, <em>60</em>(1), 95.",
    url   = "https://doi.org/10.1097/MLR.0000000000001664"
  ),

  thorneGreatSaturationDebate2020 = list(
    short = "Thorne, 2020",
    full  = "Thorne, S. (2020). The Great Saturation Debate: What the “S Word” Means and Doesn’t Mean in Qualitative Research Reporting. <em>Canadian Journal of Nursing Research</em>, <em>52</em>(1), 3–5.",
    url   = "https://doi.org/10.1177/0844562119898554"
  ),

  vasileiouCharacterisingJustifyingSample2018 = list(
    short = "Vasileiou et al., 2018",
    full  = "Vasileiou, K., Barnett, J., Thorpe, S., &amp; Young, T. (2018). Characterising and Justifying Sample Size Sufficiency in Interview-Based Studies: Systematic Analysis of Qualitative Health Research over a 15-Year Period. <em>BMC Medical Research Methodology</em>, <em>18</em>(1), 148.",
    url   = "https://doi.org/10.1186/s12874-018-0594-7"
  ),

  waldronNotAllPreregistrations2022 = list(
    short = "Waldron &amp; Allen, 2022",
    full  = "Waldron, S., &amp; Allen, C. (2022). Not All Pre-Registrations Are Equal. <em>Neuropsychopharmacology</em>, <em>47</em>(13), 2181–2183.",
    url   = "https://doi.org/10.1038/s41386-022-01418-x"
  ),

  williamsReplySeanWilliams2023 = list(
    short = "Williams et al., 2023",
    full  = "Williams, S., Carson, R., &amp; Tóth, K. (2023). Reply from Sean Williams, Richard G. Carson and Katalin Tóth. <em>The Journal of Physiology</em>, <em>602</em>.",
    url   = "https://doi.org/10.1113/jp285954"
  ),

  yangPublicationBiasImpacts2023 = list(
    short = "Yang et al., 2023",
    full  = "Yang, Y., Sánchez-Tójar, A., O’Dea, R. E., Noble, D. W. A., Koricheva, J., Jennions, M. D., Parker, T. H., Lagisz, M., &amp; Nakagawa, S. (2023). Publication Bias Impacts on Effect Size, Statistical Power, and Magnitude (Type M) and Sign (Type S) Errors in Ecology and Evolutionary Biology. <em>BMC Biology</em>, <em>21</em>(1), 71.",
    url   = "https://doi.org/10.1186/s12915-022-01485-y"
  ),

  lincolnItRigorousTrustworthiness1986 = list(
    short = "Lincoln &amp; Guba, 1986",
    full  = "Lincoln, Y. S., &amp; Guba, E. G. (1986). But is it rigorous? Trustworthiness and authenticity in naturalistic evaluation. <em>New Directions for Program Evaluation</em>, <em>1986</em>(30), 73–84.",
    url   = "https://doi.org/10.1002/ev.1427"
  ),

  tongConsolidatedCriteriaReporting2007 = list(
    short = "Tong et al., 2007",
    full  = "Tong, A., Sainsbury, P., &amp; Craig, J. (2007). Consolidated criteria for reporting qualitative research (COREQ): a 32-item checklist for interviews and focus groups. <em>International Journal for Quality in Health Care</em>, <em>19</em>(6), 349–357.",
    url   = "https://doi.org/10.1093/intqhc/mzm042"
  ),

  obrienStandardsReportingQualitative2014 = list(
    short = "O'Brien et al., 2014",
    full  = "O'Brien, B. C., Harris, I. B., Beckman, T. J., Reed, D. A., &amp; Cook, D. A. (2014). Standards for reporting qualitative research: a synthesis of recommendations. <em>Academic Medicine</em>, <em>89</em>(9), 1245–1251.",
    url   = "https://doi.org/10.1097/ACM.0000000000000388"
  ),

  tongEnhancingTransparencyReporting2012 = list(
    short = "Tong et al., 2012",
    full  = "Tong, A., Flemming, K., McInnes, E., Oliver, S., &amp; Craig, J. (2012). Enhancing transparency in reporting the synthesis of qualitative research: ENTREQ. <em>BMC Medical Research Methodology</em>, <em>12</em>, 181.",
    url   = "https://doi.org/10.1186/1471-2288-12-181"
  ),

  ocathainQualityMixedMethods2008 = list(
    short = "O'Cathain et al., 2008",
    full  = "O'Cathain, A., Murphy, E., &amp; Nicholl, J. (2008). The quality of mixed methods studies in health services research. <em>Journal of Health Services Research &amp; Policy</em>, <em>13</em>(2), 92–98.",
    url   = "https://doi.org/10.1258/jhsrp.2007.007074"
  )

)
