input <- readLines("household_power_consumption.txt");
df <- read.table(textConnection(input[grep('^1/2/2007|^2/2/2007|Date',input) ]),sep=';',header=TRUE);
allDate <- paste(df$Date, df$Time);
xdata <- strptime(allDate, "%d/%m/%Y %H:%M:%S");
png('plot3.png',width=480, height=480);
plot(xdata, df$Sub_metering_1, ylab="Energy Sub Metering", type="n", xlab="");
lines(xdata, df$Sub_metering_1, col="black");
lines(xdata, df$Sub_metering_2, col="red");
lines(xdata, df$Sub_metering_3, col="blue");
legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=c(1,1,1),  lwd=c(0.5,0.5,0.5),col=c("black","red","blue"),bty="n") 
dev.off();
