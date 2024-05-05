#' ---
#' title: "Scrubjay"
#' author: "Betty Shen"
#' date: "2024-05-5"
#' output: html_document
#' ---
#' *Goal*
#' This exercise focuses on implementing Distance Sampling technique to estimate bird abundance and detection function from Oregon 2020 project. We will choose California Scrub-Jay, American Robin, and Song Sparrow as target species and focus in Corvallis, Oregon. 
#' 
#' **Set working directory & load data**
## ------------------------------------------------------------------------------------------------------------------------
rm(list = ls())
# Download packages
install.packages(c("readr","stringr","Distance","mrds"), repos = "http://cran.us.r-project.org")

setwd("/nfs/stak/users/shenf/hpc-share/DetectionFunctionExample") #set working directory. Yours should be different than mine
library(readr)
library(stringr)
library(Distance)
library(mrds)
library(parallel)
 
data <- read.csv(file = "/nfs/stak/users/shenf/hpc-share/DetectionFunctionExample/multiSP_Data.csv") # Read bird data


#' 
#' **Format bird data into Distance format**
## ------------------------------------------------------------------------------------------------------------------------
#== Create Region Label===#
region <- as.data.frame(matrix("corvallis", nrow = nrow(data), ncol = 1))
colnames(region)[1] <- "Region.Label"

#==Create Effort ====#
  #== Since observers only visit each point once, so the effort will be "1" for each record ==#
effort <- as.data.frame(matrix(seq(1), nrow = nrow(data), ncol = 1))
colnames(effort)[1] <- "Effort"

#==Create Area (m^2)==#
area <- as.data.frame(matrix(37787927, nrow = nrow(data), ncol = 1))
colnames(area)[1] <- "Area"

#==Combine the columns to match distance function format===#
corvallis.all <- cbind(region, area, data["Location_Name"], effort, data["Distance"], data["Common_Name"])
colnames(corvallis.all)[5] <- "distance"


#' 
#' 
#' **Run birds in detection function**
## ------------------------------------------------------------------------------------------------------------------------

#====Create a function to run different detection functions ===#
  #The order for input: distance_units; effort_units; area_units
conversion <- convert_units("Metre", NULL , "square metre")
# Create a list of bird species that we would want to perform Distance analyses 
species_list <- unique(corvallis.all$Common_Name)

# Calculate available cores we have
num_cores <- detectCores()
cl <- makeCluster(num_cores)
# Export the fit.hn.uni.haz function and other required libraries
clusterExport(cl, c("corvallis.all", "species_list", "conversion"))

# You might need to export additional libraries and data depending on their usage in fit.hn.uni.haz
# Define a function for parallel execution
fit_and_plot_species <- function(species_name) {
  # Load necessary libraries and data within the parallel worker
  library(parallel)
  library(mrds)
  library(Distance)
  library(knitr)
  
    # Run the function as before
    model <-  ds(corvallis.all[corvallis.all$Common_Name == species_name,], key = "hn", adjustment = NULL, convert_units = conversion)
    detection.pro <- model$ddf$fitted[[1]]
      #===Plot====#
    # Save the plot to a file
    png(filename = paste0("/nfs/stak/users/shenf/hpc-share/DetectionFunctionExample", species_name, ".png"), width = 1500, height = 1200, res = 300)
      plot(model,
           main = paste("Oregon Species: ", species_name))
      dev.off()  # Close the PNG device
      
      # Return the best.model or any other relevant results
      return(model)
  }
# Run the function in parallel for all species
results <- parLapply(cl, species_list, fit_and_plot_species)
# Make sure to stop the cluster at the end
stopCluster(cl)


