# Coursera JHU Exploratory Data Analysis
# Course Assignment 1. Plot 3.

library(dplyr)

source("common.R") #  Code for loading data is factored out to common.R

# Running
# Note: Set your working directory accordingly.
# Step 1. Source this file. ie. source("plot3.R")
# Step 2. Load the data via function LoadData(<path.to.data.file>)
# Step 3. Generate graph via function DoPlot3(pcdata)
# Example:
#  > source("plot3.R")
#  > pcdata  <- LoadData(file.path("data", "household_power_consumption.txt"))
#  > DoPlot3(pcdata)


DoPlot3 <- function(pcdata) {
  png(file="plot3.png")
  plot(x=pcdata$Date.Time, y=pcdata$Sub_metering_1,
       main = "", xlab = "",
       ylab = "Energy sub metering", type="l")

  lines(x=pcdata$Date.Time, y=pcdata$Sub_metering_2, col="red")
  lines(x=pcdata$Date.Time, y=pcdata$Sub_metering_3, col="blue")
  legend("topright", lwd=2, col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}

