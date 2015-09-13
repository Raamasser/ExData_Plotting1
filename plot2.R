###
### plot2
###

# I read data file (there is a header, separator is ';', empty fields marked as '?', I do not want dates to become factors)
df1<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

# I keep only the 2 dates to be considered
df2<-subset(df1,Date %in% c("1/2/2007","2/2/2007"))

# I create a new field of type POSIXt, to be used for x axes
df2$DateTime <- strptime(paste(df2$Date,df2$Time), format = "%d/%m/%Y %H:%M:%S")

# I set local language to English, so that x labels matches with what is requested
Sys.setlocale("LC_TIME", "English")

# Create plot2 on screen device, of type 'line', without xlabel, with changed ylabel as requested
plot(df2$DateTime, df2$Global_active_power, type='l',xlab='',ylab='Global Active Power (kilowatts)')

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

