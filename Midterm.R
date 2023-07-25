# Coding in R - Midterm

# Exploratory Data Analysis (EDA) of the Diet Research csv

install.packages("tidyverse")
install.packages("devtools")
install.packages("Hmisc")

    # Libraries 

library(tidyverse)
library(Hmisc)

    # Install the funModeling package from Github using devtools

devtools::install_github("pablo14/funModeling")
library(funModeling)

    # Load the dataset 

diet <- read_csv("~/Desktop/Diet_R.csv")
View(diet)

    # Step 1 

glimpse(diet)
status(diet) 

    # all variables are 'numeric' 
    # the variable that currently contains less than 80% of non-NA values is 'gender' <- will have to find methods to deal with this missingness

    # Step 2 

freq(diet) # Output = NULL: all variables are 'numeric' and are not a factor or a character - must apply this function to specific columns of the dataset 

    # Convert categorical variables such as 'gender' and 'diet' to factors and characters

diet$gender <- as.character(diet$gender)
diet$Diet <- as.factor(diet$Diet)

freq(diet$gender)
ggsave("Gender Frequency.png", dpi = "print") # Saved to my Midterm Project folder 
freq(diet$Diet)
ggsave("Diet Frequency.png", dpi = "print") # Saved to my Midterm Project folder
