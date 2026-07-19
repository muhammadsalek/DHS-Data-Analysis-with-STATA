<div align="center">

![Header](https://capsule-render.vercel.app/api?type=waving&color=0:1A5276,100:00d4ff&height=220&section=header&text=DHS%20Data%20Analysis%20with%20STATA&fontSize=40&fontColor=ffffff&animation=fadeIn&fontAlignY=35&desc=A%20Practical,%20Step-by-Step%20Course%20on%20DHS%20Survey%20Data%20Analysis&descAlignY=55&descSize=18)

[![Typing SVG](https://readme-typing-svg.demolab.com/?font=Fira+Code&size=20&pause=1000&color=00D4FF&center=true&vCenter=true&width=700&lines=Import+%C2%B7+Clean+%C2%B7+Explore+%C2%B7+Recode;Survey+Weights+%C2%B7+svyset+%C2%B7+Weighted+Statistics;Logistic+Regression+%C2%B7+Publication-Ready+Tables)](https://git.io/typing-svg)

</div>

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-10b981?style=for-the-badge&labelColor=0d1117&logo=opensourceinitiative&logoColor=10b981)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active%20Course-7c3aed?style=for-the-badge&labelColor=0d1117)](#course-roadmap)
[![Level](https://img.shields.io/badge/Level-Beginner%20to%20Advanced-00d4ff?style=for-the-badge&labelColor=0d1117)](#what-youll-learn)

</div>

<div align="center">

![Stata](https://img.shields.io/badge/Stata-1A5276?style=flat-square&logoColor=white)
![BDHS](https://img.shields.io/badge/BDHS_2022-Data-00d4ff?style=flat-square&logoColor=white)
![YouTube](https://img.shields.io/badge/YouTube-Salek%20Data%20Lab-FF0000?style=flat-square&logo=youtube&logoColor=white)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0005--5973--461X-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0009-0005-5973-461X)
[![GitHub stars](https://img.shields.io/github/stars/muhammadsalek/DHS-Data-Analysis-with-STATA?style=flat-square&color=f59e0b)](https://github.com/muhammadsalek/DHS-Data-Analysis-with-STATA/stargazers)

</div>

---

## Overview

A practical, step-by-step course for analyzing **Demographic and Health Survey (DHS)** datasets using **Stata** — from raw `.dta` import through survey-weighted logistic regression and publication-ready tables. Built episode-by-episode for the **Salek Data Lab** YouTube series, aimed at early-career researchers working with DHS-type complex survey data.

**Course Pipeline:**

```
Raw DHS Dataset (.dta)
        │
        ▼
  Import & Explore        cd · use · describe · codebook · summarize
        │
        ▼
  Variable Recoding       generate · egen · recode · label
        │
        ▼
  Missing Data            misstable · complete-case handling
        │
        ▼
  Survey Design            svyset · weights · PSU · strata
        │
        ▼
  Weighted Statistics      svy: tab · weighted crosstabs
        │
        ▼
  Regression Modeling      logistic · svy: logistic
        │
        ▼
  Publication Output       AOR tables · model diagnostics · manuscript reporting
```

---

## What You'll Learn

- [x] Import DHS datasets into Stata
- [x] Understand DHS file structure and variable naming conventions
- [x] Variable recoding (`generate`, `egen`, `recode`)
- [x] Missing data handling
- [x] Survey weights and normalization
- [x] `svyset` — declaring the complex survey design
- [x] Weighted descriptive statistics
- [x] Weighted cross-tabulation
- [x] Logistic regression
- [x] Survey logistic regression (`svy: logistic`)
- [x] Model diagnostics
- [x] Publication-ready tables
- [x] Manuscript reporting standards

---

## Course Roadmap

| Day | Topic | Status |
|:---:|:------|:------:|
| **01** | Import, Clean \& Explore DHS Data | ✅ Available |
| 02 | Variable Recoding \& Labeling | 🔜 Coming Soon |
| 03 | Missing Data \& Survey Design (`svyset`) | 🔜 Coming Soon |
| 04 | Weighted Descriptives \& Cross-tabulation | 🔜 Coming Soon |
| 05 | Logistic Regression \& Model Building | 🔜 Coming Soon |
| 06 | Survey Logistic Regression \& Diagnostics | 🔜 Coming Soon |
| 07 | Publication-Ready Tables \& Manuscript Reporting | 🔜 Coming Soon |

> Slide decks and companion `.do` files are released alongside each YouTube episode.

---

## Repository Structure

```
DHS-Data-Analysis-with-STATA/
│
├── README.md
├── LICENSE
├── STATA_Day_01.pdf            ← Day 01 lecture slides (Import, Clean & Explore)
│
├── slides/                     ← Beamer/PDF lecture slides, by day
├── stata-code/                 ← Companion .do files, by day
├── docs/                       ← Supplementary notes and references
└── sample-output/              ← Example tables and figures
```

---

## Data Source

| Dataset | Source | Description |
|:--------|:-------|:------------|
| **BDHS 2022** | [DHS Program](https://dhsprogram.com) | Bangladesh Demographic & Health Survey 2022 |

> [!IMPORTANT]
> DHS datasets are **NOT included** in this repository. Please obtain approval and download datasets directly from [dhsprogram.com](https://dhsprogram.com).

---

## Quick Start

**Requirements:** Stata `>= 15`

```stata
cd "/path/to/DHS-Data-Analysis-with-STATA"
* Follow along with slides/STATA_Day_01.pdf and the companion .do file for each day
```

1. Register at [dhsprogram.com](https://dhsprogram.com) and download the relevant DHS recode file
2. Open the corresponding day's slide deck in `slides/`
3. Run the companion script in `stata-code/` alongside the video

---

## YouTube Playlist

<div align="center">

[![YouTube](https://img.shields.io/badge/Watch%20on-Salek%20Data%20Lab-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@SalekResearch)

</div>

New episodes are released as part of the **Salek Data Lab** series on the **Salek Research Hub** YouTube channel — practical DHS analysis, explained step-by-step for the Bangladeshi and global public health research community.

---

## Author

**Md Salek Miah**
Department of Statistics, Shahjalal University of Science and Technology (SUST), Sylhet, Bangladesh
Statistical Analysis Instructor, BIIHR · GBD Collaborator, IHME (Seattle)

[![ORCID](https://img.shields.io/badge/ORCID-0009--0005--5973--461X-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0009-0005-5973-461X)
[![Google Scholar](https://img.shields.io/badge/Google%20Scholar-Profile-4285F4?style=flat-square&logo=googlescholar&logoColor=white)](https://scholar.google.com/citations?user=oV99NYoAAAAJ)
[![GitHub](https://img.shields.io/badge/GitHub-muhammadsalek-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/muhammadsalek)

---

## Cite This Course

```bibtex
@misc{miah_dhs_stata_course_2026,
  title  = {DHS Data Analysis with STATA: A Practical Course},
  author = {Miah, Md Salek},
  year   = {2026},
  url    = {https://github.com/muhammadsalek/DHS-Data-Analysis-with-STATA}
}
```

---

## License

MIT License — Copyright (c) 2026 Md Salek Miah
Open for academic and educational use. Attribution appreciated.

---

<div align="center">

**Department of Statistics · Shahjalal University of Science and Technology · Sylhet, Bangladesh**

[![Made with Stata](https://img.shields.io/badge/Made%20with-Stata-1A5276?style=flat-square&logoColor=white)](https://www.stata.com)
[![BDHS 2022](https://img.shields.io/badge/Data-BDHS%202022-00d4ff?style=flat-square)](https://dhsprogram.com)
[![SUST](https://img.shields.io/badge/University-SUST%20Bangladesh-f59e0b?style=flat-square)](https://www.sust.edu)

*⭐ Star this repo to follow along with the course!*

![Footer](https://capsule-render.vercel.app/api?type=waving&color=0:1A5276,100:00d4ff&height=120&section=footer)

</div>
