#################################################
#######             PLOT 3          #############
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


# PLOT 3:

# Open PNG device; create 'plot3.png' in the working directory
png(file = "plot3.png")

with(subdata, {plot(date_time, Sub_metering_1, xlab = "",
                    ylab = "Energy sub metering", type = "n")
               lines(date_time, Sub_metering_1)
               lines(date_time, Sub_metering_2, col = "red")
               lines(date_time, Sub_metering_3, col = "blue")
              legend("topright", lty = 1, col = c("black", 
                "red", "blue"), legend = c("Sub_metering_1",
                "Sub_metering_2", "Sub_metering_3"))
})
dev.off() # close PNG file device