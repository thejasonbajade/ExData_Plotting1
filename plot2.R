powerConsumptionTable <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)

powerConsumptionTableSubset <- subset(powerConsumptionTable, Date == "1/2/2007" | Date == "2/2/2007")
powerConsumptionTableSubset$DateTime <- strptime(paste(powerConsumptionTableSubset$Date, powerConsumptionTableSubset$Time, " "), format="%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", bg=NA)

# Days VS Global Active Power Graph 
with(powerConsumptionTableSubset, plot(DateTime, as.numeric(Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()