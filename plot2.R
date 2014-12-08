#################################################
#######             PLOT 2          #############
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


# PLOT 2:

# Open PNG device; create 'plot2.png' in the working directory
png(file = "plot2.png")

with(subdata, {plot(date_time, Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)", type = "n")
     lines(date_time, Global_active_power)
    })
dev.off() # close PNG file device