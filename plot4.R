#Reading data from file
#Data is too large and we only need  data from the dates 2007-02-01 and 2007-02-02
#So loading only 110000 rows from top 
householdData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 110000, stringsAsFactors=FALSE)
#Subsetting only required data
householdSubset <- householdData[as.Date(householdData$Date, format = "%d/%m/%Y") >= "2007-02-01" & as.Date(householdData$Date, format = "%d/%m/%Y") <= "2007-02-02",]
#Adding DateTime coloumn
householdSubset$DateTime <- as.POSIXct(paste(as.Date(householdSubset$Date, format = "%d/%m/%Y"), householdSubset$Time))
#png("plot2.png")
#Reading data from file
#Data is too large and we only need  data from the dates 2007-02-01 and 2007-02-02
#So loading only 110000 rows from top 
householdData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 110000, stringsAsFactors=FALSE)
#Subsetting only required data
householdSubset <- householdData[as.Date(householdData$Date, format = "%d/%m/%Y") >= "2007-02-01" & as.Date(householdData$Date, format = "%d/%m/%Y") <= "2007-02-02",]
#Adding DateTime coloumn
householdSubset$DateTime <- as.POSIXct(paste(as.Date(householdSubset$Date, format = "%d/%m/%Y"), householdSubset$Time))
png("plot4.png")
par(mfcol=c(2,2))
#Plotting first graph
plot(householdSubset$Global_active_power~householdSubset$DateTime,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
#Plotting second graph
plot(householdSubset$DateTime,householdSubset$Sub_metering_1,type="l",ylab = "Energy sub metering", xlab = "")
lines(householdSubset$DateTime,householdSubset$Sub_metering_2,type="l",col="red")
lines(householdSubset$DateTime,householdSubset$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
#plotting third graph
plot(householdSubset$DateTime,householdSubset$Voltage,type="l",ylab = "Voltage", xlab = "datetime")
#plotting forth graph
plot(householdSubset$DateTime,householdSubset$Global_reactive_power,type="l",ylab = "Global_reactive_power", xlab = "datetime")
dev.off()