##################################################################
#
# Processing Script for all "Chronic Absenteeism" EdSight data
# Created by Jenna Daly
# On 03/14/2017
#
##################################################################

#Takes files from top level "raw" folder, and moves them into already created DP "raw" folders 
#based on category. Categories are hard-coded, variables have been defined from upload_raw.R script. 

# lapply(filestocopy, function(x) file.copy(paste (origindir, x , sep = "/"),  
#        paste (targetdir,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))

#define categories based on filenames
extract <- gsub('.csv', '', sub('.*\\_', '', chronic_absent_files))
categories <- unique(extract)

chronic_absent_data_path <- (paste0(getwd(), "/", chronic_absent_dp_location))

chronic_absent_AS_files <- grep("All-Students", chronic_absent_files, value=T)
chronic_absent_ELL_files <- grep("English-Learner-Status", chronic_absent_files, value=T)   
chronic_absent_gender_files <- grep("Gender", chronic_absent_files, value=T) 
chronic_absent_grade_files <- grep("Grade", chronic_absent_files, value=T) 
chronic_absent_ME_files <- grep("Free-Reduced-Price-Meal-Eligibility", chronic_absent_files, value=T) 
chronic_absent_RE_files <- grep("Race-Ethnicity", chronic_absent_files, value=T)       
chronic_absent_SES_files<- grep("Special-Education-Status", chronic_absent_files, value=T)  

chronic_absent_AS_data_path <- (paste0(chronic_absent_data_path, "/", "Chronic-Absenteeism-by-All-Students", "/", "raw"))
chronic_absent_ELL_data_path <- (paste0(chronic_absent_data_path, "/", "Chronic-Absenteeism-by-ELL", "/", "raw"))
chronic_absent_gender_data_path <- (paste0(chronic_absent_data_path, "/", "Chronic-Absenteeism-by-Gender", "/", "raw"))
chronic_absent_grade_data_path <- (paste0(chronic_absent_data_path, "/", "Chronic-Absenteeism-by-Grade", "/", "raw"))
chronic_absent_ME_data_path <- (paste0(chronic_absent_data_path, "/", "Chronic-Absenteeism-by-Meal-Eligibility", "/", "raw"))
chronic_absent_RE_data_path <- (paste0(chronic_absent_data_path, "/", "Chronic-Absenteeism-by-Race-Ethnicity", "/", "raw"))
chronic_absent_SES_data_path <- (paste0(chronic_absent_data_path, "/", "Chronic-Absenteeism-by-Special-Education-Status", "/", "raw"))

copy_chronic_absent_AS <- lapply(chronic_absent_AS_files, function(x) file.copy(paste (chronic_absent_dp_path, x , sep = "/"),  
                                 paste (chronic_absent_AS_data_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))

copy_chronic_absent_ELL <- lapply(chronic_absent_ELL_files, function(x) file.copy(paste (chronic_absent_dp_path, x , sep = "/"),  
                                  paste (chronic_absent_ELL_data_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))

copy_chronic_absent_gender <- lapply(chronic_absent_gender_files, function(x) file.copy(paste (chronic_absent_dp_path, x , sep = "/"),  
                                     paste (chronic_absent_gender_data_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))

copy_chronic_absent_grade <- lapply(chronic_absent_grade_files, function(x) file.copy(paste (chronic_absent_dp_path, x , sep = "/"),  
                                    paste (chronic_absent_grade_data_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))

copy_chronic_absent_ME <- lapply(chronic_absent_ME_files, function(x) file.copy(paste (chronic_absent_dp_path, x , sep = "/"),  
                                 paste (chronic_absent_ME_data_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))

copy_chronic_absent_RE <- lapply(chronic_absent_RE_files, function(x) file.copy(paste (chronic_absent_dp_path, x , sep = "/"),  
                                 paste (chronic_absent_RE_data_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))

copy_chronic_absent_SES <- lapply(chronic_absent_SES_files, function(x) file.copy(paste (chronic_absent_dp_path, x , sep = "/"),  
                                  paste (chronic_absent_SES_data_path,x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))
