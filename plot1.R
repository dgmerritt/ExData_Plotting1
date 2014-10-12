##################################
##
## plot1.R
##
## 2014.10.10
##
##################################
## create image
png(file="plot1.png")
## data provisioning
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
powerconsumption <- subset(household_power_consumption, strptime(household_power_consumption$Date,format="%d/%m/%Y") >= strptime("02/01/2007",format="%m/%d/%Y") & 
            strptime(household_power_consumption$Date,"%d/%m/%Y") < strptime("02/03/2007","%m/%d/%Y"))
## create histogram
hist(as.numeric(powerconsumption$Global_active_power)/1000,
     col="red",main="Global Active Power",ylab = "frequency", xlab="Global Active Power (kilowatts)")
## close device
dev.off()