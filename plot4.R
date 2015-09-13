###
### plot4
###

# I read data file (there is a header, separator is ';', empty fields marked as '?', I do not want dates to become factors)
df1<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# I keep only the 2 dates to be considered
df2<-subset(df1,Date %in% c("1/2/2007","2/2/2007"))

# I create a new field of type POSIXt, to be used for x axes
df2$DateTime <- strptime(paste(df2$Date,df2$Time), format = "%d/%m/%Y %H:%M:%S")

# I set local language to English, so that x labels matches with what is requested
Sys.setlocale("LC_TIME", "English")

par(mfrow=c(2,2))

# Create plot "Glabal Active Power" 
plot(df2$DateTime, df2$Global_active_power, type='l',xlab='',ylab='Global Active Power')

# Create plot "Voltage" 
plot(df2$DateTime, df2$Voltage, type='l',xlab='Datetime',ylab='Voltage')

# Create plot "Sub_metering
plot(df2$DateTime, df2$Sub_metering_1, type='l', xlab='',ylab='Energy sub metering')
points(df2$DateTime, df2$Sub_metering_2, type='l', col="red")
points(df2$DateTime, df2$Sub_metering_3, type='l', col="blue")
legend ("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1),col=c("black","red","blue"),bty="n")

# Create plot "Global Reactive Power" 
plot(df2$DateTime, df2$Global_reactive_power, type='l',xlab='Datetime',ylab='Global_reactive_power')

par(mfrow=c(1,1))


dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

