input <- readLines("household_power_consumption.txt");
df <- read.table(textConnection(input[grep('^1/2/2007|^2/2/2007|Date',input) ]),sep=';',header=TRUE);
png('plot1.png',width=480, height=480);
hist(df$Global_active_power,main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)");
dev.off();
