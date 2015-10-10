## plot1.R
## Exploratory Data Analysis Project 1
## This script renders plot1 to a png file

## Make sure to change folder to the data folder
## Change to data folder
## Ex. setwd("c:/class/r/proj1")

## read data file
hpc<-read.csv2("household_power_consumption.txt",stringsAsFactors=F)

## Convert Date column to type Date
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
## Convert Time column to  date time
hpc$Time<-strptime(paste(as.character(hpc$Date),hpc$Time),"%Y-%m-%d %H:%M:%S")
## Select only 02/01/2007 and 02/02/2007 for the plot
hpc<-hpc[hpc$Date==as.Date("2007-02-01") | hpc$Date==as.Date("2007-02-02"),]

## Convert power column to numeric
hpc$Global_active_power<-as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power<-as.numeric(hpc$Global_reactive_power)
hpc$Voltage<-as.numeric(hpc$Voltage)
hpc$Global_intensity<-as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1<-as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2<-as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3<-as.numeric(hpc$Sub_metering_3)

## open graphic device png
png("plot1.png")
## render histogram
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
axis(side =1, at = seq (0,6,2), labels =seq (0,6,2))
## close graphic device
dev.off()
