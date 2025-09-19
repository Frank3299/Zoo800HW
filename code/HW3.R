############################
#ZoolOgy800 Homework Week 3#
############################

# Author: Frank
# Data: Sep-19-2025



#*********************************************************
# Part11 
# Part 1: Basic Syntax and Variables 
# 1. Create a variable called temp_C and assign it the value of 18.5 (degrees Celsius). 
# 2. Convert temp_C to Fahrenheit and store it in a new variable called temp_F. 
# 3. Write a single line of code that prints: "The water temperature is XX °C (YY °F)", where XX and YY are replaced with your variables. 
#**********************************************************

#Q1, Create a variable called temp_C and assign it the value of 18.5 (degrees Celsius)

temp_C <- 18.5
temp_F = temp_C * (9/5)+ 32

temp_state <- paste("The water temperature is", temp_C, "°C (", temp_F," °F)") 
print(temp_state)


#*********************************************************
# Part2 
# 1. Create a vector called species_counts with the following values: o Bluegill = 12, Bass = 7, Sunfish = 21, Carp = 3 
# 2. Write code to: o Find the total number of fish counted.o Find the species with the highest count. 
# 3. Create a 3×3 array (matrix) that represents chlorophyll concentrations (µg/L) measured at 3 depths (surface, mid, bottom) on 3 different days. Use arbitrary numbers but make them realistic (e.g., 1–50). 
# 4. Calculate the average chlorophyll concentration at each depth across days. 
#*********************************************************

species_counts <- c(Bluegill = 12, Bass = 7, Sunfish = 21, Carp = 3)

fish_counted <- sum(species_counts)
fish_counted

highest_count <- max(species_counts)
highest_count_species <- names(which.max(species_counts))

chlorophyll_conc <- matrix(c(42, 23, 25, 31, 41, 22, 37, 30, 29), nrow = 3, ncol = 3)
rownames(chlorophyll_conc) <- c("Surface", "Mid", "Bottom")
colnames(chlorophyll_conc) <- c("Day 1", "Day 2", "Day 3")
print(chlorophyll_conc)

depth_averages <- (rowMeans(chlorophyll_conc))
depth_averages



#*********************************************************
# part3
#***********************************************************
#You sampled dissolved oxygen (mg/L) and temperature (°C) in 5 lakes.Lake Temp_C DO_mgL 
#Mendota 22.4 8.3 
#Wingra 25.1 6.7 
#Monona 23.7 7.5 
#Waubesa 24.6 7.9 
#Kegonsa 26.0 6.2 
#1. Enter this data into a data frame called lakes. 
#2. Calculate the mean temperature and mean dissolved oxygen across all lakes. 
#3. Add a new column called Temp_F with values converted to Fahrenheit. 
#4. [BONUS] install package <LakeMetabolizer>. Add new column for the equilibrium concentration of oxygen in water. Add a second new column of dissolved oxygen % 
# saturation. Sort the dataframe in order of DO % saturation using the order() function. 
#*********************************************************************************

#1. make the date frame
Lake <- c("Mendota", "Wingra", "Monona", "Waubesa","Kegonsa" )
Temp_C <- c(22.4, 25.1, 23.7, 24.6, 26.0)
DO_mgL <- c (8.3, 6.7, 7.5, 7.9, 6.2)
lakes <- data.frame(Lake, Temp_C, DO_mgL)

#2. Calculate the mean temperature and mean dissolved oxygen
mean_temp <- mean(lakes$Temp_C)
mean_temp

# Calculate the dissolved oxygen
mean_DO <- mean(lakes$DO_mgL)
mean_DO

#3. Add a new column called Temp_F with values converted to Fahrenheit.
lakes$Temp_F <- lakes$Temp_C *9/5+32

#4. #4. [BONUS] install package <LakeMetabolizer>. Add new column for the equilibrium concentration of oxygen in water. Add a second new column of dissolved oxygen % 
# saturation. Sort the dataframe in order of DO % saturation using the order() function. 

install.packages("LakeMetabolizer")

library(LakeMetabolizer)


