
## Uploading full data set from .txt file 
d = read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

## Adapt data format to subset
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

## SUbsetting the data to obtain the variables pertaining to the two february days
data <- subset(d, (d$Date >= "2007-02-01" & d$Date <= "2007-02-02"))

## Liberating memory space. Erasing full data package
rm(d)

## Creating new variable (Date + Time)
data$DataTiming = as.POSIXct(paste0(as.Date(data$Date),data$Time)) 


## Third Plot. 
plot(data$Sub_metering_1~data$DataTiming, type="l",
     ylab="Energy_Submettering", xlab="")
lines(data$Sub_metering_2~data$DataTiming,col='Red')
lines(data$Sub_metering_3~data$DataTiming,col='Blue')

## Adding Legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


