X <- read.csv("household_power_consumption.txt", sep=";")
X$Date<-(as.Date(X$Date,format="%d/%m/%Y"))
X<- X[X$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
X$T2<-paste(X$Date,X$Time)
X$Global_active_power<-as.numeric(as.character(X$Global_active_power))
X$Sub_metering_1<-as.numeric(as.character(X$Sub_metering_1))
X$Sub_metering_2<-as.numeric(as.character(X$Sub_metering_2))
X$Sub_metering_3<-as.numeric(as.character(X$Sub_metering_3))
X$Voltage<-as.numeric(as.character(X$Voltage))
X$Global_reactive_power<-as.numeric(as.character(X$Global_reactive_power))
X$T2<-as.POSIXlt(X$T2)


png(file = "plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(X$T2,X$Global_active_power,type="l",ylab="Global Active Power",xlab="")
matplot(X[,7:9], type = "lll",lty=1,col = c(1,2,4),ylab="Energy sub metering",xaxt="n")
axis(1, at=c(0, 1440,  2880),labels=c("Thu", "Fri", "Sat")) 
legend("topright",cex=0.5, lty = 1, col = c(1,2,4), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(X$T2,X$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(X$T2,X$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off() 

