
#Load Lubridate library for date/Time manipulation
library(lubridate)

#read data file and subset by date
df = read.delim("household_power_consumption.txt",sep=";",header = TRUE, stringsAsFactors = FALSE, na.strings = "?" )
df = df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

#convert Time field to POSIXct date/time format
df$Time = as.POSIXct(paste(df$Date,df$Time), format= "%d/%m/%Y %H:%M:%S")

#generate plot and save as .png file
png('plot2.png', width = 480, height = 480)
plot(df$Time,df$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()

