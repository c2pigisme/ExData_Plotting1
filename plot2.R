input <- readLines("household_power_consumption.txt");
df <- read.table(textConnection(input[grep('^1/2/2007|^2/2/2007|Date',input) ]),sep=';',header=TRUE);
allDate <- paste(df$Date, df$Time);
xdata <- strptime(allDate, "%d/%m/%Y %H:%M:%S");
ydata <- as.numeric(df$Global_active_power[seq(0,length(df$Global_active_power))]);
png('plot2.png',width=480, height=480);
plot(xdata, ydata, type='l', ylab="Global Active Power (kilowatts)",xlab="");
dev.off();