
#Load Lubridate library for date/Time manipulation
library(lubridate)

#read data file and subset by date
df = read.delim("household_power_consumption.txt",sep=";",header = TRUE, stringsAsFactors = FALSE, na.strings = "?" )
df = df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

#generate plot and save as .png file
png('plot1.png', width = 480, height = 480)
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()

