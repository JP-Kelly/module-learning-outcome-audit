# 📚 Module Learning Outcome Audit

This project involved a comprehensive audit of learning outcomes across Royal Holloway's department of Media Arts module offerings. The goal was to collect and analyse the distribution of learning outcomes to ensure alignment with departmental objectives and external quality assurance requirements. Data was extracted from the college's intranet, analysed, and visualised to provide actionable insights for curriculum development.

## Key Technologies

* **R:** Used for web scraping and initial data extraction from the college's intranet.
* **Tableau:** Employed for exploratory data analysis and the creation of interactive visualisations, including word clouds and Sankey diagrams.

## Project Overview

1.  **Data Extraction (R):**
    * Learning outcome data was extracted from the college's intranet using R scripts.
    * The scripts automated the process of looping through module pages and extracting relevant information, including module code, level, and learning outcome text.
    * Due to the protected nature of the college's intranet, the exact scraping code cannot be shared, but an example of a general web scraping approach can be provided (see "Additional Notes" section).
    * The following data points were captured:
        * `Module_Code`
        * `Module_Name`
        * `Module_Level`
        * `Theory_Practice`
        * `Module_Credits`
        * `Optional_Mandatory`
        * `Co_Requisites`
        * `Pre_Requisites`
        * `Banned_Combinations`
        * `Banner_URL`
        * `Module_Recruitment_2022-23`
        * `Recurring_Course`
        * `Basket`
        * `Notes`

2.  **Data Analysis and Visualisation (Tableau):**
    * The extracted data was analysed in Tableau to identify patterns, outliers, and areas for improvement in the distribution of learning outcomes across modules.
    * Interactive visualisations, including word clouds and Sankey diagrams, were created to facilitate the exploration of the data by faculty staff and administrators.
    * The visualisations allowed for the identification of:
        * Common themes and keywords in learning outcomes.
        * Modules with overlapping or redundant learning outcomes.
        * Gaps in learning outcome coverage across the curriculum.
        * The flow of learning outcomes across different modules and module levels.

## Project Structure
