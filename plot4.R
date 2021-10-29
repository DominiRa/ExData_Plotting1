#R version 4.1.1 (2021-08-10) -- "Kick Things"
#Copyright (C) 2021 The R Foundation for Statistical Computing
#Platform: x86_64-w64-mingw32/x64 (64-bit)

#Data together

#head(data), dim(data), str(data)
#library(dplyr)
# test taki: data1<-as.Date(data$Date,"%d/%m/%Y")
data<-mutate(data,Date=as.Date(data$Date,"%d/%m/%Y"))
data1<- filter (data, Date == "2007-02-01" | Date == "2007-02-02")
data1<-mutate (data1, Global_active_power = as.numeric(data1$Global_active_power))
data2<- mutate(data1,Time=hms(data1$Time))
data3<-mutate(data2, datetime = Date+Time)
data3<- mutate (data2,weekday = wday((Date),label = TRUE))


data3<-mutate (data3, Sub_metering_1 = as.numeric(data3$Sub_metering_1))
data3<-mutate (data3, Sub_metering_2 = as.numeric(data3$Sub_metering_2))
data3<-mutate (data3, Sub_metering_3 = as.numeric(data3$Sub_metering_3))
data3<-mutate (data3, Voltage = as.numeric(data3$Voltage))
data3<-mutate (data3, Global_reactive_power = as.numeric(data3$Global_reactive_power))

par(mfcol = c(2,2))
plot(data3$datetime, data3$Global_active_power ,type = "l" , xlab = "datetime", ylab = "Global Active Power (kilowatts)")

plot(data3$datetime, data3$Sub_metering_1 ,type = "l" , xlab = "datetime", ylab = "Energy sub metering")
lines(data3$datetime,data3$Sub_metering_2, col = "red")
lines(data3$datetime,data3$Sub_metering_3, col = "blue")

legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data3$datetime,data3$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")
plot(data3$datetime,data3$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,file = "plot4.png")
dev.off()

