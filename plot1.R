plot1 <-
function () {
    #Assuming you have the txt unzipped in your working directory
    powerData <- read.table("household_power_consumption.txt", header=T, sep=";")
    #You may find it useful to convert the Date and Time variables to
    #Date/Time classes in R using the `strptime()` and `as.Date()`functions.
    powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
    # We will only be using data from the dates 2007-02-01 and
    #2007-02-02. One alternative is to read the data from just those dates
    #rather than reading in the entire dataset and subsetting to those dates.
    powerSub <- powerData[(powerData$Date=="2007-02-01") | (powerData$Date=="2007-02-02"),]
    #formattuing data as numeric to use in graphs
    powerSub$Global_active_power <- as.numeric(as.character(powerSub$Global_active_power))
    powerSub$Global_reactive_power <- as.numeric(as.character(powerSub$Global_reactive_power))
    powerSub$Voltage <- as.numeric(as.character(powerSub$Voltage))
    powerSub$Sub_metering_1 <- as.numeric(as.character(powerSub$Sub_metering_1))
    powerSub$Sub_metering_2 <- as.numeric(as.character(powerSub$Sub_metering_2))
    powerSub$Sub_metering_3 <- as.numeric(as.character(powerSub$Sub_metering_3))
    # Generating plot1 and out putting it to a .png file width of 480 pixels and a height of 480 pixels.
    hist(powerSub$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", 
         col = "red", breaks = 13, ylim = c(0,1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
    dev.copy(png, file="plot1.png", width=480, height=480)
    dev.off()
}
