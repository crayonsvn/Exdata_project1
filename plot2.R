data5rows <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE,nrows=5)
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE,skip=66636,nrows=2880, na.strings="?")
names(data) <- names(data5rows)

dt <- paste(data$Date, data$Time)
datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
data2 <- cbind(data,datetime)

plot(data2$datetime,data2[,3],type="l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png")
dev.off()