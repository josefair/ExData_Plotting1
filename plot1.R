##This program will load a Dataset or Electric power consumption and will plot the first graph for the project.
##As an output, this program will return a PNG graph, 480 by 480 pixels.


##Loading the data only for the dates from 2007-02-01 to 2007-02-02.  Will also convert the Date column as.Date

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

##Plot 1, This plot will produce a Histogram for Global Active Power.  As output will create the plot1.png file.
  png(filename="plot1.png", width = 480, height = 480, units = "px")
  hist(as.numeric(as.character(dataset.sub$Global_active_power)), main="Global Active Power", ylab = "Frequency", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
