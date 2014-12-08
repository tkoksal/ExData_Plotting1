#################################################
#######             PLOT 4          #############
#################################################

### NOTE:
# You need to have installed the packages:lubridate and dplyr


# Read data into a data frame, subdata:
subdata <- read.table("householdPC.txt")


library(dplyr)
# Create new variable 'date_time'
subdata <- mutate(subdata, date_time = 
                      paste(as.character(Date), as.character(Time)))

# Need to convert 'date_time' variable into a date format: 
# POSIXct  
library(lubridate)
subdata$date_time <- ymd_hms(subdata$date_time)


# PLOT 4:

# Open PNG device; create 'plot4.png' in the working directory
png(file = "plot4.png")

par(mfrow = c(2, 2))
with(subdata, {
    plot(date_time, Global_active_power, xlab = "",
      ylab = "Global Active Power (kilowatts)", type = "n")
        lines(date_time, Global_active_power)
   
    plot(date_time, Voltage, xlab = "datetime",
         type = "n")
        lines(date_time, Voltage)
    
    plot(date_time, Sub_metering_1, xlab = "",
        ylab = "Energy sub metering", type = "n")
        lines(date_time, Sub_metering_1)
        lines(date_time, Sub_metering_2, col = "red")
        lines(date_time, Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", 
          "red", "blue"), legend = c("Sub_metering_1",
            "Sub_metering_2", "Sub_metering_3"), bty = "n")
    
    plot(date_time, Global_reactive_power, xlab = "datetime",
         type = "n")
        lines(date_time, Global_reactive_power)
})
dev.off() # close PNG file device