## ExData, project 1, plot 4

## Read data, download "household_power_consumption.txt" to working directory.
## Read data.
doc <- fread("household_power_consumption.txt")

## Extract only date "1/2/2007" to date "2/2/2007"
data <- doc[doc$Date == "1/2/2007" | doc$Date == "2/2/2007"]

## Get data of 3 meters, set as.numeric
react <- as.numeric(data$Global_reactive_power)
Global <- as.numeric(data$Global_active_power)
time <- c(1:2880)
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)
Voltage <- as.numeric(data$Voltage)

## Make "plot4.png" in working directory.
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
plot(Global, type= "l", ylab="Global Active Power (kilowatts)", axes = F, xlab = NA)
box()
axis(side=2)
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

plot(Voltage, type = "l", ylab = "Voltage", axes = F, xlab= "datetime")
box()
axis(side=2)
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
plot(x=c(time, time, time), y=c(sub1,sub2, sub3), type="l", ylab = "Energy sub metering", axes = F, xlab = NA)
box()
axis(side=2)
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
x2= time
y2=sub2
points(x2, y2, col = "red", type = "l")
x3= time
y3=sub3
points(x3, y3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black","red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(react, type="l", ylab="Global_reactive_power", axes = F, xlab="datetime")
box()
axis(side=2)
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()