
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

png("plot1.png", width = 480, height = 480, units = "px")

hist(clean$Global_active_power, xlab = "Global Active Power (Kilowatts)", col = "red", main = "Global Active Power")

dev.off()


