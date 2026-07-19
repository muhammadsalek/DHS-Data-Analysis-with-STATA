\documentclass[12pt,a4paper]{article}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{geometry}
\geometry{margin=1in}

% ==================== PACKAGES ====================
\usepackage{graphicx}
\usepackage{xcolor}
\usepackage{hyperref}
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{array}
\usepackage{colortbl}
\usepackage{tikz}
\usetikzlibrary{positioning, shapes, arrows, calc}
\usepackage{listings}
\usepackage{amsmath, amssymb}
\usepackage{caption}
\usepackage{multirow}
\usepackage{enumitem}
\usepackage{tcolorbox}
\usepackage{fontawesome5}

% ==================== COLOR DEFINITIONS ====================
\definecolor{primary}{RGB}{31,78,121}
\definecolor{secondary}{RGB}{16,124,16}
\definecolor{accent}{RGB}{0,150,200}
\definecolor{stata}{RGB}{26,83,142}
\definecolor{darkbg}{RGB}{13,17,23}
\definecolor{lightbg}{RGB}{240,245,250}
\definecolor{border}{RGB}{200,210,220}
\definecolor{green}{RGB}{16,185,129}
\definecolor{purple}{RGB}{124,58,237}
\definecolor{cyan}{RGB}{0,212,255}
\definecolor{codebg}{RGB}{248,248,248}
\definecolor{codecomment}{RGB}{0,128,0}

% ==================== HYPERREF SETTINGS ====================
\hypersetup{
    colorlinks=true,
    linkcolor=primary,
    urlcolor=accent,
    citecolor=green,
    pdftitle={DHS Data Analysis with STATA},
    pdfauthor={Md Salek Miah},
}

% ==================== CUSTOM COMMANDS ====================
\newcommand{\badge}[2]{%
    \begin{tcolorbox}[
        colback=#2!15,
        colframe=#2,
        arc=3pt,
        boxrule=0.5pt,
        boxsep=2pt,
        left=4pt,
        right=4pt,
        top=2pt,
        bottom=2pt,
        fontupper=\small\bfseries
    ]#1\end{tcolorbox}%
}

\newcommand{\checkmark}{\textcolor{green}{\faCheckCircle}}

% ============================================================
% DOCUMENT START
% ============================================================
\begin{document}

% ============================================================
% TITLE SECTION
% ============================================================
\begin{center}
{\Huge \textbf{Demographic and Health Surveys (DHS)}}
\vspace{0.2cm}

{\Large \textbf{Data Analysis with STATA}}
\vspace{0.2cm}

{\large A Complete Hands-On Course for Analyzing DHS Data}
\vspace{0.5cm}

\begin{minipage}{0.8\textwidth}
\centering
\rule{\textwidth}{1pt}
\vspace{0.3cm}
\end{minipage}

\vspace{0.3cm}
\textbf{Md Salek Miah} \\
Department of Statistics \\
Shahjalal University of Science and Technology (SUST) \\
Sylhet-3114, Bangladesh
\vspace{0.2cm}

\href{https://orcid.org/0009-0005-5973-461X}{%
    \faOrcid\enspace ORCID: 0009-0005-5973-461X
} \quad
\href{https://scholar.google.com/citations?user=oV99NYoAAAAJ}{%
    \faGoogleScholar\enspace Google Scholar
} \quad
\href{https://github.com/muhammadsalek}{%
    \faGithub\enspace GitHub
}

\vspace{0.3cm}
\begin{minipage}{0.7\textwidth}
\centering
\href{https://youtube.com/@salekdatalab}{%
    \faYoutube\enspace \textcolor{red}{Salek Data Lab}
}
\end{minipage}

\vspace{0.3cm}
\begin{minipage}{0.8\textwidth}
\centering
\rule{\textwidth}{1pt}
\end{minipage}

\end{center}

\vspace{0.3cm}

