library(dplyr)

##################################################################
#
# Processing Script for MOVING all 4 year grad rates data
# Created by Jenna Daly
# On 03/22/2017
#
##################################################################

#Setup environment
sub_folders <- list.files()
raw_from_github_location <- grep("raw$", sub_folders, value=T)
raw_from_github_path <- (paste0(getwd(), "/", raw_from_github_location))
top_level_dp_path <- (paste0(getwd(), "/"))

# lapply(filestocopy, function(x) file.copy(paste (origindir, x , sep = "/"),  
#        paste (targetdir,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))

all_dp_categories <- c("All-Students", 
                       "ELL", 
                       "Gender",
                       "High-Needs",
                       "Lunch",
                       "Race", 
                       "Special-Education")

all_dp_folders <- c("Four-Year-Grad-Rates-by-All-Students", 
                    "Four-Year-Grad-Rates-by-ELL", 
                    "Four-Year-Grad-Rates-by-Gender", 
                    "Four-Year-Grad-Rates-by-High-Needs", 
                    "Four-Year-Grad-Rates-by-Meal-Eligibility",
                    "Four-Year-Grad-Rates-by-Race-Ethnicity", 
                    "Four-Year-Grad-Rates-by-Special-Education-Status")

for( i in 1:length(all_dp_folders)) {
  current_dp_path <- (paste0(top_level_dp_path, all_dp_folders[i], "/", "raw")) ##destination
  current_raw_files <-dir(raw_from_github_path, pattern = all_dp_categories[i]) ##filetocopy
  copy_current <- lapply(current_raw_files, function(x) file.copy(paste (raw_from_github_path, x , sep = "/"),  
                         paste (current_dp_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))
}
