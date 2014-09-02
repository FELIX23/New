
## Uploading full data set from .txt file 
d = read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

## Adapt data format to subset
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

## SUbsetting the data to obtain the variables pertaining to the two february days
data <- subset(d, (d$Date >= "2007-02-01" & d$Date <= "2007-02-02"))

## Liberating memory space. Erasing full data package
rm(d)

## Plotting of the first histogram, Global Active Power. 
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Transfering plot to .png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


