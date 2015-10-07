library(dplyr)
library(lubridate)

fileName <- "C:/Users/mercache/Desktop/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"

df <- read.table(fileName, sep=";", header=TRUE, na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
df <- df %>% mutate(Date=dmy(Date))
df <- df %>% filter(Date>=dmy("1/2/2007"))%>%filter(Date<=dmy("2/2/2007"))

df_t <- df %>% mutate(DateTime=ymd_hms(paste(Date,Time)))%>%select(DateTime, Global_active_power)

plot(df_t$DateTime,df_t$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, 'plot2.png')
dev.off()
