##1st step : Read the table into the object "Data"

Cur_Dir <- getwd()
Data <- read.table(paste(Cur_Dir, "/household_power_consumption.txt", sep=""), header = TRUE, sep = ";")

##2nd step : Add the variable Date2 that is Date with a format applied

Data$Date2 <- as.Date(Data$Date, "%d/%m/%Y")

##3rd step : Create a subset of "Data", taking only the 1st and 2nd of February 2007

dstart <- as.Date("01/02/2007", "%d/%m/%Y")
dend <- as.Date("02/02/2007", "%d/%m/%Y")
SubData <- Data[Data$Date2 %in% dstart:dend, ]

##4th step : Create the Graphic Plot1.png

png(file="Plot1.png")

hist(as.numeric(as.character(SubData$Global_active_power)), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

##5th step : Close the connection

dev.off()
