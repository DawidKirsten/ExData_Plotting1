plot3 <-
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
    #transforming date/time so as to display in plot3
    powerSub <- transform(powerSub, timeHOLD=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
    #formattuing data as numeric to use in graphs
    powerSub$Global_active_power <- as.numeric(as.character(powerSub$Global_active_power))
    powerSub$Global_reactive_power <- as.numeric(as.character(powerSub$Global_reactive_power))
    powerSub$Voltage <- as.numeric(as.character(powerSub$Voltage))
    powerSub$Sub_metering_1 <- as.numeric(as.character(powerSub$Sub_metering_1))
    powerSub$Sub_metering_2 <- as.numeric(as.character(powerSub$Sub_metering_2))
    powerSub$Sub_metering_3 <- as.numeric(as.character(powerSub$Sub_metering_3))
    # Generating plot3 and out putting it to a .png file width of 480 pixels and a height of 480 pixels.
    plot(powerSub$timeHOLD,powerSub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(powerSub$timeHOLD,powerSub$Sub_metering_2,col="red")
    lines(powerSub$timeHOLD,powerSub$Sub_metering_3,col="blue")
    legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
    dev.copy(png, file="plot3.png", width=480, height=480)
}
