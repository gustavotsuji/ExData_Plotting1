d = read.table("household_power_consumption.txt", sep=";",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrow=2879, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"));
d$Date <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S");

hist(d$Global_active_power, breaks=12, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)");
