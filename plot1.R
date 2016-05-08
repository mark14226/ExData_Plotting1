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


# Generate 'Global Active Power' plot (Plot 1)
png(file = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
