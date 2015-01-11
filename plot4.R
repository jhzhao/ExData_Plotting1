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
## Plot plot3 with y label but no axes.
plot(sub1, type="l", ylab = "Energy sub metering", axes = F, xlab = NA)
lines(sub2, col = "blue")
lines(sub3, col = "red")
## add box, and y-axis
box()
axis(side = 2)
## add x-axis with new values
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

## add legend


legend("topright", lty = 1, col = c("black","red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(react, type="l", ylab="Global_reactive_power", axes = F, xlab="datetime")
box()
axis(side=2)
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()