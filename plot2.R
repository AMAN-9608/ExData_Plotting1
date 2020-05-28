a <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
c<-a[a$Date %in% c("1/2/2007","2/2/2007"),]

DateTime<-strptime(paste(c$Date,c$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower<-as.numeric(c$Global_active_power)

png("plot2.png",width=480,height=480)
plot(DateTime,GlobalActivePower,type="l",ylab="Global Active Power (kilowatts)")
dev.off()         