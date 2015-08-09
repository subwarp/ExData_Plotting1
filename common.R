# Coursera JHU Exploratory Data Analysis
# Course Assignment 1. Plot 2.

# Common functions

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
