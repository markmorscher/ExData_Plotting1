# Read in data
data = read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Subset to two days of interest
plotData = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Combine date and time, convert to date/time format

plotData$DateTime = paste(plotData$Date, plotData$Time)
plotData$DateTime = strptime(plotData$DateTime,format = "%d/%m/%Y %H:%M:%S")

# Convert the pertinent fields to numeric

plotData$Global_active_power = as.numeric(as.character(plotData$Global_active_power))

# Plot the Histogram

png(filename = "plot1.png", width = 480, height = 480)
hist(plotData$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")
dev.off()
