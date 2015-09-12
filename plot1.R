###
### plot1.R
###

# read dataset
df1<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#keep only the right dates
df2<-subset(df1,Date %in% c("1/2/2007","2/2/2007"))

# Create plot1 on screen device, with correct xlabel and main title
hist(df2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Copy plot to a PNG file
dev.copy(png, file = "plot1.png") 

# Don't forget to close the PNG device!
dev.off() 
