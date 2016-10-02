#plot2.R
#Author: Arga SDG
#Plot a lineplot showing the household global minute-averaged active power (in kilowatt)
#with respect to time
#data is from 01 Feb 2007 to 02 Feb 2007
#Save the graph in a PNG file: plot2.png
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
png(filename = 'plot2.png',width = 480, height = 480, units = "px")
plot(powtime,powdata$Global_active_power, 
     type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()