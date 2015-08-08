# Coursera JHU Exploratory Data Analysis
# Course Assignment 1. Plot 1.

library(dplyr)
library(logging)
basicConfig(level = 'DEBUG')

# CONFIG #
# Note: Set your working directory accordingly.
# Step 1. Set path to the household_power_consumption.txt

DoPlot1 <- function(pcdata.file) {

  if (!file.exists(pcdata.file)) {
    stop(sprintf("Data file %s does not exist. Am out!", pcdata.file))
  }

  logdebug("Loading data file: %s", pcdata.file)
  pcdata <- read.table(textConnection(grep("^2/1/2007|^2/2/2007",
                                           readLines(pcdata.file),
                                           value = TRUE)), sep=";",
                                      na.strings = "?")

  colnames(pcdata) <- c("Date", "Time", "Global_active_power",
                        "Global_reactive_power", "Voltage", "Global_intensity",
                        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


  png(file = "plot1.png")
  hist(pcdata$Global_active_power, col="red", main="Global Active Power",
       xlab = "GLobal Active Power (Kilowatts)")
  dev.off()
}

Test <- function() {
  # Runs DoPlot1.
  # Data is in a subdirectory in file: household_power_consumption.txt
  data.file <- file.path("data", "household_power_consumption.txt")
  DoPlot1(data.file)
}
