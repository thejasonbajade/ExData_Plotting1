powerConsumptionTable <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)

powerConsumptionTableSubset <- subset(powerConsumptionTable, Date == "1/2/2007" | Date == "2/2/2007")
powerConsumptionTableSubset$DateTime <- strptime(paste(powerConsumptionTableSubset$Date, powerConsumptionTableSubset$Time, " "), format="%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", bg=NA)

par(mfrow=c(2, 2))

# Global Active Power VS Frequency Histogram 
with(powerConsumptionTableSubset,  plot(DateTime, as.numeric(Global_active_power), type="l", xlab="", ylab="Global Active Power"))

# Days VS Voltage Graph
with(powerConsumptionTableSubset,  plot(DateTime, as.numeric(Voltage), type="l", xlab="", ylab="Voltage"))

# Days VS Submetering Graph 
with(powerConsumptionTableSubset,  plot(DateTime, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"))
with(powerConsumptionTableSubset,  lines(DateTime, as.numeric(Sub_metering_2), type="l", col="red"))
with(powerConsumptionTableSubset,  lines(DateTime, as.numeric(Sub_metering_3), type="l", col="blue"))
legend("topright", lty=1, box.lty=0, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Days VS Global Reactive Power Graph 
with(powerConsumptionTableSubset,  plot(DateTime, as.numeric(Global_reactive_power), type="l", xlab="", ylab="Global Reactive Power"))

dev.off()