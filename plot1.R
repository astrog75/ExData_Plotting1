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

# Select only the dates between 2007-02-01 and 2007-02-02 (namely : 2 days)
data = data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",];

# Export histogram to a png
png(filename = "plot1.png", width = 480, height = 480, units = "px");

#Plot 1
hist(data$Global_active_power/1000,
     breaks = 13, 
      col="red",
      main = "Global Active Power",
      axes = TRUE, 
      xlab = "Global Active Power (kilowatts)")

dev.off();


