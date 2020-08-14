library(data.table)
filename <- "D. Science coursera 4 week swirl leasons.txt"
data <- fread(filename)
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

GAP <- as.numeric(subdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()