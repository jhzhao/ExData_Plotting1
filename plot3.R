## ExData, project 1, plot 3

## Read data, download "household_power_consumption.txt" to working directory.
## Read data.
doc <- fread("household_power_consumption.txt")

## Extract only date "1/2/2007" to date "2/2/2007"
data <- doc[doc$Date == "1/2/2007" | doc$Date == "2/2/2007"]

## Get data of 3 meters, set as.numeric
time <- c(1:2880)
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

## Make "plot3.png" in working directory.
png(filename = "plot3.png", width = 480, height = 480)

## Plot plot3 with y label but no axes.
plot(x=c(time, time, time), y=c(sub1,sub2, sub3), type="l", ylab = "Energy sub metering", axes = F, xlab = NA)
## add box, and y-axis
box()
axis(side = 2)
## add x-axis with new values
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

## change color

x2= time
y2=sub2
points(x2, y2, col = "red", type = "l")

x3= time
y3=sub3
points(x3, y3, col = "blue", type = "l")

## add legend
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
