## Exploratory Data Analysis
## Project 1  Plot2
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

## Plot 2
png("ExData_Plotting1/Plot2.png", width=480, height=480)
plot(dtsub$Global_active_power ~ dtsub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

