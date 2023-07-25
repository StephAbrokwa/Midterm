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

status(diet) 

<<<<<<< HEAD
# this output shows that there are only missing values within the gender column
# within this report all NA values will be converted to a variable '2'which will be referred to as 'unidentified' in the report 
# these rows will be kept otherwise seeing as there is no alternate indication of missingness in the remaining columns 
=======
    # this output shows that there are only missing values within the gender column
    # within this report all NA values will be converted to a variable '2'which will be referred to as 'unidentified' in the report 
    # these rows will be kept otherwise seeing as there is no alternate indication of missingness in the remaining columns 
>>>>>>> bd3cc4f751d5ec8c4f156afbd93361ba0fa64eda

diet$gender <- ifelse(is.na(diet$gender), '2', diet$gender)
view(diet) # View the new dataset 
any(is.na(diet)) # Check if there are any remaining missing values within the dataset <- indicates FALSE (there are no longer any NA's found within this dataset)

freq(diet$gender)
ggsave("Actual Gender Frequency.png", dpi = "print") # Saved to my Midterm Project folder
<<<<<<< HEAD

# SECTION 3: New Column - 'Weight_Change' and New Subset 

    # Add a new column 'Weight_Change' to represent the change in weight of participants after the 6-week period 

diet$Weight_Change <- diet$pre.weight - diet$weight6weeks
View(diet) # View the new dataset 

# the independent variables that will be used in the analysis of the report are: gender, age, and diet
# a subset 'diet_subset' will be created that only includes these columns 

    # Determine the variables you intend to use in your analysis, and remove the rest 

diet_subset <- subset(diet, select = c(gender, Age, Diet, Weight_Change))
view(diet_subset) # View the data subset 
=======
>>>>>>> bd3cc4f751d5ec8c4f156afbd93361ba0fa64eda

# SECTION 3: New Column - 'Weight Change' 
