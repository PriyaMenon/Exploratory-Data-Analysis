household_power_consumption <- read.csv("C:/Users/sree/Desktop/Priya/COURSERA/R/exploratory data analysis/exdata-data-household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";")
household_power_consumption$Date = as.Date(household_power_consumption$V1, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
subSetData <- household_power_consumption[household_power_consumption$Date %in% c(startDate,endDate) ,]
str(subSetData)

datetime <- strptime(paste(subSetData$V1, subSetData$V2, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$V3)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()


