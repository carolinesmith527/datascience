# Based on Data Professor tutorial: https://www.youtube.com/watch?v=VzXfPCTHRTg

#########################
# Loading Iris data set
#########################

# Method 1
install.packages("dplyr")
library(dplyr)

install.packages("Seurat")
library(Seurat)

install.packages('shiny')
library(shiny)

library(datasets)
data(dhfr)

# Method 2
install.packages("RCurl")
library(RCurl)

dhfr <- read.csv(text = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/dhfr.csv") )
install.packages('shiny')
# View the data
View(dhfr)

#############################
# Display summary statistics
#############################

# head() / tail()
head(dhfr, 5)
tail(dhfr, 5)


# summary()
summary(dhfr)
summary(dhfr$Y)

# Check to see if there are missing data?
sum(is.na(dhfr))


# skimr() - expands on summary() by providing larger set of statistics
# install.packages("skimr")
# https://github.com/ropensci/skimr


library(skimr)

skim(dhfr) # Perform skim to display summary statistic


# Group data by Species then perform skim
dhfr %>%
  dplyr::group_by(Y) %>% # biological activity
  skim()

#############################
# Quick data visualization
#
# R base plot()
#############################


# Panel plots
plot(dhfr)
plot(dhfr, col = "red")


# Scatter plot
plot(dhfr$moe2D_zagreb, dhfr$moe2D_weinerPol)

plot(dhfr$moe2D_zagreb, dhfr$moe2D_weinerPol, col = "red")     # Makes red circles
plot(dhfr$moe2D_zagreb, dhfr$moe2D_weinerPol, col = dhfr$Y)     # color active vs inactive

plot(dhfr$moe2D_zagreb, dhfr$moe2D_weinerPol, col = dhfr$Y,     # Makes red circles + Adds x and y axis labels
     xlab = "moe2D_zagreb", ylab = "moe2D_weinerPol")


# Histogram
hist(dhfr$moe2D_zagreb)
hist(dhfr$moe2D_zagreb, col = "red")   # Makes red bars

# install.packages("caret")
library(ISLR); library(ggplot2); 
# Feature plots
# https://www.machinelearningplus.com/machine-learning/caret-package/
featurePlot(x = dhfr[,2:19], 
            y = dhfr$Y, 
            plot = "box",
            strip=strip.custom(par.strip.text=list(cex=.7)),
            scales = list(x = list(relation="free"), 
                          y = list(relation="free")))

