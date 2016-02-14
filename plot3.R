household_power_consumption <- read.csv("C:/Users/sree/Desktop/Priya/COURSERA/R/exploratory data analysis/exdata-data-household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";")
household_power_consumption$Date = as.Date(household_power_consumption$V1, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
subSetData <- household_power_consumption[household_power_consumption$Date %in% c(startDate,endDate) ,]
str(subSetData)

datetime <- strptime(paste(subSetData$V1, subSetData$V2, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$V3)
subMetering1 <- as.numeric(subSetData$V7)
subMetering2 <- as.numeric(subSetData$V8)
subMetering3 <- as.numeric(subSetData$V9)



png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


dev.off()


