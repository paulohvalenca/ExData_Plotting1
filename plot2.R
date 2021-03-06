library(data.table)
filename <- "household_power_consumption.txt"
data <- fread(filename)
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()