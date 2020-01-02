
library(dplyr)
library(ggplot2)
house_power <-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = ("?"))
house_power$Date <- as.Date( house_power$Date,format="%d/%m/%Y")
house_power<-mutate(house_power, DateTime=as.POSIXct(paste(house_power$Date, house_power$Time), format="%Y-%m-%d %H:%M:%S"))
global_pw <- subset(house_power, select = c("DateTime","Global_active_power", "Global_reactive_power",  "Voltage", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
sub_data<-filter(global_pw , DateTime>= "2007-02-01 00:00:00" & DateTime<= "2007-02-02 23:59:59")

#Plot #2: 

# 1. Open png file
png("C:/ProyectosR/CURSO4/W1/plot2.png",  width = 480, height = 480, units = "px")

# 2. Create the plot 

#Plot #2:
plot(sub_data$DateTime, sub_data$Global_active_power,  
     type="l",  xlab="", ylab="Global Active Power (kilowatts)")

# 3. Close the file
dev.off()


