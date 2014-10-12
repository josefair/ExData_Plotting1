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


##Plot 3, This plot will produce a graph for Energy Sub_Metering against time.  As output will create the plot2.png file.
##To build the graph have to convert Global_Active_power to numeric so it can be used to plot.

png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Sub_metering_1)), type = "l", ylab= "Energy sub metering", xlab="")
lines(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Sub_metering_2)), col = "red" )
lines(dataset.sub$date_time, as.numeric(as.character(dataset.sub$Sub_metering_3)), col = "blue" )
legend("topright" , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1, 2, 4), lty = c(1, 1, 1))
dev.off()






