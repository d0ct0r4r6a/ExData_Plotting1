#plot4.R
#Author: Arga SDG
#Plot 4 graphs in one PNG file
#1st Graph: a lineplot showing the household global minute-averaged active power (in kilowatt)
#with respect to time
#2nd Graph: a lineplot of the 3 sub-meterings energy (in watt-hour of active energy)
#in different colors with respect to time
#3rd Graph: a lineplot of minute-averaged voltage (in volt)
#with respect to time
#4th Graph: a lineplot of household global minute-averaged reactive power (in kilowatt)
#with respect to time
#data is from 01 Feb 2007 to 02 Feb 2007
#Save the graph in a PNG file: plot4.png
#########################################

#Read 10 rows to get a sense of the data
powdata<-read.table("../Exploratory Data Analysis/household_power_consumption.txt",
                    sep=";",nrows = 10,header = TRUE, na.strings="?")

#Extract the column names
colnames <- names(powdata)

#Read the table for the specified time period
powdata<-read.table("../Exploratory Data Analysis/household_power_consumption.txt",
                    sep=";",nrows = 2880,header = TRUE, na.strings="?", 
                    skip=66636, col.names = colnames)

#Create a table to to store the time period in POSIXlt format
powtime<-paste(powdata[,1],powdata[,2])
powtime<-strptime(powtime, format="%d/%m/%Y %H:%M:%S")

#Open the png graphic device and plot
png(filename = 'plot4.png',width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

#plot 1st graph
plot(powtime,powdata$Global_active_power, type='l', xlab="",ylab="Global Active Power")

#plot 2nd graph
plot(powtime,powdata$Sub_metering_1,xlab = "",ylab="Energy sub metering", type='n')
lines(powtime,powdata$Sub_metering_1)
lines(powtime,powdata$Sub_metering_2,col="red")
lines(powtime,powdata$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"), lty=c(1,1,1),lwd=c(2,2,2),bty = "n",cex = 0.75)

#plot 3rd graph
plot(powtime,powdata$Voltage,xlab="datetime",ylab="Voltage", type='l')

#plot 4th graph
plot(powtime,powdata$Global_reactive_power,
     xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()
