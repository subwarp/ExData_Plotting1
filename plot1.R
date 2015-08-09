# Coursera JHU Exploratory Data Analysis
# Course Assignment 1. Plot 1.

library(dplyr)

source("common.R") #  Code for loading data is factored out to common.R

# Running
# Note: Set your working directory accordingly.
# Step 1. Source this file. ie. source("plot1.R")
# Step 2. Load the data via function LoadData(<path.to.data.file>)
# Step 3. Generate graph via function DoPlot1(pcdata)
# Example:
#  > source("plot1.R")
#  > pcdata  <- LoadData(file.path("data", "household_power_consumption.txt"))
#  > DoPlot1(pcdata)

DoPlot1 <- function(pcdata) {
  png(file = "plot1.png")
  hist(pcdata$Global_active_power, col="red", main="Global Active Power",
       xlab = "GLobal Active Power (Kilowatts)")
  dev.off()
}
