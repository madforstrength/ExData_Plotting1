#Reading data from file
#Data is too large and we only need  data from the dates 2007-02-01 and 2007-02-02
#So loading only 110000 rows from top 
householdData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 110000, stringsAsFactors=FALSE)
#Subsetting only required data
householdSubset <- householdData[as.Date(householdData$Date, format = "%d/%m/%Y") >= "2007-02-01" & as.Date(householdData$Date, format = "%d/%m/%Y") <= "2007-02-02",]
png("plot1.png")
hist(householdSubset$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()