lakes$DO_sat <- o2.at.sat.base (temp = lakes$Temp_C,baro=1000, altitude = 0, salinity = rep(0, length(Temp_C)),  model = "garcia-benson") 



#*********************************************************
#Part 4: For Loops 
#1. Write a for loop that prints the square of each number from 1 to 10. 
#2. Suppose you want to model exponential population growth with  Nt=N0ert o Let N0=10, r=0.3, and simulate 10 time steps.  o Use a for loop to calculate population size at each time step and store results in a 3vector called pop.  You collected phosphorus concentration data (µg/L) from 5 lakes. Each lake was sampled 4  times. The data are stored as a list, where each element is a vector of values for one lake. 
# 3. Create a list called phosphorus with 5 elements (one per lake), each containing 4  numeric values. Use made-up numbers, but keep them realistic (e.g., 5–40 µg/L). 
#4. Write a for loop that: 
# o Iterates through each lake in the list. 
# o Calculates the mean phosphorus concentration for that lake. 
# o Stores these means in a new numeric vector called lake_means. 
# o Prints a message for each lake, e.g., "Lake1 mean phosphorus = 18.75 µg/L". 
# 5. At the end, print the vector of means (lake_means).
#***********************************************************

#1
for (i in 1:10) {print(i^2)}

#2
N0 = 10
r = 0.3 
steps <- 1:10 
pop <- numeric(length(steps))
for (i in steps) {pop[i] <- N0*exp(r*i)}
pop

#3  # 3. Create a list called phosphorus with 5 elements (one per lake), each containing 4  numeric values. Use made-up numbers, but keep them realistic (e.g., 5–40 µg/L).

phosphorus <- list(
Mendota = c(13, 15, 28, 30),
Wingra  = c(18, 10, 12, 14),
Monona  = c(20, 25, 22, 28),
Waubesa = c(15, 27, 19, 12),
Kegonsa = c(30, 28, 35, 32)
)

#4. Write a for loop that: 
# o Iterates through each lake in the list. 
# o Calculates the mean phosphorus concentration for that lake. 
# o Stores these means in a new numeric vector called lake_means. 
# o Prints a message for each lake, e.g., "Lake1 mean phosphorus = 18.75 µg/L". 

# I already have Lake <- c("Mendota", "Wingra", "Monona", "Waubesa","Kegonsa" )

lake_means <- numeric(length(Lake))

for (i in 1:5) {
  lake_name <- Lake[i]
  mean_val <- mean(phosphorus[[lake_name]])
  lake_means[i] <- mean_val
  message(lake_name, " mean phosphorus = ", round(mean_val, 2), " µg/L")
}


#***********************************************************
#*Part 5: Apply Functions 
#1. Revisit your chlorophyll array from Part 2. Use apply() to calculate: 
# The mean concentration for each depth (rows). 
# The mean concentration for each day (columns). 
#2. Revisit your lakes data frame. Use apply() to calculate the range (max – min) of each  numeric column. 
# 3. Compare your for loop population growth results with using sapply() or lapply(). 
# Which feels easier or cleaner?
#***********************************************************
  

#1. I already have 
#chlorophyll_conc <- matrix(c(42, 23, 25, 31, 41, 22, 37, 30, 29), nrow = 3, ncol = 3)
#rownames(chlorophyll_conc) <- c("Surface", "Mid", "Bottom")
#colnames(chlorophyll_conc) <- c("Day 1", "Day 2", "Day 3")
#print(chlorophyll_conc)

mean_c_deep <- apply(chlorophyll_conc, 1, mean)
mean_c_deep 

mean_c_day <- apply(chlorophyll_conc, 2, mean)
mean_c_day 


#2. Revisit your lakes data frame. Use apply() to calculate the range (max – min) of each  numeric column.
numeric_cols <- sapply(lakes, is.numeric)
ranges <- apply(lakes[, numeric_cols],2,function(x) rev(range(x)))
ranges


# 3. Compare your for loop population growth results with using apply() or lapply(). 
# Which feels easier or cleaner?

# I feel the apply() is much easier. 