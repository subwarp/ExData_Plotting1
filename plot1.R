# Course Assignment 1. Plot 1.
# Author: subwarp
#
setwd("~/src/jhu-data-science-course/external/ExData_Plotting1")

library(dplyr)
library(logging)
basicConfig(level = 'DEBUG')

# dates 2007-02-01 and 2007-02-02
#read.table()
data.file <- file.path("data", "household_power_consumption.txt")

pcdata <- read.table(textConnection(grep("2/1/2007|2/2/2007",
                                         readLines(data.file),
                                         value = TRUE),
                                    ), sep=";", na.strings = "?")

colnames(pcdata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                      "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                      "Sub_metering_3")

pcdata$Date2 <- lapply(pcdata$Date, as.Date, format = "")


FixDateString <- function(date.string) {
  #loginfo("FixDateString - Input: %s (%s)", date.string, class(date.string))
  if (is.factor(date.string)) {
    date.string <- as.character(date.string)
  }
  date.elements <- unlist(strsplit(date.string, "/"))
  month <- as.numeric(date.elements[2]);
  day <- as.numeric(date.elements[2]);  
  if (month < 10) {
    date.elements[1] = sprintf("0%s", month)
  }
  if (day < 10) {
    date.elements[2] = sprintf("0%s", day)
  }  
  sprintf("%s/%s/%s", date.elements[1], date.elements[2], date.elements[3])     
}


### mapply(function(d, t) {
###   d <- FixDateString(as.character(d))
###   date.time <- paste(d, t)
###   strptime(date.time, "%m/%d/%Y %H:%M:%S")[1][1]
### }, head(pcdata$Date, 2), head(pcdata$Time, 2), SIMPLIFY = FALSE))
### 
### 
### pcdata <- mutate(pcdata, Date2 = paste(FixDateString(Date), Time))
### 
### strptime(paste(FixDateString(Date), Time), "%m/%d/%Y %H:%M:%S"))
### pcdata <- select(pcdata, -Date2)


hist(pcdata$Global_active_power)