% ============================================================
% BADGES SECTION
% ============================================================
\begin{center}
\begin{minipage}{0.9\textwidth}
\centering
\begin{tcolorbox}[
    colback=darkbg!5,
    colframe=darkbg!30,
    arc=5pt,
    boxrule=1pt,
    boxsep=4pt,
    left=8pt,
    right=8pt,
    top=4pt,
    bottom=4pt
]
\scriptsize
\badge{License: MIT}{green}%
\badge{Status: Active Research}{purple}%
\badge{Output: Q1 Journal Ready}{cyan}%
\badge{Stata}{stata}%
\badge{R 4.2+}{blue}%
\badge{BDHS 2022}{cyan}%
\badge{ggplot2}{red}%
\badge{tidyverse}{blue}%
\badge{viridis}{green}%
\badge{patchwork}{purple}%
\end{tcolorbox}
\end{minipage}
\end{center}

\vspace{0.3cm}

% ============================================================
% RESEARCH PROJECT SECTION
% ============================================================
\section*{Research Project: Unmet Need for Family Planning — Bangladesh}

\subsection*{Title}
\textbf{Association Between Internet Use and Unmet Need for Family Planning among Ever-Married Women in Bangladesh: Evidence from BDHS 2022}

\subsection*{Overview}
This study examines the association between internet use and unmet need for family planning among ever-married women in Bangladesh, using data from the \textbf{Bangladesh Demographic and Health Survey (BDHS) 2022}. The analysis integrates spatial mapping at the division level with statistical modeling to identify regional disparities and the role of digital access in reproductive health outcomes.

\subsection*{Analysis Pipeline}
\begin{center}
\begin{tikzpicture}[node distance=0.5cm, >=stealth, scale=0.8, transform shape]
\node[draw, fill=stata!20, rounded corners, minimum width=6cm, minimum height=0.5cm, align=center] (data) {BDHS 2022 Survey Data};
\node[draw, fill=stata!30, rounded corners, minimum width=6cm, minimum height=0.5cm, align=center, below=0.3cm of data] (prep) {Preprocessing: cleaning, recoding, survey weighting};
\node[draw, fill=stata!40, rounded corners, minimum width=6cm, minimum height=0.5cm, align=center, below=0.3cm of prep] (stat) {Statistical Analysis: logistic regression, odds ratios};
\node[draw, fill=stata!50, rounded corners, minimum width=6cm, minimum height=0.5cm, align=center, below=0.3cm of stat] (spatial) {Spatial Analysis: division-level choropleth maps};
\node[draw, fill=green!30, rounded corners, minimum width=6cm, minimum height=0.5cm, align=center, below=0.3cm of spatial] (output) {Outputs: Q1 figures, CSV tables, maps};
\draw[->, thick] (data) -- (prep);
\draw[->, thick] (prep) -- (stat);
\draw[->, thick] (stat) -- (spatial);
\draw[->, thick] (spatial) -- (output);
\end{tikzpicture}
\end{center}

\subsection*{Key Highlights}
\begin{table}[h]
\centering
\small
\begin{tabular}{p{4cm}p{8cm}}
\toprule
\textbf{Feature} & \textbf{Details} \\
\midrule
Exposure Variable & Internet use (frequency and access) \\
Outcome Variable & Unmet need for family planning \\
Population & Ever-married women of reproductive age \\
Survey Design & BDHS 2022 complex survey with proper weighting \\
Spatial Scope & 8 divisions of Bangladesh \\
Statistical Method & Weighted logistic regression, odds ratios, 95\% CI \\
Spatial Method & Division-level choropleth mapping \\
Output Format & 300 DPI publication-ready figures \\
\bottomrule
\end{tabular}
\end{table}

% ============================================================
% COURSE SECTION
% ============================================================
\section*{DHS Data Analysis with STATA Course}

