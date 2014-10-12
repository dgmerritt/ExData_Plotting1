##################################
##
## plot2.R
##
## 2014.10.10
##
##################################
## create image
png(file="plot2.png")
## data provisioning
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
powerconsumption <- subset(household_power_consumption, strptime(household_power_consumption$Date,format="%d/%m/%Y") >= strptime("02/01/2007",format="%m/%d/%Y") & 
            strptime(household_power_consumption$Date,"%d/%m/%Y") < strptime("02/03/2007","%m/%d/%Y"))
## create line plot
plot(strptime(paste0(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y%H:%M:%S"), 
     as.numeric(powerconsumption$Global_active_power)/1000, type = "l", 
     ylab="Global active power (kilowatts)",xlab="")
## close device
dev.off()