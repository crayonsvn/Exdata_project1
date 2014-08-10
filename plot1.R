#READ IN DATA
data5rows <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE,nrows=5)
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE,skip=66636,nrows=2880, na.strings="?")

#NAME THE COLUMNS
names(data) <- names(data5rows)

#CONVERT DATES
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#PLOT HISTOGRAM
hist(data[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#COPY TO PNG
dev.copy(png, file="plot1.png")
dev.off()