X <- read.csv("household_power_consumption.txt", sep=";")
X$Date<-(as.Date(X$Date,format="%d/%m/%Y"))
X<- X[X$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
X$Global_active_power<-as.numeric(as.character(X$Global_active_power))
png('Plot1.png', width=480, height=480)
hist(X$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
