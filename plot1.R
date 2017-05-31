# cleaning variables in the workspace to avoid wrong input and output
rm(list=ls(all=TRUE))

# loading the data as data table
electricity <- read.table("C:/Users/p.cwiklinski/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE)

# defining marginals of the desired time period
date1 <- "1/2/2007"
date2 <- "2/2/2007"

# subsetting data to obtain only the part that lays between date1 and date2
electricity_part <- subset(electricity,Date=="1/2/2007" | Date =="2/2/2007")

# alternative way of getting data in the desired range
# subsetData <- electricity[electricity$Date %in% c(date1, date2) ,]

# making the plot as saving it as png file 
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(electricity_part$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
