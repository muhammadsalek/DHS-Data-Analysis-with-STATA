<div align="center">

![Header](https://capsule-render.vercel.app/api?type=waving&color=0:1A5276,100:00d4ff&height=200&section=header&text=DHS%20Data%20Analysis%20with%20STATA&fontSize=36&fontColor=ffffff&animation=fadeIn&fontAlignY=35&desc=A%20Graduate-Level,%20Applied%20Course%20in%20Complex%20Survey%20Data%20Analysis&descAlignY=55&descSize=16)

**Department of Statistics · Shahjalal University of Science and Technology (SUST), Sylhet, Bangladesh**
*In affiliation with the Bangladesh Institute for Innovative Health Research (BIIHR) and the Institute for Health Metrics and Evaluation (IHME), Seattle*

[![License: MIT](https://img.shields.io/badge/License-MIT-10b981?style=for-the-badge&labelColor=0d1117&logo=opensourceinitiative&logoColor=10b981)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active%20Course-7c3aed?style=for-the-badge&labelColor=0d1117)](#course-roadmap)
[![Level](https://img.shields.io/badge/Level-Graduate%20%2F%20Early--Career%20Researcher-00d4ff?style=for-the-badge&labelColor=0d1117)](#learning-objectives)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0005--5973--461X-A6CE39?style=for-the-badge&logo=orcid&logoColor=white)](https://orcid.org/0009-0005-5973-461X)

</div>

---

## Table of Contents

1. [Abstract](#abstract)
2. [Learning Objectives](#learning-objectives)
3. [Intended Audience & Prerequisites](#intended-audience--prerequisites)
4. [Pedagogical Approach](#pedagogical-approach)
5. [Course Roadmap](#course-roadmap)
6. [Repository Structure](#repository-structure)
7. [Data Source & Data Availability Statement](#data-source--data-availability-statement)
8. [Software & Environment Setup](#software--environment-setup)
9. [Getting Started](#getting-started)
10. [Methodological Framework](#methodological-framework)
11. [Academic Integrity & Usage Policy](#academic-integrity--usage-policy)
12. [Companion Media](#companion-media)
13. [Author & Affiliations](#author--affiliations)
14. [How to Cite](#how-to-cite)
15. [Acknowledgements](#acknowledgements)
16. [License](#license)

---

## Abstract

This repository hosts the course materials for **"DHS Data Analysis with STATA,"** a structured, applied curriculum designed to train students and early-career researchers in the analysis of **Demographic and Health Survey (DHS)** data using **Stata**. The course follows the full analytical pipeline used in peer-reviewed population health research: from raw dataset import and data management, through variable recoding and missing-data handling, to the declaration of complex survey design, weighted descriptive analysis, and (survey-)logistic regression modeling, concluding with the production of publication-ready output tables consistent with manuscript reporting standards (e.g., STROBE-style reporting).

Materials are released episode-by-episode alongside the **Salek Data Lab** video series and are intended to function as a **self-contained, reproducible teaching repository**: each lecture is paired with a slide deck and an executable `.do` script so that learners can follow, replicate, and extend the analysis independently.

---

## Learning Objectives

By the end of this course, learners will be able to:

| # | Objective | Competency Domain |
|:-:|:----------|:------------------|
| 1 | Import and inspect DHS recode datasets (`.dta`) in Stata | Data Management |
| 2 | Interpret DHS file structure, naming conventions, and codebooks | Data Literacy |
| 3 | Perform variable recoding and labeling (`generate`, `egen`, `recode`, `label`) | Data Management |
| 4 | Diagnose and handle missing data appropriately (`misstable`, complete-case strategies) | Data Quality |
| 5 | Correctly declare a complex survey design using `svyset` (PSU, strata, weights) | Survey Methodology |
| 6 | Produce weighted descriptive and cross-tabulated statistics | Applied Biostatistics |
| 7 | Fit and interpret standard and survey-adjusted logistic regression models | Statistical Modeling |
| 8 | Conduct basic model diagnostics for regression adequacy | Statistical Modeling |
| 9 | Generate publication-ready tables (e.g., adjusted odds ratio tables) | Scientific Communication |
| 10 | Apply manuscript-consistent reporting standards for survey-based epidemiological studies | Scientific Writing |

---

## Intended Audience & Prerequisites

This course is designed primarily for:

- Graduate students in **public health, epidemiology, biostatistics, demography, or population sciences**
- Early-career researchers preparing manuscripts using **DHS-type complex survey data**
- Analysts transitioning from general statistical software experience to **survey-weighted modeling in Stata**

**Prerequisites:**

- Working knowledge of basic statistics (descriptive statistics, hypothesis testing, and an introduction to regression)
- Familiarity with the Stata command-line interface is helpful but not required — Day 01 begins from fundamentals
- No prior experience with survey data analysis is assumed

---

## Pedagogical Approach

Each instructional unit ("Day") in this repository follows a consistent three-part structure:

```
  Lecture Slides (.pdf)         Conceptual foundation, terminology, and worked theory
          │
          ▼
  Companion Script (.do)        Fully commented, line-by-line executable Stata code
          │
          ▼
  Video Walkthrough (YouTube)   Live demonstration with narrated reasoning
```

This mirrors a standard graduate teaching-lab format: theory is introduced first, reinforced through guided live coding, and consolidated through an independently executable script that learners can re-run, annotate, and adapt to their own datasets.

**Overall Course Pipeline:**

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

## Course Roadmap

| Day | Topic | Slides | Script | Status |
|:---:|:------|:------:|:------:|:------:|
| **01** | Data Import, Cleaning, Exploration & Data Management | [`STATA_Day_01.pdf`](STATA_Day_01.pdf) | [`Salek_day_01(Data management).do`](Salek_day_01(Data%20management).do) | ✅ Available |
| 02 | Variable Recoding & Labeling | — | — | 🔜 Coming Soon |
| 03 | Missing Data Handling & Survey Design Declaration (`svyset`) | — | — | 🔜 Coming Soon |
| 04 | Weighted Descriptive Statistics & Cross-Tabulation | — | — | 🔜 Coming Soon |
| 05 | Logistic Regression & Model Building | — | — | 🔜 Coming Soon |
| 06 | Survey-Weighted Logistic Regression & Model Diagnostics | — | — | 🔜 Coming Soon |
| 07 | Publication-Ready Tables & Manuscript Reporting Standards | — | — | 🔜 Coming Soon |

> **Note:** Each unit builds cumulatively on the previous one. Learners are encouraged to complete the modules sequentially rather than out of order, as later scripts assume variables and recodes established in earlier sessions.

---

## Repository Structure

```
DHS-Data-Analysis-with-STATA/
│
├── README.md                                  Course overview and documentation (this file)
├── LICENSE                                     MIT License
│
├── STATA_Day_01.pdf                            Day 01 lecture slides — Import, Clean & Explore
├── Salek_day_01(Data management).do            Day 01 companion script — Data preprocessing
│
├── slides/                                     (Planned) Day-wise lecture slide decks
├── stata-code/                                 (Planned) Day-wise companion .do scripts
├── docs/                                        (Planned) Supplementary notes, codebooks, references
└── sample-output/                               (Planned) Example output tables and figures
```

> As additional sessions are released, materials will be migrated into the `slides/` and `stata-code/` directories, organized by day, to preserve a clean and navigable repository structure. Until that reorganization, files are hosted at the repository root.

---

## Data Source & Data Availability Statement

| Dataset | Source | Description |
|:--------|:-------|:-------------|
| **BDHS 2022** | [DHS Program](https://dhsprogram.com) | Bangladesh Demographic and Health Survey, 2022 round |

> [!IMPORTANT]
> **Data are not redistributed in this repository**, in accordance with the DHS Program's data use terms. DHS microdata are made available to registered users free of charge for legitimate research purposes. To obtain the datasets used in this course:
>
> 1. Register for an account at [dhsprogram.com](https://dhsprogram.com)
> 2. Submit a data request specifying the intended research use
> 3. Download the relevant **recode files** (e.g., Individual Recode, Household Recode) for **Bangladesh, 2022**
>
> Users of this repository are responsible for complying with the DHS Program's terms of use and any applicable institutional review requirements when handling DHS microdata.

---

## Software & Environment Setup

**Required Software**

- Stata version **15 or later** (Stata 17/18 recommended for full `svy` command compatibility and modern table-output commands)

**Recommended Stata Packages** *(install via `ssc install`, as needed by later modules)*

```stata
ssc install estout, replace      // publication-ready regression tables
ssc install outreg2, replace     // alternative table export
ssc install fre, replace         // frequency tables with labels
```

**Recommended Folder Setup**

```stata
* Set your working directory to the cloned/downloaded repository
cd "/path/to/DHS-Data-Analysis-with-STATA"

* Place your registered DHS .dta file(s) in a local /data subfolder
* (not tracked by this repository — see Data Availability Statement above)
```

---

## Getting Started

1. **Clone or download** this repository:
   ```bash
   git clone https://github.com/muhammadsalek/DHS-Data-Analysis-with-STATA.git
   ```
2. **Obtain the BDHS 2022 dataset** following the [Data Availability Statement](#data-source--data-availability-statement) above.
3. **Review the lecture slides** for the day you are studying (e.g., `STATA_Day_01.pdf`).
4. **Open Stata**, set your working directory, and run the corresponding script:
   ```stata
   cd "/path/to/DHS-Data-Analysis-with-STATA"
   do "Salek_day_01(Data management).do"
   ```
5. **Follow along with the paired YouTube episode** for narrated explanation of each command block.
6. Repeat for each subsequent day as new materials are released.

---

## Methodological Framework

This course adheres to standard practices for the analysis of complex survey data, consistent with the **DHS Guide to DHS Statistics** and commonly cited methodological conventions in demographic and health research:

- **Survey design variables**: primary sampling unit (PSU), sampling strata, and sampling weights are explicitly declared prior to any weighted analysis (`svyset`), rather than analyzing DHS data as a simple random sample.
- **Weight normalization**: sampling weights are rescaled where appropriate to avoid inflated effective sample sizes.
- **Missing data**: handled transparently, with the extent and pattern of missingness reported prior to modeling.
- **Regression reporting**: model output is presented as adjusted odds ratios (AOR) with 95% confidence intervals, consistent with conventions in peer-reviewed epidemiological journals.

---

## Academic Integrity & Usage Policy

- Materials in this repository are provided for **educational and non-commercial academic use**.
- Learners are encouraged to **adapt the companion scripts** to their own DHS-type datasets (e.g., other country rounds, other DHS-family surveys such as MICS) for coursework, theses, or independent research, with attribution.
- This repository does **not** constitute a substitute for a formal biostatistics or survey-methods curriculum; it is intended as a **practical supplement** to applied coursework.
- Users citing analyses derived from this course in academic manuscripts should cite both the **original DHS data source** and, where relevant, this course (see [How to Cite](#how-to-cite)).

---

## Companion Media

<div align="center">

[![YouTube](https://img.shields.io/badge/Watch%20on-Salek%20Data%20Lab-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@SalekResearch)

</div>

Video lectures accompanying each module are released on the **Salek Data Lab** series, hosted on the **Salek Research Hub** YouTube channel, with narrated, step-by-step walkthroughs oriented toward the Bangladeshi and broader global public health research community.

---

## Author & Affiliations

**Md Salek Miah**
Department of Statistics, Shahjalal University of Science and Technology (SUST), Sylhet, Bangladesh
Statistical Analysis Instructor, Bangladesh Institute for Innovative Health Research (BIIHR)
Global Burden of Disease (GBD) Collaborator, Institute for Health Metrics and Evaluation (IHME), Seattle

[![ORCID](https://img.shields.io/badge/ORCID-0009--0005--5973--461X-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0009-0005-5973-461X)
[![Google Scholar](https://img.shields.io/badge/Google%20Scholar-Profile-4285F4?style=flat-square&logo=googlescholar&logoColor=white)](https://scholar.google.com/citations?user=oV99NYoAAAAJ)
[![GitHub](https://img.shields.io/badge/GitHub-muhammadsalek-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/muhammadsalek)

---

## How to Cite

If you use these materials in teaching, coursework, or research preparation, please cite as follows:

```bibtex
@misc{miah_dhs_stata_course_2026,
  title        = {DHS Data Analysis with STATA: A Practical Course},
  author       = {Miah, Md Salek},
  year         = {2026},
  howpublished = {\url{https://github.com/muhammadsalek/DHS-Data-Analysis-with-STATA}},
  note         = {Department of Statistics, Shahjalal University of Science and Technology (SUST)}
}
```

When referencing the underlying dataset, cite the DHS Program directly, e.g.:

> National Institute of Population Research and Training (NIPORT), and ICF. *Bangladesh Demographic and Health Survey 2022.* Dhaka, Bangladesh, and Rockville, Maryland, USA: NIPORT and ICF.

---

## Acknowledgements

This course draws on the analytical conventions established by the **DHS Program** (ICF International) for the analysis of complex survey data, and reflects instructional practices developed through applied teaching at SUST and collaborative work with BIIHR and IHME.

---

## License

Released under the **MIT License** — Copyright © 2026 Md Salek Miah.
Free for academic, educational, and non-commercial use. Attribution appreciated when materials are reused or adapted.

---

<div align="center">

**Department of Statistics · Shahjalal University of Science and Technology · Sylhet, Bangladesh**

[![Made with Stata](https://img.shields.io/badge/Made%20with-Stata-1A5276?style=flat-square&logoColor=white)](https://www.stata.com)
[![BDHS 2022](https://img.shields.io/badge/Data-BDHS%202022-00d4ff?style=flat-square)](https://dhsprogram.com)
[![SUST](https://img.shields.io/badge/University-SUST%20Bangladesh-f59e0b?style=flat-square)](https://www.sust.edu)

*⭐ Star this repository to follow along with the course.*

![Footer](https://capsule-render.vercel.app/api?type=waving&color=0:1A5276,100:00d4ff&height=120&section=footer)

</div>
