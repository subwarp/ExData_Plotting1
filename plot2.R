# Coursera JHU Exploratory Data Analysis
# Course Assignment 1. Plot 2.

library(dplyr)

source("common.R")

# Running 
# Note: Set your working directory accordingly.
# Step 1. Source this file. ie. source("plot2.R")
# Step 2. Load the data via function LoadData(<path.to.data.file>)
# Step 3. Generate graph via function DoPlot2(pcdata)
# Example:
#  > source("plot2.R")
#  > pcdata  <- LoadData(file.path("data", "household_power_consumption.txt"))
#  > DoPlot2(pcdata)

DoPlot2 <- function(pcdata) {
  png(file="plot2.png")
  plot(x=pcdata$Date.Time, y=pcdata$Global_active_power, 
       main = "", xlab = "",
       ylab = "GLobal Active Power (Kilowatts)", type="l")
  dev.off()
}
