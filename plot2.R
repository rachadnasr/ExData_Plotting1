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

#Constrcut the plot 2
png(file = "plot2.png", width = 480, height = 480)
with(ElectricPowerDate, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()