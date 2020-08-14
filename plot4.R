# Loading Data
library(data.table)
filename <- "household_power_consumption.txt"
data <- fread(filename)

# Subseting 
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subdata$Global_active_power)
GRP <- as.numeric(subdata$Global_reactive_power)
vol <- as.numeric(subdata$Voltage)
sm1 <- as.numeric(subdata$Sub_metering_1)
sm2 <- as.numeric(subdata$Sub_metering_2)
sm3 <- as.numeric(subdata$Sub_metering_3)

# Ploting
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", 
     cex=0.2)
plot(datetime, vol, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, GRP, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()
