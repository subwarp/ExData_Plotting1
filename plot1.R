# Coursera JHU Exploratory Data Analysis
# Course Assignment 1. Plot 1.

library(dplyr)

# Running 
# Note: Set your working directory accordingly.
# Step 1. Load the data via function LoadData(<path.to.data.file>)
#         ie. pcdata  <- LoadData(file.path("data", "household_power_consumption.txt"))
# Step 2. Generate graph via function DoPlot1(pcdata)


LoadData <- function(data.file) {
  # Loads household power consumption data for 0[1-2]/02/2007
  # Adds a column Date.Time which is Date Time object.
  if (!file.exists(data.file)) {
    stop(sprintf("Data file %s does not exist. Am out!", data.file))
  }
  pcdata <- read.table(textConnection(grep("^1/2/2007|^2/2/2007",
                                           readLines(data.file),
                                           value = TRUE)), sep=";",
                                      na.strings = "?")
  colnames(pcdata) <- c("Date", "Time", "Global_active_power",
                        "Global_reactive_power", "Voltage", "Global_intensity",
                        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

  mutate(pcdata,
         Date.Time = as.POSIXct(paste(Date, Time),
             format = "%d/%m/%Y %H:%M:%S"))
  
}

DoPlot1 <- function(pcdata) {
  png(file = "plot1.png")
  hist(pcdata$Global_active_power, col="red", main="Global Active Power",
       xlab = "GLobal Active Power (Kilowatts)")
  dev.off()
}
