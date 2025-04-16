# 📚 Module Learning Outcome Audit

This project involved a comprehensive audit of learning outcomes across Royal Holloway's department of Media Arts module offerings. The goal was to collect and analyse the distribution of learning outcomes to ensure alignment with departmental objectives and external quality assurance requirements. Data was extracted from the college's intranet, analysed, and visualised to provide actionable insights for curriculum development.

![Audit Dasboard FS](https://github.com/user-attachments/assets/80a9ca93-47f5-4bfa-b336-28351622b095)


![Sankey Diagram](https://github.com/JP-Kelly/module-learning-outcome-audit/blob/main/files/Flourish%20Sankey.gif)

## 🔧 Key Technologies

* **R:** Used for web scraping and initial data extraction from the college's intranet.
* **Tableau:** Employed for exploratory data analysis and the creation of interactive visualisations, including word clouds and Sankey diagrams.

## Project Overview

1.  🔍 **Data Extraction (R):**
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

2. 📊 **Data Analysis and Visualisation (Tableau):**
    * The extracted data was analysed in Tableau to identify patterns, outliers, and areas for improvement in the distribution of learning outcomes across modules.
    * Interactive visualisations, including word clouds and Sankey diagrams, were created to facilitate the exploration of the data by faculty staff and administrators.
    * The visualisations allowed for the identification of:
        * Common themes and keywords in learning outcomes.
        * Modules with overlapping or redundant learning outcomes.
        * Gaps in learning outcome coverage across the curriculum.
        * The flow of learning outcomes across different modules and module levels.

## 🏆 Project Leadership and Impact

I conceived of and led this project, which spanned approximately two months. The automated approach I developed significantly reduced the workload compared to the initially planned manual audit. This saved an estimated 30+ hours of labor across 3-4 colleagues, streamlining the audit process and allowing for more efficient curriculum review.

## 👨‍💻 Example Code

While the exact R code used for data extraction is unavailable due to privacy constraints, the code snippet below provides a working example of a typical web scraping workflow. It is heavily commented to guide you in adapting it for different websites and data structures:

```
# Load necessary libraries
library(rvest)      # For web scraping
library(dplyr)      # For data manipulation
library(purrr)      # For functional programming (map)
library(httr)       # For handling HTTP requests
library(readr)      # For writing CSV files

# --- Example Module Codes ---
module_codes <- c("MA1051", "MA1052", "MA2031", "MA2045", "MA3001")

# --- Example Base URL (Placeholder!) ---
# Replace this with the actual base URL of your college's module documentation
base_url <- "https://www.examplecollege.ac.uk/modules/"

# --- Function to Scrape Module Data ---
scrape_module_data <- function(module_code) {
  
  # Construct the full URL
  url <- paste0(base_url, module_code)
  
  # Introduce a delay to be respectful (2 seconds)
  Sys.sleep(2)
  
  # --- Error Handling for HTTP Requests ---
  tryCatch({
    # Send an HTTP GET request
    response <- GET(url)
    stop_for_status(response)  # Raise an error for bad status codes (404, 500, etc.)
    
    # Parse the HTML content
    page <- read_html(response)
    
    # --- Example Scraping Logic (Adjust to your actual HTML structure!) ---
    # This is where you'll need to inspect the actual website and
    # use CSS selectors or XPath to extract the data.
    
    module_name <- page %>% html_element(".module-title") %>% html_text()
    module_level <- page %>% html_element(".module-level") %>% html_text()
    learning_outcomes <- page %>% html_elements(".learning-outcome") %>% html_text() %>% paste(collapse = "; ")
    
    # --- Return the extracted data as a data frame ---
    data.frame(
      Module_Code = module_code,
      Module_Name = module_name,
      Module_Level = module_level,
      Learning_Outcomes = learning_outcomes,
      stringsAsFactors = FALSE  # Important to avoid factors!
    )
    
  }, error = function(e) {
    # --- Handle errors (e.g., if a page doesn't exist) ---
    warning(paste("Could not retrieve data for", module_code, ":", e$message))
    # --- Return an empty data frame in case of an error ---
    data.frame(
      Module_Code = module_code,
      Module_Name = NA_character_,
      Module_Level = NA_character_,
      Learning_Outcomes = NA_character_,
      stringsAsFactors = FALSE
    )
  })
}

# --- Apply the scraping function to all module codes ---
all_module_data <- map_dfr(module_codes, scrape_module_data)

# --- Write the data to a CSV file ---
write_csv(all_module_data, "module_data.csv")

print("Module data scraped and saved to module_data.csv")
```
## Project Structure
