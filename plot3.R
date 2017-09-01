library(datasets)
electric_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
electric_data$Date <- as.Date(electric_data$Date, "%d/%m/%Y")
subset_data <- subset(electric_data, Date == "2007-02-01" | Date == "2007-02-02")
subset_data[,7] <- as.numeric(subset_data[,7])
subset_data[,8] <- as.numeric(subset_data[,8])
subset_data[,9] <- as.numeric(subset_data[,9])
with(subset_data, {
plot(datetime, Global_active_power, type = "l", xlab= "", ylab="Global Active Power")
		          
                    plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

                    plot(datetime,  Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
                    lines(datetime, Sub_metering_2, col = "red")
                    lines(datetime, Sub_metering_3, col = "blue")
})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png,file = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
dev.off()