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
plot(sub1, type="l", ylab = "Energy sub metering", axes = F, xlab = NA)
lines(sub2, col = "blue")
lines(sub3, col = "red")
## add box, and y-axis
box()
axis(side = 2)
## add x-axis with new values
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

## add legend
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
