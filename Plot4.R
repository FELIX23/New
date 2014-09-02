
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


## Plot 4
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

## Plot 1,1
plot(data$Global_active_power~data$DataTiming, type="l",
     ylab="Global Active Power", xlab="")

## Plot 1,2

plot(data$Voltage~data$DataTiming, type="l",
     ylab="Voltage", xlab="datetime")


## Plot 2,1
plot(data$Sub_metering_1~data$DataTiming, type="l",
     ylab="Energy_Submetering", xlab="")
lines(data$Sub_metering_2~data$DataTiming,col='Red')
lines(data$Sub_metering_3~data$DataTiming,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", cex=1,pt.cex = cex,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 2,2

plot(data$Global_reactive_power~data$DataTiming, type="l",
     ylab="Global Rective Power", xlab="datetime")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

