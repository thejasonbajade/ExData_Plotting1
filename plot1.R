powerConsumptionTable <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)

powerConsumptionTableSubset <- subset(powerConsumptionTable, Date == "1/2/2007" | Date == "2/2/2007")
powerConsumptionTableSubset$DateTime <- strptime(paste(powerConsumptionTableSubset$Date, powerConsumptionTableSubset$Time, " "), format="%d/%m/%Y %H:%M:%S")

png(file = "plot1.png", bg=NA)

# Global Active Power VS Frequency Histogram 
hist(as.numeric(powerConsumptionTableSubset$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()