\subsection*{What You'll Learn}
\begin{minipage}{0.45\textwidth}
\begin{itemize}[leftmargin=0.7cm, itemsep=2pt]
\item[\checkmark] Import DHS datasets
\item[\checkmark] Understand DHS file structure
\item[\checkmark] Variable recoding
\item[\checkmark] Missing data handling
\item[\checkmark] Survey weights
\item[\checkmark] svyset command
\end{itemize}
\end{minipage}
\begin{minipage}{0.45\textwidth}
\begin{itemize}[leftmargin=0.7cm, itemsep=2pt]
\item[\checkmark] Weighted descriptive statistics
\item[\checkmark] Cross-tabulation
\item[\checkmark] Logistic regression
\item[\checkmark] Model diagnostics
\item[\checkmark] Publication-ready tables
\item[\checkmark] Manuscript reporting
\end{itemize}
\end{minipage}

\subsection*{Repository Structure}
\begin{center}
\begin{tikzpicture}[scale=0.75, transform shape]
\node[draw, fill=lightbg, rounded corners, minimum width=6cm, minimum height=0.5cm, align=center, font=\ttfamily] (root) {DHS-Data-Analysis-with-STATA/};
\node[draw, fill=white, rounded corners, minimum width=5cm, minimum height=0.4cm, align=center, font=\ttfamily, below=0.15cm of root] (slides) {slides/};
\node[draw, fill=white, rounded corners, minimum width=5cm, minimum height=0.4cm, align=center, font=\ttfamily, below=0.1cm of slides] (stata) {stata-code/};
\node[draw, fill=white, rounded corners, minimum width=5cm, minimum height=0.4cm, align=center, font=\ttfamily, below=0.1cm of stata] (docs) {docs/};
\node[draw, fill=white, rounded corners, minimum width=5cm, minimum height=0.4cm, align=center, font=\ttfamily, below=0.1cm of docs] (output) {sample-output/};
\end{tikzpicture}
\end{center}

\subsection*{YouTube Playlist}
\href{https://youtube.com/@salekdatalab}{%
    \faYoutube\enspace \textcolor{red}{\textbf{Salek Data Lab}}
} — Subscribe for weekly DHS tutorials and research methodology videos.

% ============================================================
% AUTHORS SECTION
% ============================================================
\section*{Authors \& Affiliation}

\subsection*{Corresponding Author}
\textbf{Md Jamal Uddin, Ph.D.} \\
Professor, Department of Statistics \\
Shahjalal University of Science and Technology (SUST), Sylhet-3114, Bangladesh \\
Faculty of Graduate Education, Daffodil International University, Dhaka, Bangladesh \\
\faPhone\enspace +8801716972846 \\
\faEnvelope\enspace \href{mailto:jamal-sta@sust.edu}{jamal-sta@sust.edu} \\
\faOrcid\enspace \href{https://orcid.org/0000-0002-8360-3274}{ORCID: 0000-0002-8360-3274}

\vspace{0.3cm}

\subsection*{Co-Author}
\textbf{Md Salek Miah} \\
Research Assistant, Department of Statistics \\
Shahjalal University of Science and Technology (SUST), Sylhet-3114, Bangladesh \\
\faEnvelope\enspace \href{mailto:saleksta@gmail.com}{saleksta@gmail.com} \\
\faOrcid\enspace \href{https://orcid.org/0009-0005-5973-461X}{ORCID: 0009-0005-5973-461X} \\
\faGithub\enspace \href{https://github.com/muhammadsalek}{GitHub: muhammadsalek} \\
\faLinkedin\enspace \href{https://www.linkedin.com/in/md-salek-miah/}{LinkedIn: Md Salek Miah}

\vspace{0.3cm}

\subsection*{Affiliation}
\textbf{Biostatistics, Epidemiology, and Public Health Research Team} \\
Department of Statistics \\
Shahjalal University of Science and Technology (SUST) \\
Sylhet-3114, Bangladesh

% ============================================================
% DATA SOURCE SECTION
% ============================================================
\section*{Data Source}

\begin{table}[h]
\centering
\small
\begin{tabular}{p{3.5cm}p{4cm}p{5cm}}
\toprule
\textbf{Dataset} & \textbf{Source} & \textbf{Description} \\
\midrule
BDHS 2022 & DHS Program & Bangladesh Demographic \& Health Survey 2022 \\
Division Shapefile & Bangladesh Admin Boundaries & 8 Divisions — spatial polygons \\
\bottomrule
\end{tabular}
\end{table}

\begin{tcolorbox}[
    colback=codebg,
    colframe=stata,
    arc=3pt,
    boxrule=0.5pt,
    fontupper=\small
]
\textbf{Important:} DHS datasets are NOT included in this repository. Please obtain approval and download datasets directly from: \\
\url{https://dhsprogram.com}
\end{tcolorbox}

% ============================================================
% QUICK START SECTION
% ============================================================
\section*{Quick Start}

\subsection*{Requirements}
\textbf{Stata} $\ge$ 15 \\
\textbf{R} $\ge$ 4.2

\subsection*{Step 1 — Statistical Analysis (Stata)}
\begin{lstlisting}[
    language=,
    basicstyle=\ttfamily\small,
    backgroundcolor=\color{codebg},
    frame=single,
    rulecolor=\color{border}
]
cd "/path/to/BDHS-Unmet-Need-Analysis"
do Analysis.do
do Spatials.do
\end{lstlisting}

\subsection*{Step 2 — Spatial Figures (R)}
\begin{lstlisting}[
    language=,
    basicstyle=\ttfamily\small,
    backgroundcolor=\color{codebg},
    frame=single,
    rulecolor=\color{border}
]
packages <- c("sf", "readxl", "dplyr", "stringr", "janitor",
              "ggplot2", "ggspatial", "ggtext", "tmap",
              "spdep", "spatialreg", "rmapshaper", "viridis",
              "classInt", "patchwork", "tidyverse")

installed <- packages %in% rownames(installed.packages())
if (any(!installed)) {
  install.packages(packages[!installed], dependencies = TRUE)
}
invisible(lapply(packages, library, character.only = TRUE))

source("Spatial_Figures.R")
\end{lstlisting}

% ============================================================
% RESEARCH IMPACT SECTION
% ============================================================
\section*{Research Impact}

\begin{table}[h]
\centering
\small
\begin{tabular}{p{3.5cm}p{8.5cm}}
\toprule
\textbf{Domain} & \textbf{Contribution} \\
\midrule
Reproductive Health & Examines digital determinants of family planning uptake \\
Spatial Epidemiology & Maps geographic disparities in unmet need across divisions \\
Public Health & Evidence for SDG 3 — Universal Health Coverage monitoring \\
Health Policy & Actionable insights for targeted interventions in Bangladesh \\
\bottomrule
\end{tabular}
\end{table}

% ============================================================
% CITATION SECTION
% ============================================================
\section*{Citation}

\begin{lstlisting}[
    language=,
    basicstyle=\ttfamily\small,
    backgroundcolor=\color{codebg},
    frame=single,
    rulecolor=\color{border}
]
@article{miah_uddin_unmet_need_2025,
  title   = {Association Between Internet Use and Unmet Need for Family Planning
             among Ever-Married Women in Bangladesh: Evidence from BDHS 2022},
  author  = {Miah, Md Salek and Uddin, Md Jamal},
  journal = {[Journal Name]},
  year    = {2025},
  note    = {Q1 Journal Submission},
  url     = {https://github.com/muhammadsalek/BDHS-Unmet-Need-Analysis}
}
\end{lstlisting}

% ============================================================
% LICENSE SECTION
% ============================================================
\section*{License}

MIT License — Copyright (c) 2025 Md Salek Miah \& Md Jamal Uddin

Open for academic research. Citation required for publication use.

\vspace{0.3cm}

\begin{minipage}{0.9\textwidth}
\centering
\begin{tcolorbox}[
    colback=lightbg,
    colframe=border,
    arc=3pt,
    boxrule=0.5pt,
    fontupper=\small
]
\begin{verbatim}
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
\end{verbatim}
\end{tcolorbox}
\end{minipage}

% ============================================================
% FOOTER
% ============================================================
\vspace{0.5cm}
\begin{center}
\begin{minipage}{0.9\textwidth}
\centering
\rule{\textwidth}{1pt}
\vspace{0.3cm}

\textbf{Biostatistics, Epidemiology, and Public Health Research Team} \\
Department of Statistics · Shahjalal University of Science and Technology · Sylhet-3114, Bangladesh

\vspace{0.3cm}
\small
\href{https://www.stata.com}{\textcolor{stata}{Made with Stata}} \quad
\textcolor{border}{|} \quad
\href{https://r-project.org}{\textcolor{blue}{Made with R}} \quad
\textcolor{border}{|} \quad
\href{https://dhsprogram.com}{\textcolor{cyan}{BDHS 2022}} \quad
\textcolor{border}{|} \quad
\href{https://www.sust.edu}{\textcolor{orange}{SUST Bangladesh}}

\vspace{0.3cm}
\scriptsize
\faStar\enspace Star this repo if it helped your research!

\vspace{0.3cm}
\rule{\textwidth}{1pt}
\end{minipage}
\end{center}

% ============================================================
% END
% ============================================================
\end{document}
