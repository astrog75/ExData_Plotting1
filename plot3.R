#################################
#
#
# Load the data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";");

# Print the first lines of the data, to "get a look"
head(data);

# Convert the dates to an R date object
temp = as.Date(data$Date, format = "%d/%m/%Y");
data$Date = temp;

# Dont spoil memory
rm(temp);

# Select only the dates between 2007-02-01 and 2007-02-02 (namely : 2 days)
data = data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",];

# Manage the time object
datetime = paste(data$Date, data$Time);
temp = strptime(datetime, format = "%Y-%m-%d %H:%M:%S");
data$Time = temp;
rm(temp);
rm(datetime);

# Export histogram to a png
png(filename = "plot3.png", width = 480, height = 480, units = "px");

#Plot 3
plot(data$Time, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering");

lines(data$Time, data$Sub_metering_2, col = "red");
lines(data$Time, data$Sub_metering_3, col = "blue");

dev.off();
