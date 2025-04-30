# Set working directory

# plot2.R

# Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, na.strings = "?")

# Convert Date and filter
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Combine Date and Time
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot and save PNG
png("plot2.png", width = 480, height = 480)
plot(subdata$DateTime, subdata$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
