source("plot2.R")
source("plot3.R")

# Function draws a voltage vs day of week plot for a two day data period 
#  (01/02/2007-02/02/2007) from the Electric Power Consumption dataset from the
#   UC Irvine Machine Learning Repository : http://archive.ics.uci.edu/ml/
voltage_plot <- function() {
    x <- read.csv(file="household_power_consumption.txt", 
                  sep=";",
                  stringsAsFactors=FALSE,
                  skip=66637, 
                  nrow=2880, 
                  header=FALSE, 
                  col.names = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", 
                                "globalIntensity", "subMetering1", "subMetering2", "subMetering3"),
                  na.strings="?")
    
    x$dateTime <- as.POSIXct(paste(x$date, x$time), format="%d/%m/%Y %H:%M:%S")
    
    plot(x$dateTime, x$voltage, type="l", ylab="Voltage", xlab="datetime")
}

# Function draws global reactive power vs day of week plot for a two day data period 
#  (01/02/2007-02/02/2007) from the Electric Power Consumption dataset from the
#   UC Irvine Machine Learning Repository : http://archive.ics.uci.edu/ml/
reactive_power_plot <- function() {
    x <- read.csv(file="household_power_consumption.txt", 
                  sep=";",
                  stringsAsFactors=FALSE,
                  skip=66637, 
                  nrow=2880, 
                  header=FALSE, 
                  col.names = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", 
                                "globalIntensity", "subMetering1", "subMetering2", "subMetering3"),
                  na.strings="?")
    
    x$dateTime <- as.POSIXct(paste(x$date, x$time), format="%d/%m/%Y %H:%M:%S")
    
    plot(x$dateTime, x$globalReactivePower, type="l", ylab="Global_reactive_power", xlab="datetime")
    
}

# Function draws a row wise ordered 2x2 plot for a two day data period 
#  (01/02/2007-02/02/2007) from the Electric Power Consumption dataset from the
#   UC Irvine Machine Learning Repository : http://archive.ics.uci.edu/ml/
#
#   The plots included in the 2x2 grid are :
#   - Global Active Power (Kw) vs day of the week
#   - Voltage vs day of the week
#   - 3 energy sub meterings vs day of the week
#   - Global reactive power vs day of the week
#
# Args:
#  - filename: if provided, a png file with the provided name will be created, otherwise, 
#              screen device will be used to render the plot.
#
plot4 <- function(filename) {
   if(!missing(filename)){
       png(file=filename, bg="transparent")    
   }    
   par(mfrow=c(2, 2))
   plot2()
   voltage_plot()
   plot3()
   reactive_power_plot()
   if(!missing(filename)){
      dev.off() 
   }
}