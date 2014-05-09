X <- read.csv("household_power_consumption.txt", sep=";")
X$Date<-(as.Date(X$Date,format="%d/%m/%Y"))
X<- X[X$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
X$T2<-paste(X$Date,X$Time)
X$Global_active_power<-as.numeric(as.character(X$Global_active_power))
X$T2<-as.POSIXlt(X$T2)
png(file = "plot-2.png", width=480, height=480)
plot(X$T2,X$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)",xlab='')
dev.off() 