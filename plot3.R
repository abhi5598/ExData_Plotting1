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
#plot3 graph
png(filename = "plot3.png",
    width = 480,
    height = 480)
plot(
        subelect$completedate,
        subelect$Sub_metering_1,
        type = "n",
        xlab = "",
        ylab = "Energy sub metering"
)
lines(subelect$completedate, subelect$Sub_metering_1, col = "black")
lines(subelect$completedate, subelect$Sub_metering_2, col = "red")
lines(subelect$completedate, subelect$Sub_metering_3, col = "blue")
legend(
        "topright",
        col = c("black", "red", "blue"),
        legend = c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "),
        lty = c(1, 1),
        lwd = c(1, 1)
)

dev.off()
