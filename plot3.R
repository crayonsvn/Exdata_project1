#READ IN DATA
data5rows <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE,nrows=5)
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE,skip=66636,nrows=2880, na.strings="?")
#NAME THE COLUMNS
names(data) <- names(data5rows)

#CONVERT DATE&TIME, create a column for it
dt <- paste(data$Date, data$Time)
datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
data2 <- cbind(data,datetime)

#CREATE A PNG
png(filename="plot3.png")

#PLOTTING
plot(data2$datetime,data2[,7],type="l", ylab = "Energy sub metering", xlab="")
lines(data2$datetime,data2[,8], col="red")
lines(data2$datetime,data2[,9],col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1.5,1.5,1.5),
       col=c("black","red","blue"))

dev.off()