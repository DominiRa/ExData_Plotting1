
#R version 4.1.1 (2021-08-10) -- "Kick Things"
#Copyright (C) 2021 The R Foundation for Statistical Computing
#Platform: x86_64-w64-mingw32/x64 (64-bit)

#Data together
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
#head(data), dim(data), str(data)
#library(dplyr)
# test taki: data1<-as.Date(data$Date,"%d/%m/%Y")
data<-mutate(data,Date=as.Date(data$Date,"%d/%m/%Y"))
data1<- filter (data, Date == "2007-02-01" | Date == "2007-02-02")
data1<-mutate (data1, Global_active_power = as.numeric(data1$Global_active_power))

hist(data1$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file = "plot1.png")
dev.off()
