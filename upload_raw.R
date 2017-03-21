library(dplyr)

##################################################################
#
# Processing Script for all "District-Level" EdSight data
# Created by Jenna Daly
# On 03/14/2017
#
##################################################################

#Bring in new data from raw_from_github folder and copy to the designated "raw" folders in each data set directory.

#Setup environment
sub_folders <- list.files()
raw_from_github_location <- grep("Raw", sub_folders, value=T)
raw_from_github_path <- (paste0(getwd(), "/", raw_from_github_location))

#all paths to raw EdSight data
raw_dataset_paths <- list.dirs(raw_from_github_path, full.names = TRUE)

# Below is the list of all possible datasets, if new data is available, it goes into the 
# raw_from_github folder and copies files into their respective "raw" folders within their data set folders

all_dp_locations <- c("Annual-Expenditures", "Chronic-Absenteeism", 
                      "Bullying", "CMT-CAPT-Science", 
                      "College-Entrance-and-Persistence", "Educator-Demographics", 
                      "Educator-Qualifications", "Student-Enrollment", 
                      "Five-Year-Graduation-Rates", "Four-Year-Graduation-Rates", 
                      "Incidents", "Per-Pupil-Expenditures", 
                      "Primary-Disability", "Revenue-Sources", 
                      "Sanctions", "Special-Education-Expenditures", 
                      "Staffing-Levels", "Suspension-Rates", 
                      "Time-with-Nondisabled-Peers")

all_raw_folders <- c("annual_expenditures", "attendance_district", 
                     "bullying_district", "cmt_district", 
                     "college_prep_district", "ed_demos", 
                     "ed_qualifications_district", "enrollment_district", 
                     "grad_rates_five_district", "grad_rates_four_district", 
                     "incidents_district", "per_pupil_expenditures", 
                     "primarydisability_district", "revenue_source", 
                     "sanctions_district", "special_ed_expenditures", 
                     "staffing_levels_district", "suspension_rates_district", 
                     "time_nondisabled")

for( i in 1:length(all_dp_locations)) {
  current_dp_path <- (paste0(getwd(), "/", all_dp_locations[i], "/", "raw"))
  current_raw_files <-dir(paste0(raw_dataset_paths[1], "/", all_raw_folders[i]), pattern = ".csv")
  copy_current <- lapply(current_raw_files, function(x) file.copy(paste (raw_from_github_path, all_raw_folders[i], x , sep = "/"),  
                                paste (current_dp_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))
}
