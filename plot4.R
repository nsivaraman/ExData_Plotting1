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
## Select only 02/01/2007 and 02/02/2007 for the plot
hpc<-hpc[hpc$Date==as.Date("2007-02-01") | hpc$Date==as.Date("2007-02-02"),]
## Convert Time column to  date time
hpc$Time<-strptime(paste(as.character(hpc$Date),hpc$Time),"%Y-%m-%d %H:%M:%S")

## Convert power column to numeric
hpc$Global_active_power<-as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power<-as.numeric(hpc$Global_reactive_power)
hpc$Voltage<-as.numeric(hpc$Voltage)
hpc$Global_intensity<-as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1<-as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2<-as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3<-as.numeric(hpc$Sub_metering_3)

## open graphic device png
png("plot4.png")
## render line plot
par(mar=c(4,4,2,2))
## make 2 rows and 2 cols of plots
par(mfrow=c(2,2))
## first plot
plot(hpc$Time,hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
## second plot
plot(hpc$Time,hpc$Voltage,type="l",ylab="Voltage",xlab="datetime")
## third plot
plot(hpc$Time,hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(hpc$Time,hpc$Sub_metering_2,type="l",col="red")
lines(hpc$Time,hpc$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2,bty="n")
## fourth plot
plot(hpc$Time,hpc$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

## close graphic device
dev.off()
