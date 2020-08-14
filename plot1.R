# Loading Data
library(data.table)
filename <- "household_power_consumption.txt"
data <- fread(filename) 

# Subseting 
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GAP <- as.numeric(subdata$Global_active_power)

# Ploting
png("plot1.png", width = 480, height = 480)
hist(GAP, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()