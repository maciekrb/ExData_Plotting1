
#  Draws a histogram of Global Active Power values for a two day data period
#  (01/02/2007-02/02/2007) from the Electric Power Consumption dataset from the
#   UC Irvine Machine Learning Repository : http://archive.ics.uci.edu/ml/
#
#  Args:
#  - filename: if provided, a png file with the provided name will be created, otherwise, 
#              screen device will be used to render the graphic.
#
plot1 <- function(filename) {
    x <- read.csv(file="household_power_consumption.txt", 
                  sep=";",
                  stringsAsFactors=FALSE,
                  skip=66637, 
                  nrow=2880, 
                  header=FALSE, 
                  col.names = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", 
                                "globalIntensity", "subMetering1", "subMetering2", "subMetering3"),
                  na.strings="?")
    
    if(!missing(filename)){
       png(file=filename, bg="transparent")    
    }
    hist(x$globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
    if(!missing(filename)){
        dev.off()
    }
}