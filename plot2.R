## ExData, project 1, plot 2

## Read data, download "household_power_consumption.txt" to working directory.
## Read data.
doc <- fread("household_power_consumption.txt")

## Extract only date "1/2/2007" to date "2/2/2007"
data <- doc[doc$Date == "1/2/2007" | doc$Date == "2/2/2007"]

## Get Global_active_power data, set as. numeric
Global <- as.numeric(data$Global_active_power)

## Make "plot2.png" in working directory.
png(filename = "plot2.png", width = 480, height = 480)
## Plot plot2 with y label but no axes.
plot(Global, type= "l", ylab="Global Active Power (kilowatts)", axes = F, xlab = NA)

## add box and add y-axis
axis(side=2)
box()

## add x-axis with new values
axis(side=1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
