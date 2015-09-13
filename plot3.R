###
### plot3
###

# I read data file (there is a header, separator is ';', empty fields marked as '?', I do not want dates to become factors)
df1<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# I keep only the 2 dates to be considered
df2<-subset(df1,Date %in% c("1/2/2007","2/2/2007"))

# I create a new field of type POSIXt, to be used for x axes
df2$DateTime <- strptime(paste(df2$Date,df2$Time), format = "%d/%m/%Y %H:%M:%S")

# I set local language to English, so that x labels matches with what is requested
Sys.setlocale("LC_TIME", "English")

# Create plot3 on screen device, with Sub_metering_1 vs datetime, of type 'line', without xlabel, with ylabel as requested
plot(df2$DateTime, df2$Sub_metering_1, type='l', xlab='',ylab='Energy sub metering')

# add to plot3 on screen device, Sub_metering_2 vs datetime, of type 'line', with red color
points(df2$DateTime, df2$Sub_metering_2, type='l', col="red")

# add to plot3 on screen device, Sub_metering_3 vs datetime, of type 'line', with blue color
points(df2$DateTime, df2$Sub_metering_3, type='l', col="blue")

legend ("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1),col=c("black","red","blue"))


dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

