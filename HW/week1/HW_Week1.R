#ZOO 800 - Homework 1 - Olaf Jensen - September 5, 2025

#Set parameter values
K = 1000
r = 0.0005
N0 = 1

#Objective 1

#Create a vector of years
year_vec = seq(1950,2025)

#Population model
pop_vec = K/(((K-N0)/N0)*exp(-r*K*(year_vec-1950))+1)


#Objective 2

#Subset the data to 1950 to 2000
year_vec_trunc = year_vec[1:51]
pop_vec_trunc = pop_vec[1:51]

#Checking if truncation worked correctly - it did so I comment out next line
#max(year_vec_trunc)

#Plot the original data - first opening png to capture the plot
png(filename = "C:/Data/Wisconsin2/Teaching/QuantMethods/Week_1/Figures/HW_Week1.png")
plot(year_vec_trunc, pop_vec_trunc, type = "l", col = "red",
     xlab = "Year", ylab = "Population Size")

#Generate predictions for the model with r doubled

#create a new r parameter
r2 = 2*r

pop_vec_trunc_r2 = K/(((K-N0)/N0)*exp(-r2*K*(year_vec_trunc-1950))+1)

#Add this second population model to the plot
lines(year_vec_trunc, pop_vec_trunc_r2, col = "black")

#Add a legend
legend("bottomright", legend = c("r = 0.0005", "r = 0.001"), col = c("red", "black"), lty = 1)

#Objective 3

#Export the figure
dev.off()
