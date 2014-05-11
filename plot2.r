setwd('C:\\Users\\fedebayle\\Desktop\\Coursera\\Exploratory')#working directory
tab5rows <- read.table('household_power_consumption.txt', sep=';',dec='.',header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)#set column classes
rawdata<-read.table('household_power_consumption.txt', sep=';',dec='.', header=TRUE,na.strings = "?", comment.char = "",colClasses=classes)#read dataset
rawdata$Date<-as.Date(rawdata$Date, format="%d/%m/%Y")#set date format
data<-subset(rawdata,rawdata$Date>='2007-02-01' & rawdata$Date<='2007-02-02')#only 20070201 and 20070202
data$Datetime<-strptime(paste(data$Date, data$Time, sep=" "),'%Y-%m-%d %H:%M:%S')#create datetime variable
#plot2
Sys.setlocale(locale = "C")
plot(data$Datetime,data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file ="plot2.png", width=480, height=480)
dev.off()