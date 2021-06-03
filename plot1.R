#Downloaded the file in my repository
The repository : "C:/Users/Rachad/Desktop/Coursera/Data_Science/Exploratory"

#Unzip the file using R

setwd("C:/Users/Rachad/Desktop/Coursera/Data_Science/Exploratory")
"UCI Dataset" <- unzip("exdata_data_household_power_consumption.zip")

#Read the data from the file 

library("data.table")
ElectricPower <- data.table::fread("household_power_consumption.txt", na.strings = "?")

#Subset the Dates: 1/2/2007 and 2/2/2007

ElectricPowerDate <- subset(ElectricPower, Date %in% c("1/2/2007", "2/2/2007")) 
ElectricPowerDate$Date <- as.Date(ElectricPowerDate$Date, format = "%d/%m/%Y")

#Constrcut the plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(ElectricPowerDate[, Global_active_power], main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col ="red")
dev.off()