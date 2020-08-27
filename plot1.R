##t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

t <- read.csv("~/household_power_consumption.txt", header=FALSE, sep=";")

##t <- read.csv("~/household_power_consumption.txt", header=FALSE, sep=";",na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

View(t)

## Format date to Type Date
##t$Date <- as.Date.default(t$Date, "%dd/%mm/%YYYY")
t$Date <- as.Date.default(t$Date)



## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
t <- t[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]

## Add DateTime column
t <- cbind(dateTime, t)

## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)