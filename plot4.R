a <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
c<-a[a$Date %in% c("1/2/2007","2/2/2007"),]

DateTime<-strptime(paste(c$Date,c$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobalActivePower<-as.numeric(c$Global_active_power)
GlobalReactivePower<-as.numeric(c$Global_reactive_power)
Voltage1<-as.numeric(c$Voltage)
submetering1<-as.numeric(c$Sub_metering_1)
submetering2<-as.numeric(c$Sub_metering_2)
submetering3<-as.numeric(c$Sub_metering_3)

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(DateTime,GlobalActivePower,type="l",ylab="Global Active Power",xlab="")
plot(DateTime,Voltage1,type="l",ylab="Voltage",xlab="datetime")
plot(DateTime,submetering1,type="l",ylab="Energy sub metering",xlab="")
lines(DateTime,submetering2,type="l",col="red")
lines(DateTime,submetering3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(DateTime,GlobalReactivePower,type="l",ylab="Global_reactive_power",xlab="datetime")


#Close the PNG file
dev.off()