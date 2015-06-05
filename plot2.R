## Make Plot 2

# load data
myData <- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = F)

# arrange data
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData <- myData[myData$Date == "2007-02-01" | myData$Date == "2007-02-02",]
myData$Time <- strptime(paste0(myData$Date, " ", myData$Time), format = "%Y-%m-%d %H:%M:%S")
myData$Global_active_power <- as.numeric(myData$Global_active_power)

# for displaying the currect weekdays name, I must change the setting.
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

# save png
png(filename = "plot2.png")
plot(myData$Time, myData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

# return back the setting
Sys.setlocale(category = "LC_ALL", locale = "Chinese (Traditional)_Taiwan.950")