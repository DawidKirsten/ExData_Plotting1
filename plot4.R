plot4 <-
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
    #transforming date/time so as to display in plot4
    powerSub <- transform(powerSub, timeHOLD=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
    #formattuing data as numeric to use in graphs
    powerSub$Global_active_power <- as.numeric(as.character(powerSub$Global_active_power))
    powerSub$Global_reactive_power <- as.numeric(as.character(powerSub$Global_reactive_power))
    powerSub$Voltage <- as.numeric(as.character(powerSub$Voltage))
    powerSub$Sub_metering_1 <- as.numeric(as.character(powerSub$Sub_metering_1))
    powerSub$Sub_metering_2 <- as.numeric(as.character(powerSub$Sub_metering_2))
    powerSub$Sub_metering_3 <- as.numeric(as.character(powerSub$Sub_metering_3))
    #Create frame
    par(mfrow=c(2,2))
    # Generating Sub-Plot1 
    plot(powerSub$timeHOLD,powerSub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    # Generating Sub-Plot2   
    plot(powerSub$timeHOLD,powerSub$Voltage, type="l", xlab="datetime", ylab="Voltage")
    # Generating Sub-Plot3   
    plot(powerSub$timeHOLD,powerSub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(powerSub$timeHOLD,powerSub$Sub_metering_2,col="red")
    lines(powerSub$timeHOLD,powerSub$Sub_metering_3,col="blue")
    legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
    # Generating Sub-Plot4
    plot(powerSub$timeHOLD,powerSub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")	
    dev.copy(png, file="plot4.png", width=480, height=480)
}
