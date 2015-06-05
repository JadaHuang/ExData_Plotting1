## Make Plot 1

# load data
myData <- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = F)

# arrange data
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData <- myData[myData$Date == "2007-02-01" | myData$Date == "2007-02-02",]
myData$Global_active_power <- as.numeric(myData$Global_active_power)

# save png
png(filename = "plot1.png")
hist(myData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()