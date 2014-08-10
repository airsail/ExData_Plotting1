## Exploratory Data Analysis
## Project 1  Plot4
## Uses data from UC Irvine Machine Learning Repository
## Data Set is  Electric power consumption
# Description: Measurements of electric power consumption in one household
## with a one-minute sampling rate over a period of almost 4 years.
## Different electrical quantities and some sub-metering values are available

rm(list=ls())
#
# Set directory where data file is located and check if correct
setwd("~/Coursera/DataScience/Exploratory_Data_Analysis")
getwd()
#
require(data.table)
dt = read.table("household_power_consumption.txt", header=T, sep=";", 
                stringsAsFactors=F, na.strings="?")        # read text file

dt$Date = as.character(strptime(paste(dt$Date), format = "%d/%m/%Y"))   # convert to Date format
dtsub = subset(dt, dt$Date == "2007-02-01" | dt$Date == "2007-02-02")   # Creat a subset for the date range

## Converting dates
datetime <- paste(as.Date(dtsub$Date), dtsub$Time)
dtsub$Datetime <- as.POSIXct(datetime)

## Plot 4
png("ExData_Plotting1/Plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dtsub, {
        plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
        plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="")
})

dev.off()
