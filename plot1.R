library(dplyr)
library(lubridate)

fileName <- "C:/Users/mercache/Desktop/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"

df <- read.table(fileName, sep=";", header=TRUE, na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
df <- df %>% mutate(Date=dmy(Date))
df <- df %>% filter(Date>=dmy("1/2/2007"))%>%filter(Date<=dmy("2/2/2007"))


hist(df$Global_active_power,12, col='red', main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, 'plot1.png')
dev.off()
