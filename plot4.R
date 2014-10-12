##This program will load a Dataset or Electric power consumption and will plot the different graphs 
##Overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 


##Loading the data only for the dates from 2007-02-01 to 2007-02-02.

  filelocation <- "C:/Users/josefair/Documents/GitHub/datasciencecoursera/data/household_power_consumption.txt"
  dataset <- read.table(filelocation, header=TRUE, sep=";", dec = ".")
  dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
  
  ##reducing set only to specific dates needed for the excercise, outcome is dataset.sub that is ready for plotting
  ## Will also read in date/time info in format 'm/d/y h:m:s'
  
  dataset.sub <-  subset (dataset, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))
  dates <- dataset.sub$Date
  times <- dataset.sub$Time
  dates_times <- paste(dates, times)
  dates_times <- strptime(dates_times,format="%Y-%m-%d %H:%M:%S")
  dataset.sub$date_time <- dates_times
  
##Start Plotting the four graphs, open to save in png file
  
  png(filename="plot4.png", width = 480, height = 480, units = "px")
#Plot1
  par(mfrow=c(2,2))
  plot(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Global_active_power)), type = "l", ylab= "Global Active Power", xlab="")
  
  ##hist(as.numeric(as.character(dataset.sub$Global_active_power)), main="Global Active Power", ylab = "Frequency", xlab="Global Active Power (kilowatts)", col="red")
  
#Plot 2
  plot(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Voltage)), type = "l", ylab= "Voltage", xlab="datetime")
  
  
#Plot 3
  
  plot(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Sub_metering_1)), type = "l", ylab= "Energy sub metering", xlab="")
  lines(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Sub_metering_2)), col = "red" )
  lines(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Sub_metering_3)), col = "blue" )
  legend("topright" , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1, 2, 4), lty = c(1, 1, 1), bty = "n")
  
#Plot 4, this is the new plot for Global reactive power against time
  plot(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Global_reactive_power)), type = "l", ylab= "global_reactive_power", xlab="datetime")
  dev.off()
  