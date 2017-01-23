## Reading Dataset in R

power = read.table('C:/Users/swastikaa/Documents/DataScience/Course4/household_power_consumption.txt', header=TRUE, sep = ";",stringsAsFactors=FALSE)

str(power)

## Combining Date and Time in one variable

power$DateTime <- paste(power$Date, power$Time) 

# TRansforming Date in date format
power$DateTime <- as.Date(power$DateTime, format = "%d/%m/%Y %H:%M:%S")

## Subsetting Dates based on requirements in project

library(dplyr)
subsetted <- subset(power, DateTime >= as.Date("2007-02-01 00:00:00") & DateTime < as.Date("2007-02-03 00:00:00"))

str(subsetted)

## Removing missing values

newdata <- na.omit(subsetted)

## Converting into numeric

newdata$Global_active_power = as.numeric(newdata$Global_active_power)
str(newdata)

library(datasets)

##Plot 1 - Global Active Power
png("plot1.png",width=480, height=480) ## Open PNG device; create 'plot1.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
plot1 = with(newdata, hist(Global_active_power, col = "red" ,xlab="Global Active POwer",main = "Global Active Power"))
## Annotate plot; still nothing on screen
dev.off() ## Close the PNG file device





