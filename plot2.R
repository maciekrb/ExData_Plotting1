
#  Draws a plot of Global Active Power (Kw) vs day of week for a two day data period
#  (01/02/2007-02/02/2007) from the Electric Power Consumption dataset from the
#   UC Irvine Machine Learning Repository : http://archive.ics.uci.edu/ml/
#
#  Args:
#  - filename: (char) if provided, a png file with the provided name will be created, otherwise, 
#              screen device will be used to render the graphic. Ex: "plot2.png".
#
plot2 <- function(filename) {
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
        
    if(!missing(filename)){
       png(file=filename, bg="transparent")    
    }
    plot(x$dateTime, x$globalActivePower, 
         main="", type="l", ylab="Global Active Power (kilowatts)", xlab="")
    
    if(!missing(filename)){
        dev.off()
    }
}