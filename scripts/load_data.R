# function for dataset download and extract
load_dataset <- function()
{
  if(!file.exists("./data"))
  {
    message("Create directory for data...")
    dir.create("./data");
  }
  message("Directory for data created.")
  if(!file.exists("./data/data.zip"))
  {
    message("Download dataset archive...")
    file.url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
    download.file(file.url,"./data/data.zip");
  }
  message("Dataset arhive downloaded.")
  if(!file.exists("./data/household_power_consumption.txt"))
  {
    message("Extract dataset...")
    unzip("./data/data.zip",exdir = "./data" );
  }  
  message("Dataset extracted.")
  data <- read.csv( "./data/household_power_consumption.txt",
		header = FALSE,
		na.strings = "?",  
		nrows = 2880,
        skip = 66637, 
		sep = ";",
        stringsAsFactors = FALSE,
		col.names= c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3"),
		colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
		row.names=NULL) 
  data$Time <- strptime(paste(data$Date,' ',data$Time),"%d/%m/%Y %H:%M:%S")
  data$Date <- strptime(data$Date,"%d/%m/%Y")

  message("Dataset loaded.")
  return (data)
}