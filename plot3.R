# cleaning variables in the workspace to avoid wrong input and output
rm(list=ls(all=TRUE))

# loading the data as data table
electricity <- read.table("C:/Users/p.cwiklinski/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE)

# defining marginals of the desired time period
date1 <- "1/2/2007"
date2 <- "2/2/2007"

# subsetting data to obtain only the part that lays between date1 and date2
electricity_part <- subset(electricity,Date=="1/2/2007" | Date =="2/2/2007")

# joining date and time together
datetime <- strptime(paste(electricity_part$Date, electricity_part$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# alternative way of getting data in the desired range
# subsetData <- electricity[electricity$Date %in% c(date1, date2) ,]

# making the plot as saving it as png file 
png("plot3.png", width=480, height=480)
plot(datetime, as.numeric(electricity_part$Sub_metering_1), type="l", xlab="", ylab="Energy Submetering")
lines(datetime, as.numeric(electricity_part$Sub_metering_2), type="l", col = "red")
lines(datetime, as.numeric(electricity_part$Sub_metering_3), type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
