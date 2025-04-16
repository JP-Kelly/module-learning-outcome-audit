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
