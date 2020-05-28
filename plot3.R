a <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
c<-a[a$Date %in% c("1/2/2007","2/2/2007"),]

DateTime<-strptime(paste(c$Date,c$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

submetering1<-as.numeric(c$Sub_metering_1)
submetering2<-as.numeric(c$Sub_metering_2)
submetering3<-as.numeric(c$Sub_metering_3)

png("plot3.png",width=480,height=480)
plot(DateTime,submetering1,type="l",ylab="Energy sub metering")
lines(DateTime,submetering2,type="l",col="red")
lines(DateTime,submetering3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()