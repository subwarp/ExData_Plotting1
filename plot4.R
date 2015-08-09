# Coursera JHU Exploratory Data Analysis
# Course Assignment 1. Plot 1.

library(dplyr)

source("common.R")

# Running
# Note: Set your working directory accordingly.
# Step 1. Source this file. ie. source("plot4.R")
# Step 2. Load the data via function LoadData(<path.to.data.file>)
# Step 3. Generate graph via function DoPlot4(pcdata)
# Example:
#  > source("plot4.R")
#  > pcdata  <- LoadData(file.path("data", "household_power_consumption.txt"))
#  > DoPlot4(pcdata)

DoPlot4 <- function(pcdata) {
  png(file = "plot4.png")
  par(mfrow=c(2, 2), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))
  with(pcdata, {

    # Draw first graph
    plot(x=Date.Time, y=Global_active_power,
         main = "", xlab = "",
         ylab = "GLobal Active Power", type="l")

    # Draw second graph
    plot(x=pcdata$Date.Time, y=pcdata$Voltage,
         main = "", xlab = "datetime",
         ylab = "Voltage", type="l")

    # Draw third graph
    plot(x=pcdata$Date.Time, y=pcdata$Sub_metering_1,
         main = "", xlab = "",
         ylab = "Energy sub metering", type="l")

    lines(x=pcdata$Date.Time, y=pcdata$Sub_metering_2, col="red")
    lines(x=pcdata$Date.Time, y=pcdata$Sub_metering_3, col="blue")
    legend("topright", lwd=2, bty = "n", col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    # Draw forth graph
    plot(x=pcdata$Date.Time, y=pcdata$Global_reactive_power,
         main = "", xlab = "datetime",
         ylab = "GLobal_reactive_power", type="l")
  })

  dev.off()
}


