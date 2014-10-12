
## code in this file willperfoem these actions:
## reading dataset
## subsetting data
## dates conversion
## create plot
## save plot to file plot2.png


Create_Plot2<-function()
{
data_all <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")


data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)


datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

}