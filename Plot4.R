d = read.table("household_power_consumption.txt", sep=";",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrow=2879, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"));
d$Date <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S");

par(mfrow = c(2,2));
plot(d$Date, d$Global_active_power, col="black", type="l",ylab="Global Active Power (kilowatts)", xlab="");
plot(d$Date, d$Voltage, col="black", type="l",ylab="Voltage", xlab="");

l <- c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3");
lcolors <- c("black", "red", "blue");
plot(d$Date, d$Sub_metering_1,type="n",ylab="Energy sub metering", xlab="");
lines(d$Date, d$Sub_metering_1, col="black", type="l");
lines(d$Date, d$Sub_metering_2, col="red", type="l");
lines(d$Date, d$Sub_metering_3, col="blue", type="l");
legend("topright", legend = l, col=lcolors, lwd=1);

plot(d$Date, d$Global_reactive_power, col="black", type="l",ylab="Global Reactive Power (kilowatts)", xlab="");