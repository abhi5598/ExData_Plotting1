#Load Data
elect <-
        read.table(
                "household_power_consumption.txt",
                header = TRUE ,
                sep = ";",
                na.strings = "?"
        )
# Convert & add new column
elect$completedate <-
        strptime(paste(elect$Date, elect$Time),
                 format = "%d/%m/%Y %H:%M:%S")
#subset only 2007-02-01 and 2007-02-02
subelect <-
        subset(
                elect,
                completedate >= strptime("01/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S") &
                        completedate <= strptime("02/02/2007 23:59:59", format = "%d/%m/%Y %H:%M:%S")
        )
#plot1 graph
png(filename = "plot1.png",
    width = 480,
    height = 480)
hist(
        subelect$Global_active_power,
        col = "red",
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)"
)
dev.off()
