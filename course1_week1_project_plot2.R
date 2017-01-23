## Reading Dataset in R

power <- read.table('C:/Users/swastikaa/Documents/DataScience/Course4/household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
power <- subset(power,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
power <- power[complete.cases(power),]

## Combining Date and Time in one variable
dateTime <- paste(power$Date, power$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
power <- power[ ,!(names(power) %in% c("Date","Time"))]

## Add DateTime column
power <- cbind(dateTime, power)

## Format dateTime Column
power$dateTime <- as.POSIXct(dateTime)



##Plot 2 - Global Active Power by weekdays
png("plot2.png",width=480, height=480) ## Open PNG device; create 'plot1.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
plot(power$Global_active_power~power$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
## Annotate plot; still nothing on screen
dev.off() ## Close the PNG file device




