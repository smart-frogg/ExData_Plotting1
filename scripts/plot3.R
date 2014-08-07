# draw plot3
plot3 <- function(data = NA)
{
	if (is.na(data))
	{
		source("load_data.R")
		data <- load_dataset()
	}
	png("plot3.png")
	par(mfrow=c(1,1))
	
	plot(
		data$Time,
		data$SubMetering1,
		type="n",
		ylab = "Energy sub metering",
		xlab="")
	# SubMetering1 
	lines(
		data$Time,
		data$SubMetering1,
		col="black")
	# SubMetering2	
	lines(
		data$Time, 
		data$SubMetering2, 
		col="red")
	# SubMetering3	
	lines(
		data$Time, 
		data$SubMetering3, 
		col="blue")
	
	# Add legend	
	legend ("topright", 
		legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		col = c("black","red","blue"),
		lwd = c(1,1,1))
	dev.off()
}