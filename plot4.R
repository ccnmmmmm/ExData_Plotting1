library(dplyr)
library(lubridate)
library(ggplot2)

fileName <- "C:/Users/mercache/Desktop/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"

df <- read.table(fileName, sep=";", header=TRUE, na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
df <- df %>% mutate(Date=dmy(Date))
df <- df %>% filter(Date>=dmy("1/2/2007"))%>%filter(Date<=dmy("2/2/2007"))

df1 <- df %>% mutate(DateTime=ymd_hms(paste(Date,Time)))

par(mfrow=c(2,2))
plot(df1$DateTime,df1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="")
plot(df1$DateTime, df1$Voltage, type="l",ylab="Voltage",xlab="datetime")
plot(df1$DateTime,df1$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(df_t$DateTime,df_t$Sub_metering_2,col="red")
lines(df_t$DateTime,df_t$Sub_metering_3,col="blue")
legend("topright", legend=colnames(df_t)[2:4], col=c("black","red","blue"),lty=1, bty="n", cex=.7, xjust=1, yjust=1)
plot(df1$DateTime,df1$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, 'plot4.png')
dev.off()
