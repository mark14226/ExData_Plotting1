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


# Generate Global Active Power over time plot (Plot 2)
png(file = "plot2.png", width = 480, height = 480)
plot(power$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n", type = "n")
lines(power$Global_active_power)
axis(1, at = c(0, length(grep("2007-02-01", power$Date)), length(c(grep("2007-02-01", power$Date), grep("2007-02-02", power$Date)))), labels = c("Thu", "Fri", "Sat"))
dev.off()
