COVID-19 Mortality & Socio-Economic Determinants

# Project Overview
This research examines the structural and socio-economic factors influencing COVID-19 death rates across Local Authorities in England. By integrating Census 2021 indicators with official mortality data, the study explores the pandemic as a syndemic—where virus impact is worsened by pre-existing social and economic inequalities.

# Research Goal
To determine which non-clinical factors—including household deprivation, mobility patterns, and age structure—exerted the greatest influence on COVID-19 fatalities.

# Technical Toolkit
Data Engineering: SQL (SQLite) for complex joining and geographic boundary reconciliation.
Statistical Environment: R (Amelia, psych, corrgram, car, relaimpo).
Techniques:
Dimensionality Reduction: Principal Component Analysis (PCA).
Clustering: K-Means Analysis for regional pattern recognition.
Predictive Modeling: Stepwise Multiple Regression and LMG Relative Importance.
Automation: Functional R loops for batch diagnostic plotting.

# Methodology & Workflow
1. Data Cleaning & Engineering (SQL)
A critical challenge addressed was reconciling 2018 LAD codes (mortality data) with 2023 LAD structures (Census 2021).
Boundary Management: Performed manual updates for district merges (e.g., Buckinghamshire) and name changes (e.g., Shepway to Folkestone and Hythe).
Normalization: Calculated rates per 1,000 population across all variables to ensure fair comparison between diverse Local Authorities

2. Exploratory Data Analysis (R)
   Normality & Diagnostics: Confirmed a normal distribution for the dependent variable using the Shapiro-Wilk test (p = 0.2575)
   Correlation Mapping: Used visual correlograms and scatterplots to identify initial associations between "Bad Health," "Deprivation," and mortality.

   3. Advanced Modeling
   PCA: Distilled 30+ variables into 4 principal components—explaining 77% of total variance.
   Stepwise Regression: Developed a parsimonious model ($R^2 = 0.33$) to focus on high-impact drivers16161616.

   # Key Insights
   Strongest Risk Factor: Household Deprivation Level 2 had the highest contribution to mortality rates.
   Protective Factors: Localized mobility (commuting < 2km) and a higher proportion of young adults (aged 25-34) were associated with lower death rates.
   Conclusion: Deprivation and mobility data were stronger independent predictors of COVID-19 death than simple population size.

   ├── SQL_Scripts/
│   └── data_cleaning.sql     # LAD boundary updates & multi-theme joins
├── R_Analysis/
│   └── applied_analysis.R    # PCA, Clustering, Stepwise Regression & Loops
├── Data/
│   └── final_covid_data.csv  # Final standardized dataset
└── Plots/                    # Automated diagnostic outputs
    ├── Histograms/
    ├── Boxplots/
    └── QQplots/

    # How to Run
1. SQL: Execute data_cleaning.sql in a SQLite environment to replicate the data merging process.
2. R: Open applied_analysis.R. Ensure the final_covid_data.csv is in your working directory.
3. The script will automatically install missing libraries and generate a Plots/ directory containing diagnostic visualizations for all numeric variables.
