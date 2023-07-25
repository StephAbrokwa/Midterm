# Coding in R - Midterm

# The following code will be split up into () section to conduct the visual and numerical analysis of this report 

# SECTION 1: Exploratory Data Analysis (EDA) of the Diet Research csv

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

    # Step 2: Analyzing Categorical Variables

freq(diet) # Output = NULL: all variables are 'numeric' and are not a factor or a character - must apply this function to specific columns of the dataset 

    # Convert categorical variables such as 'gender' and 'diet' to factors and characters

diet$gender <- as.character(diet$gender)
diet$Diet <- as.factor(diet$Diet)
diet$Person <- as.factor(diet$Person) # this variable has been converted to a categorical variable since it is used to uniquely identify each participant in the dataset and holds no numerical value 

freq(diet$gender)
ggsave("Gender Frequency EDA.png", dpi = "print") # Saved to my Midterm Project folder 
freq(diet$Diet)
ggsave("Diet Frequency EDA.png", dpi = "print") # Saved to my Midterm Project folder

    # Step 3: Analyzing Numerical Variables 

    # Graphically 

plot_num(diet)
ggsave("Analyzing Numerical Variables EDA.png", dpi = "print")

    # Quantitatively 

diet_profile = profiling_num(diet)
print(diet_profile)
    
    # Saving the profiling result as a CSV file to place within report 

write.csv(diet_profile, file = "Diet_profile.csv", row.names = FALSE)

    # Analyzing Numerical and Categorical Variables Simultaneously 

library(Hmisc)
describe(diet)

# SECTION 2: Dealing with Missingness

