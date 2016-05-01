
#Load Lubridate library for date/Time manipulation
library(lubridate)

#read data file and subset by date
df = read.delim("household_power_consumption.txt",sep=";",header = TRUE, stringsAsFactors = FALSE, na.strings = "?" )
df = df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

#convert Time field to POSIXct date/time format
df$Time = as.POSIXct(paste(df$Date,df$Time), format= "%d/%m/%Y %H:%M:%S")

#Create .png file
png('plot4.png', width = 480, height = 480)

#set number of plots to generate on single page
par(mfrow=c(2,2))

#Generate each plot
plot(df$Time,df$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power")
plot(df$Time,df$Voltage, type = "l",xlab = "datetime",ylab = "Voltage")
plot(df$Time,df$Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub metering")
lines(df$Time,df$Sub_metering_2, col = "red")
lines(df$Time,df$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col = c("black","red","blue"))
plot(df$Time,df$Global_reactive_power, type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()

