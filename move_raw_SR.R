library(dplyr)

##################################################################
#
# Processing Script for MOVING all suspension rates data
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

all_dp_categories <- c("_-", 
                       "ELL", 
                       "Gender",
                       "Lunch",
                       "Race", 
                       "SpEd")

all_dp_folders <- c("Suspension-Rates-by-All-Students", 
                    "Suspension-Rates-by-ELL", 
                    "Suspension-Rates-by-Gender", 
                    "Suspension-Rates-by-Meal-Eligibility",
                    "Suspension-Rates-by-Race-Ethnicity", 
                    "Suspension-Rates-by-Special-Education-Status")

for( i in 1:length(all_dp_folders)) {
  current_dp_path <- (paste0(top_level_dp_path, all_dp_folders[i], "/", "raw")) ##destination
  current_raw_files <-dir(raw_from_github_path, pattern = all_dp_categories[i]) ##filetocopy
  copy_current <- lapply(current_raw_files, function(x) file.copy(paste (raw_from_github_path, x , sep = "/"),  
                         paste (current_dp_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))
}
