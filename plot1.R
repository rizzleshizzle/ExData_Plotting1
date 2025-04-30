# Set working directory

# plot1.R

# Read and filter data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, na.strings = "?")

# Convert date column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset to 2007-02-01 and 2007-02-02
subdata <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plot histogram
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
