## Make Plot 3

# load data
myData <- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = F)

# arrange data
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData <- myData[myData$Date == "2007-02-01" | myData$Date == "2007-02-02",]
myData$Time <- strptime(paste0(myData$Date, " ", myData$Time), format = "%Y-%m-%d %H:%M:%S")
myData$Sub_metering_1 <- as.numeric(myData$Sub_metering_1)
myData$Sub_metering_2 <- as.numeric(myData$Sub_metering_2)
myData$Sub_metering_3 <- as.numeric(myData$Sub_metering_3)

# for displaying the currect weekdays name, I must change the setting.
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

# save png
png(filename = "plot3.png")
line_colors <- c("black", "red", "blue")
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(myData$Time, myData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(myData$Time, myData$Sub_metering_1, type = "l", col=line_colors[1])
points(myData$Time, myData$Sub_metering_2, type = "l", col=line_colors[2])
points(myData$Time, myData$Sub_metering_3, type = "l", col=line_colors[3])
legend("topright", legend = leg.txt, col = line_colors, lty = 1)
dev.off()

# return back the setting
Sys.setlocale(category = "LC_ALL", locale = "Chinese (Traditional)_Taiwan.950")