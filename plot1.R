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
                                           readLines(data.file)),
                                    ), sep=";")


x <- rnorm(100)
y <- x^2
plot(x,y)

library(datasets)

hist(airquality$Ozone, nain = "Foo Bar")

par(col = "tomato")
?colors()

colors()
