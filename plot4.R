#Downloaded the file in my repository
The repository : "C:/Users/Rachad/Desktop/Coursera/Data_Science/Exploratory"

#Unzip the file using R

setwd("C:/Users/Rachad/Desktop/Coursera/Data_Science/Exploratory")
"UCI Dataset" <- unzip("exdata_data_household_power_consumption.zip")

#Read the data from the file 

library("data.table")
ElectricPower <- data.table::fread("household_power_consumption.txt", na.strings = "?")

#Subset the Dates: 2007-02-01 and 2007-02-02

ElectricPowerDate <- subset(ElectricPower, Date %in% c("1/2/2007", "2/2/2007"))
ElectricPowerDate$Date <- as.Date(ElectricPowerDate$Date, format = "%d/%m/%Y")
ElectricPowerDate$DateTime <- as.POSIXct(paste(as.Date(ElectricPowerDate$Date), ElectricPowerDate$Time))

#Set the local to be in english instead of french
Sys.setlocale(category = "LC_ALL", locale = "C")

#Constrcut the plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
with(ElectricPowerDate, {
plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "daytime", col = "black")
plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(DateTime, Sub_metering_2, col= "red")
lines(DateTime, Sub_metering_3, col= "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(DateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "daytime", col = "black")})
