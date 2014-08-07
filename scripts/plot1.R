# draw plot1
plot1 <- function(data = NA)
{
	if (is.na(data))
	{
		source("load_data.R")
		data <- load_dataset()
	}
	png("plot1.png")
	par(mfrow=c(1,1))
	hist(
		data$GlobalActivePower,
		main = "Global Active Power",
		xlab = "Global Active Power (kilowatts)",
		col="red"
		)
	dev.off()	
}