#plot3.R
#Author: Arga SDG
#Plot a lineplot of the 3 sub-meterings energy (in watt-hour of active energy)
#in different colors with respect to time
#data is from 01 Feb 2007 to 02 Feb 2007
#Save the graph in a PNG file: plot3.png
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
png(filename = 'plot3.png',width = 480, height = 480, units = "px")
plot(powtime,powdata$Sub_metering_1,xlab = "",ylab="Energy sub metering", type='n')
lines(powtime,powdata$Sub_metering_1)
lines(powtime,powdata$Sub_metering_2,col="red")
lines(powtime,powdata$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=c(1,1,1))
dev.off()
