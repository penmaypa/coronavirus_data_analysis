
#---------------------------------------
#  Analysis - Part 1
#   -------------
# Extracting raw dataset from CSSEGIS and Data's repo
#
#------------------------------


source("https://github.com/penmaypa/penuel-library/raw/master/R/our_functions.r")

start_n <- 22
end_n <- 31

n1 <- start_n
n2 <- 0
master_df = ""
dfnames_are_equal <- TRUE
while(n1 <= end_n){
  data_source <- paste("https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_daily_reports/01-",n1, "-2020.csv", sep="")
  df <- read.csv(data_source, sep=",")
  df <- data.frame(Date =c(paste("2020-01-",as.character(n1), sep="")), df)
  df_names <- names(df)
  
  if(n2 >= 1){
      n3 <- 1
      for(name_x in df_names){
        if(df_names_prev[n3] == name_x){
          dfnames_are_equal <- TRUE
        }else{
          dfnames_are_equal <- FALSE
          if(dfnames_are_equal == FALSE)break
        }
        n3 <- n3 + 1
      }
      
      
      
      master_df <- rbind(master_df, df)
    
  }else{
    df_names <- names(df)
    df_names_prev <- df_names
    master_df <- df
  }
  
  if(dfnames_are_equal == FALSE){
    message(
            cat("\n--------------------------------\n"),
            cat("\n ATTETION !"),
            cat("\n\n Names of the current dataset is not equal to the previous"),
            cat("\nFunction has been stopped at loop ",n2, "!!!")
          )
    break
  }
  
  message(cat("n1: ", n1))
  
  n1 <- n1 + 1
  n2 <- n2 + 1
}


