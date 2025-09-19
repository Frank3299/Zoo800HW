############################
#ZoolOgy800 Homework Week 1#
############################
 
# Author: Frank
# Data: Aug-08-2025
# Task: q25

#The continuous time logistic population growth equation is: 

# NT <- K /(((K-N0)/N0)*exp(-r*K*t)+1)

#where: Nt is the population size at time t, K is the carrying capacity, r is the intrinsic rate of increase, and  N0 is the initial population size.  In terms of Objective 1, below, N1950 = N0 and t=1 in 1951. 

K = 1000 
r = 0.0005 
N0 = 1


#Create two vectors (or a two-column matrix) containing: (1) years 1950 to 2025 and (2) the predicted population size for each year 
#Useful functions: seq(), exp()


year <- seq(1950,2025,by=1)
t <- seq(0,2025-1950,by=1) # t<- year-1950 will be the same thing.
NT <- K /(((K-N0)/N0)*exp(-r*K*t)+1)
population <- cbind(year, NT)


# Plot on the same graph (i.e., two lines): (1) the population size over time for the model above and (2) the population size over time for a population with the same carrying capacity and initial size but double the intrinsic rate of increase.  Note: plot only the years 1950 to 2000.  Label axes in a readable font size and add a legend to help distinguish the two lines. Useful functions: plot(), lines(), legend() 

year1 <- seq(1950,2000,by=1)
t1 <- seq(0,2000-1950,by=1)
NT01 <- K /(((K-N0)/N0)*exp(-r*K*t1)+1)
r1<- r*2
NT11<-K /(((K-N0)/N0)*exp(-r1*K*t1)+1)

plot(year1, NT01, type="l" , col="red", xlab="Year", ylab = "population ")
lines(year1, NT11, col="blue")
legend("bottomright", legend =c ("r=0.0005","r=0.001"), col=c("red","blue") ,  lty = c(1,1), lwd = 2)

#Export the plot from Objective 2 as a .png file to a folder called “Figures”. Useful functions: png()

png(filename = "Desktop/Zoo800/HW/week1/Figures.png", width = 800, height = 800)
plot(year1, NT01, type="l" , col="red", xlab="Year", ylab = "population ")
lines(year1, NT11, col="blue")
legend("bottomright", legend =c ("r=0.0005","r=0.001"), col=c("red","blue") ,  lty = c(1,1), lwd = 2)
dev.off()


