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

##5th step : Create the Graphic Plot2.png

png(file="Plot2.png")
plot(SubData$datetime, 
     as.numeric(as.character(SubData$Global_active_power)), 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)" )

##6th step : Close the connection

dev.off()