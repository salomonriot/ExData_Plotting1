Code for reading and cleaning data
ds <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
ds$Date <- strptime(paste(ds$Date,ds$Time), "%d/%m/%Y %H:%M:%S")
subds <- subset(ds, Date >= "2007-02-01" & Date < "2007-02-03")
subds$Global_active_power <- as.numeric(subds$Global_active_power)
subds$Global_reactive_power <- as.numeric(subds$Global_reactive_power)
subds$Voltage <- as.numeric(subds$Voltage)
subds$Sub_metering_1 <- as.numeric(subds$Sub_metering_1)
subds$Sub_metering_2 <- as.numeric(subds$Sub_metering_2)
subds$Sub_metering_3 <- as.numeric(subds$Sub_metering_3)
Sys.setlocale("LC_TIME", "C") 

#code for making plot 3
png(filename = 'plot3.png', bg = "transparent", width = 480, height = 480, units = 'px')
plot(subds$Date,subds$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(subds$Date, subds$Sub_metering_2, type = "l", col = "red")
lines(subds$Date, subds$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = .75)
dev.off()