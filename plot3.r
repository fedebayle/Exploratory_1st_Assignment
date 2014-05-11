setwd('C:\\Users\\fedebayle\\Desktop\\Coursera\\Exploratory')#working directory
tab5rows <- read.table('household_power_consumption.txt', sep=';',dec='.',header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)#set column classes
rawdata<-read.table('household_power_consumption.txt', sep=';',dec='.', header=TRUE,na.strings = "?", comment.char = "",colClasses=classes)#read dataset
rawdata$Date<-as.Date(rawdata$Date, format="%d/%m/%Y")#set date format
data<-subset(rawdata,rawdata$Date>='2007-02-01' & rawdata$Date<='2007-02-02')#only 20070201 and 20070202
data$Datetime<-strptime(paste(data$Date, data$Time, sep=" "),'%Y-%m-%d %H:%M:%S')#create datetime variable
#plot3
Sys.setlocale(locale = "C")
plot(data$Datetime,data$Sub_metering_1, type='l', col='black', xlab="", ylab="Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col='red')
lines(data$Datetime, data$Sub_metering_3, col='blue')
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file ="plot3.png", width=480, height=480)
dev.off()