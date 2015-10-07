library(dplyr)
library(lubridate)
library(ggplot2)

fileName <- "C:/Users/mercache/Desktop/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"

df <- read.table(fileName, sep=";", header=TRUE, na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
df <- df %>% mutate(Date=dmy(Date))
df <- df %>% filter(Date>=dmy("1/2/2007"))%>%filter(Date<=dmy("2/2/2007"))

df_t <- df %>% mutate(DateTime=ymd_hms(paste(Date,Time)))%>%select(DateTime, Sub_metering_1:Sub_metering_3)

plot(df_t$DateTime,df_t$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(df_t$DateTime,df_t$Sub_metering_2,col="red")
lines(df_t$DateTime,df_t$Sub_metering_3,col="blue")
legend("topright", legend=colnames(df_t)[2:4], col=c("black","red","blue"),lty=1)

dev.copy(png, 'plot3.png')
dev.off()
