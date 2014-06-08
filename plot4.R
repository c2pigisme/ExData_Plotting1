input <- readLines("household_power_consumption.txt");
df <- read.table(textConnection(input[grep('^1/2/2007|^2/2/2007|Date',input) ]),sep=';',header=TRUE);
png('plot4.png',width=480, height=480);
par(mfrow=c(2,2))
allDate <- paste(df$Date, df$Time);
xdata <- strptime(allDate, "%d/%m/%Y %H:%M:%S");
ydata <- as.numeric(df$Global_active_power[seq(0,length(df$Global_active_power))]);
#Plot 1,1
plot(xdata, ydata, type='l', ylab="Global Active Power (kilowatts)",xlab="");
# Plot 1,2
plot(xdata, df$Voltage, type='l',ylab="Voltage",xlab="datetime");
#Plot 2,1
plot(xdata, df$Sub_metering_1, ylab="Energy Sub Metering", type="n", xlab="");
lines(xdata, df$Sub_metering_1, col="black");
lines(xdata, df$Sub_metering_2, col="red");
lines(xdata, df$Sub_metering_3, col="blue");
legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=c(1,1,1),  lwd=c(0.5,0.5,0.5),col=c("black","red","blue"), cex=0.8,bty="n",y.intersp=0.8) 
#Plot 2,2
plot(xdata, df$Global_reactive_power, ,ylab="Global_reactive_power",type='l',xlab="datetime");
dev.off();