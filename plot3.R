##################################
##
## plot3.R
##
## 2014.10.10
##
##################################
## create image
png(file="plot3.png")
## data provisioning
household_power_consumption <- read.csv("~/Documents/IntroToR/ExploratoryData/household_power_consumption.txt", sep=";")
powerconsumption <- subset(household_power_consumption, strptime(household_power_consumption$Date,format="%d/%m/%Y") >= strptime("02/01/2007",format="%m/%d/%Y") & 
            strptime(household_power_consumption$Date,"%d/%m/%Y") < strptime("02/03/2007","%m/%d/%Y"))
## create empty plot
plot(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
     as.numeric(powerconsumption$Sub_metering_1), ylab="Energy sub metering", xlab="",type="n")
## add line data
lines(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
      as.numeric(powerconsumption$Sub_metering_1), col="black")
lines(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
      as.numeric(powerconsumption$Sub_metering_2), col="red")
lines(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
      as.numeric(powerconsumption$Sub_metering_3), col="blue")
## add legend
legend("topright",35,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,cex=0.65)
## close device
dev.off()
