##################################
##
## plot4.R
##
## 2014.10.10
##
##################################
temp<-tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,mode="wb")
unzip(temp, "household_power_consumption.txt")
## create image
png(file="plot4.png")
## data provisioning
household_power_consumption <- read.csv("~/Documents/IntroToR/ExploratoryData/household_power_consumption.txt", sep=";")
powerconsumption <- subset(household_power_consumption, strptime(household_power_consumption$Date,format="%d/%m/%Y") >= strptime("02/01/2007",format="%m/%d/%Y") & 
            strptime(household_power_consumption$Date,"%d/%m/%Y") < strptime("02/03/2007","%m/%d/%Y"))

## set global parameters
par(mfrow=c(2,2),mar=c(4,4,2,1),cex.lab=0.75)
## create 4 subplots
plot(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
     as.numeric(powerconsumption$Global_active_power)/1000, type = "l", 
     ylab="Global active power",xlab="")
plot(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
     as.numeric(powerconsumption$Voltage), type = "l", 
     ylab="Voltage",xlab="datetime")
plot(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
     as.numeric(powerconsumption$Sub_metering_1), ylab="Energy sub metering", xlab="",type="n")
lines(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
      as.numeric(powerconsumption$Sub_metering_1), col="black")
lines(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
      as.numeric(powerconsumption$Sub_metering_2), col="red")
lines(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
      as.numeric(powerconsumption$Sub_metering_3), col="blue")
legend("topright",35,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,cex=0.65)
plot(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
     as.numeric(powerconsumption$Global_reactive_power), type = "l", 
     ylab="Global reactive power",xlab="datetime")
## close device
dev.off()

