plot2 <- function(){
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
        #create time series
        png(file="plot2.png")
        plot(data1$Date, data1$V3, type = "l", xlab="",ylab="Global Active Power (kilowatts)")
        dev.off()
}