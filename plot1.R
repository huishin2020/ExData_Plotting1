
t <- read.csv("~/household_power_consumption.txt", header=FALSE, sep=";")

View(t)

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

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

## plot1
hist(t$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
