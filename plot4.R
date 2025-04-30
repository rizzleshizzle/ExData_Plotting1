# Set working directory 

# plot4.R

# Load and filter data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Combine Date and Time
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Create 2x2 layout and plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top left: Global Active Power
plot(subdata$DateTime, subdata$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Top right: Voltage
plot(subdata$DateTime, subdata$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom left: Sub metering
plot(subdata$DateTime, subdata$Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(subdata$DateTime, subdata$Sub_metering_2, col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right: Global Reactive Power
plot(subdata$DateTime, subdata$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power")
dev.off()