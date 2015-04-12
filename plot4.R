plot4 <- function(){
        data1 <- read.table("household_power_consumption.txt",
                            #load only data from 1/2/2007 to 2/2/2007
                            skip=66637,
                            nrows=2881, sep=";",na.strings="?",
                            colClasses=c("character", "character",
                                         "numeric","numeric","numeric",
                                         "numeric","numeric","numeric",
                                         "numeric"))
        #join the date and time strings, and parse them
        data1$Date <- paste(data1$V1,data1$V2)
        data1$Date <- strptime(data1$Date, "%d/%m/%Y %H:%M:%S")
        #open device
        png(file="plot4.png")
        #create multiplot (Fans of "The Fifth Element", insert joke here!)
        par(mfcol = c(2,2),mar = c(4,5,4,1))
        #create individual plots
        plot(data1$Date, data1$V3, type = "l", xlab="",ylab="Global Active Power")
        
        plot(data1$Date, data1$V7, type = "l", xlab="",ylab="Energy sub metering")
        lines(data1$Date, data1$V8,col="red")
        lines(data1$Date, data1$V9,col="blue")
        legend("topright", lty=1, col = c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(data1$Date, data1$V5, type = "l", xlab="datetime", ylab="Voltage")
        
        plot(data1$Date, data1$V4, type = "l", xlab="datetime",ylab="Global Reactive Power")
        dev.off() #close device
}