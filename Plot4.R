##1st step : Read the table into the object "Data"

Cur_Dir <- getwd()
Data <- read.table(paste(Cur_Dir, "/household_power_consumption.txt", sep=""), header = TRUE, sep = ";")

##2nd step : Add the variable Date2 that is Date with a format applied

Data$Date2 <- as.Date(Data$Date, "%d/%m/%Y")

##3rd step : Create a subset of "Data", taking only the 1st and 2nd of February 2007

dstart <- as.Date("01/02/2007", "%d/%m/%Y")
dend <- as.Date("02/02/2007", "%d/%m/%Y")
SubData <- Data[Data$Date2 %in% dstart:dend, ]

##4th step : Create the variable datetime, that is a paste of Date and Time with a format applied

SubData$datetime <- strptime(paste(SubData$Date, SubData$Time), "%d/%m/%Y %H:%M:%S")

##5th step : Create the Graphic Plot4.png

png(file="Plot4.png")
par(mfrow = c(2, 2))
with(SubData, {
        plot(datetime, 
             as.numeric(as.character(Global_active_power)), 
             type = "l", 
             xlab = "", 
             ylab = "Global Active Power" )
        plot(datetime, 
             as.numeric(as.character(Voltage)), 
             type = "l", 
             xlab = "datetime", 
             ylab = "Voltage" )
        plot(SubData$datetime, 
             as.numeric(as.character(SubData$Sub_metering_1)), 
             type = "l", 
             col = "black", 
             xlab = "", 
             ylab = "Energy sub metering" )
        lines(SubData$datetime, 
              as.numeric(as.character(SubData$Sub_metering_2)), 
              type = "l", 
              col = "red")
        lines(SubData$datetime, 
              as.numeric(as.character(SubData$Sub_metering_3)), 
              type = "l", 
              col = "blue")
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=1, 
               bty = "n",
               cex = 0.9,
               col=c("black","red","blue")) 
        plot(datetime, 
             as.numeric(as.character(Global_reactive_power)), 
             type = "l", 
             xlab = "datetime", 
             ylab = "Global_reactive_power" )
})

##6th step : Close the connection

dev.off()