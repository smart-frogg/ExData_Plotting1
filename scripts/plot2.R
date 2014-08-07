# draw plot2
plot2 <- function(data = NA)
{
	if (is.na(data))
	{
		source("load_data.R")
		data <- load_dataset()
	}
	png("plot2.png")
	par(mfrow=c(1,1))
	plot(data$Time,data$GlobalActivePower,type="l",
		ylab = "Global Active Power (kilowatts)",
		xlab = "")
	dev.off()	
}