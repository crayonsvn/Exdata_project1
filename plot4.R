#READ IN DATA
data5rows <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE,nrows=5)
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE,skip=66636,nrows=2880, na.strings="?")
#NAMES THE COLUMNS
names(data) <- names(data5rows)

#CONVERT DATE&TIME, create a column for it
dt <- paste(data$Date, data$Time)
datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
data2 <- cbind(data,datetime)

#CREATE A PNG
png(filename="plot4.png")

#PLOTTING
par(mfrow=c(2,2))
plot(data2$datetime,data2[,3],type="l", ylab = "Global Active Power", xlab="")
plot(data2$datetime,data2$Voltage,type="l", ylab = "Voltage", xlab="")
plot(data2$datetime,data2[,7],type="l", ylab = "Energy sub metering", xlab="",cex=0.75)
lines(data2$datetime,data2[,8], col="red")
lines(data2$datetime,data2[,9],col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1.5,1.5,1.5),
       col=c("black","red","blue"), bty="n")
plot(data2$datetime,data2[,4],type="l", ylab = "Global Reactive Power ", xlab="")

dev.off()