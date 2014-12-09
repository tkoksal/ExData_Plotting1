#################################################
#######             PLOT 1          #############
#################################################

### NOTE:
# You need to have installed the following packages:
# data.table
# lubridate
# dplyr

# The 'fread' function from data.table package allows faster
# data reading

library(data.table)
data <- fread("household_power_consumption.txt", 
              header = TRUE, na.strings = c("?"))

# Need to convert 'Date' variable into a date format: POSIXct  
library(lubridate)
data$Date <- dmy(data$Date)

# Subset data to two days:"2007-02-01" and "2007-02-02"
library(dplyr)
day1 <- ymd("2007-02-01") 
day2 <- ymd("2007-02-02")
subdata <- filter(data, Date >= day1 & Date <= day2)

# Write/save subsetted data into the working directory as 
# .txt file for future use 
write.table(subdata, file = "householdPC.txt") 

remove(data) # remove from objects

############################################################
##########      VERY IMPORTANT      ########################
#### If you want to reproduce plot1, please comment all the
#### the lines above and uncomment the below block of code which
### reads the subsetted data(.txt file) "householdPC.txt"
### in the working for this project ########################

### BEGIN BLOCK

# # Read data into a data frame, subdata:
# subdata <- read.table("householdPC.txt")
# 
# # Need to convert 'Date' variable into a date format: POSIXct  
# library(lubridate)
# subdata$Date <- dmy(subdata$Date)
# 
# ### END BLOCK

# PLOT 1:

# First, need to convert "Global_active_power" into numeric
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# Open PNG device; create 'plot1.png' in the working directory
png(file = "plot1.png")
hist(subdata$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off() # close PNG file device