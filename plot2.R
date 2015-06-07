
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFileName <- "power.zip"
fileName <- "household_power_consumption.txt"

if(! file.exists(zipFileName)) {
        download.file(url, zipFileName)
        unzip(zipFileName)
}

df <- read.table(fileName, header = T, sep = ";", skipNul = T, na.strings = "?", stringsAsFactors = F)

wanted <- c("1/2/2007", "2/2/2007")

clean <- df[df$Date %in% wanted, ]

dateTime   <- as.POSIXlt(paste(as.Date(clean$Date, format="%d/%m/%Y"), clean$Time, sep=" "))

png("plot2.png", width = 480, height = 480, units = "px")

plot(dateTime, clean$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

dev.off()
