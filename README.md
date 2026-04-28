<img src="www/just-n-logo.svg" height="120" alt="Just-N Framework logo">

# Just-N Framework: Aplicación Interactiva

> **Just-N Framework: Interactive Application**: A Shiny app to guide researchers in deciding, applying, and justifying sample size strategies for quantitative, qualitative, and mixed-methods studies.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19860616.svg)](https://doi.org/10.5281/zenodo.19860616)

---

## Descripción

**Just-N Framework: Aplicación Interactiva** es una aplicación Shiny que guía a investigadores de cualquier disciplina a decidir, aplicar y justificar la estrategia más adecuada para el tamaño de muestra de su estudio.

La app cubre los tres grandes paradigmas de investigación:

- **Cuantitativo**: poder estadístico (SESOI), precisión de estimaciones, diseños secuenciales, replicación, análisis inverso de poder y simulaciones Monte Carlo.
- **Cualitativo**: saturación teórica y de datos, diversidad y representatividad, muestreo comunitario (CBPR), justificación narrativa y compromisos éticos.
- **Mixto**: complementariedad cuanti–cuali en diseños integrados.

Incluye calculadoras interactivas (`pwr`, Fisher-z), árbol de decisiones parametrizado, guías metodológicas con referencias citables, y una bibliografía completa de las fuentes utilizadas.

---

## Uso

### Versión en línea

[https://jdleongomez.github.io/just_n_app/](https://jdleongomez.github.io/just_n_app/)

### Ejecución local

```r
# Instalar dependencias
install.packages(c("shiny", "bslib", "bsicons", "pwr"))

# Ejecutar
shiny::runApp()
```

> La app está diseñada para desplegarse como aplicación Shinylive (WebAssembly) sin servidor. Todos los cálculos se ejecutan en el navegador.

---

## Estructura del repositorio

```
just_n_app/
├── app.R                      # Entrada principal
├── R/
│   ├── i18n.R                 # Internacionalización
│   ├── theme.R                # Tema ggplot2
│   ├── cite.R                 # Sistema de citas con popover
│   ├── mod_intro.R            # Módulo: Introducción
│   ├── mod_tree.R             # Módulo: Árbol de decisiones
│   ├── mod_quant.R            # Módulo: Calculadoras cuantitativas
│   ├── mod_montecarlo.R       # Módulo: Simulaciones Monte Carlo
│   ├── mod_qual_resources.R   # Módulo: Rigor y reporte cualitativo
│   ├── mod_mixed.R            # Módulo: Diseños mixtos
│   └── mod_bibliography.R     # Módulo: Bibliografía completa
├── data/
│   ├── strings_es.R           # Strings UI en español
│   ├── strings_en.R           # Strings UI en inglés (en desarrollo)
│   ├── refs.R                 # 88 referencias con metadatos APA
│   ├── strategies.R           # Definición de las 12 estrategias
│   └── strategy_details_es.R  # Contenido narrativo por estrategia
└── www/
    ├── custom.css             # Estilos visuales
    ├── cite.js                # Inicialización de popovers Bootstrap 5
    ├── just-n-logo.svg        # Logo de la app
    └── orcid_logo.svg         # Ícono ORCID
```

---

## Citar

Si usas esta app en tu investigación:

> Leongómez, J. D. (2026). *Just-N Framework: Aplicación Interactiva* (v1.0). Zenodo. https://doi.org/10.5281/zenodo.19860616

Esta aplicación fue inspirada por la guía estática original:

> Leongómez, J. D. (2025). *Just-N Framework* (v1.3). Zenodo. https://doi.org/10.5281/zenodo.16934468

---

## Comentarios y reportes de problemas

¿Encontraste un error o tienes una sugerencia? Abre un [issue en GitHub](https://github.com/jdleongomez/just_n_app/issues).

---

## Autor

**Juan David Leongómez** [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--0092--6298-brightgreen?logo=orcid)](https://orcid.org/0000-0002-0092-6298)

Laboratorio de Evolución del Comportamiento Humano (EvoCo / CODEC)
[Universidad El Bosque](https://www.unbosque.edu.co), Bogotá, Colombia
[jleongomez@unbosque.edu.co](mailto:jleongomez@unbosque.edu.co)

---

## Licencia

Este proyecto está disponible bajo la licencia [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).
