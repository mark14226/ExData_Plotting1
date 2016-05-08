## Week 1 Assignment 1 - Plot1 ##
#setwd("Week 1")

# Load first 5 rows to check character classes
power.head <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
classes <- sapply(power.head, class)

# Load the full dataset 
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", comment.char = "", na.strings = "?", colClasses = classes)

# Convert Dates and Times to POSIXlt class
power$Date <- strptime(power$Date, "%d/%m/%Y")
power$Time <- strptime(power$Time, "%H:%M:%S")

# Subset data for only relevant dates
power <- power[c(grep("2007-02-01", power$Date), grep("2007-02-02", power$Date)),]


# Generate Sub-metering plot (Plot 3)
png(file = "plot3.png", width = 480, height = 480)
plot(power$Sub_metering_1, ylab = "Energy sub metering", xlab = "", xaxt = "n", ylim = c(0,38), type = "n")
lines(power$Sub_metering_1)
axis(1, at = c(0, length(grep("2007-02-01", power$Date)), length(c(grep("2007-02-01", power$Date), grep("2007-02-02", power$Date)))), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
par(new = TRUE)
plot(power$Sub_metering_2, ylab = "", xlab = "", xaxt = "n", yaxt = "n", ylim = c(0,38), type = "n")
lines(power$Sub_metering_2, col = "red")
par(new = TRUE)
plot(power$Sub_metering_3, ylab = "", xlab = "", xaxt = "n", yaxt = "n", ylim = c(0,38), type = "n")
lines(power$Sub_metering_3, col = "blue")
dev.off()
