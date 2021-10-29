#R version 4.1.1 (2021-08-10) -- "Kick Things"
#Copyright (C) 2021 The R Foundation for Statistical Computing
#Platform: x86_64-w64-mingw32/x64 (64-bit)

#Data together

#head(data), dim(data), str(data)
#library(dplyr)
#library(lubridate)
# test taki: data1<-as.Date(data$Date,"%d/%m/%Y")
data<-mutate(data,Date=as.Date(data$Date,"%d/%m/%Y"))
data1<- filter (data, Date == "2007-02-01" | Date == "2007-02-02")
data1<-mutate (data1, Global_active_power = as.numeric(data1$Global_active_power))
data2<- mutate(data1,Time=hms(data1$Time))
data3<-mutate(data2, datetime = Date+Time)
data3<- mutate (data2,weekday = wday((Date),label = TRUE))
plot(data3$datetime, data3$Global_active_power ,type = "l" , xlab = "datetime", ylab = "Global Active Power (kilowatts)")

dev.copy(png,file = "plot2.png")
dev.off()
