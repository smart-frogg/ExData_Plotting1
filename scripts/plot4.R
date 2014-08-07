# draw plot4
plot4 <- function(data = NA)
{
	if (is.na(data))
	{
		source("load_data.R")
		data <- load_dataset()
	}
	png("plot4.png")
	par(mfrow=c(2,2))
	
	plot(
		data$Time,
		data$GlobalActivePower,
		type="l",
		ylab = "Global Active Power",
		xlab="", 
		col="black")
		
	plot(
		data$Time,
		data$Voltage,
		type="l",
		ylab = "Voltage",
		xlab="datetime", 
		col="black")	
		
	plot(
		data$Time,
		data$SubMetering1,
		type="n",
		ylab = "Energy sub metering",
		xlab="")
	lines(
		data$Time,
		data$SubMetering1,
		col="black")
	lines(
		data$Time, 
		data$SubMetering2, 
		col="red")
	lines(
		data$Time, 
		data$SubMetering3, 
		col="blue")
	legend ("topright", 
		legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		col = c("black","red","blue"),
		lwd = c(1,1,1),bty="n")
		
	plot(
		data$Time,
		data$GlobalReactivePower,
		type="l",
		ylab = "Global_reactive_power",
		xlab="datetime", 
		col="black")	
	dev.off()		
}