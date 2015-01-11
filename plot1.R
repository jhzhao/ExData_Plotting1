## ExData project 1 - R-code, plot1.R
## Read data, download "household_power_consumption.txt" to working directory.
## Read data.
doc <- fread("household_power_consumption.txt")

## Extract only date "1/2/2007" to date "2/2/2007"
data <- doc[doc$Date == "1/2/2007" | doc$Date == "2/2/2007"]
## check if reading is correct
nrow(data) ## 2880

## Get Global_active_power data, set as. numeric
Global <- as.numeric(data$Global_active_power)

## Make "plot1.png" in working directory.
png(filename = "plot1.png", width = 480, height = 480)
## Plot histogram with label and title.
hist(Global, col = "red1", ylim=c(0,1200), xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()