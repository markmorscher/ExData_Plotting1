# Read in data
data = read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Subset to two days of interest
plotData = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Combine date and time, convert to date/time format

plotData$DateTime = paste(plotData$Date, plotData$Time)
plotData$DateTime = strptime(plotData$DateTime,format = "%d/%m/%Y %H:%M:%S")

# Convert the pertinent fields to numeric

plotData$Sub_metering_1 = as.numeric(as.character(plotData$Sub_metering_1))
plotData$Sub_metering_2 = as.numeric(as.character(plotData$Sub_metering_2))
plotData$Sub_metering_3 = as.numeric(as.character(plotData$Sub_metering_3))

# Plot the Graph

png(filename = "plot3.png", width = 480, height = 480)
with(plotData, plot(DateTime,Sub_metering_1, pch=NA, xlab=NA, ylab = "Energy sub metering"))
with(plotData, lines(DateTime,Sub_metering_1, col="black"))
with(plotData, lines(DateTime,Sub_metering_2, col="red"))
with(plotData, lines(DateTime,Sub_metering_3, col="blue"))
legend("topright", lty="solid", lwd=1, col = c("black", "red", "blue"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
