# *****************************************************************************
# Lab 2: Exploratory Data Analysis ----
#
# Course Code: BBT4206
# Course Name: Business Intelligence II
# Semester Duration: 21st August 2023 to 28th November 2023
#
# Lecturer: Allan Omondi
# Contact: aomondi [at] strathmore.edu
#
# Note: The lecture contains both theory and practice. This file forms part of
#       the practice. It has required lab work submissions that are graded for
#       coursework marks.
#
# License: GNU GPL-3.0-or-later
# See LICENSE file for licensing information.
# *****************************************************************************
#
# STEP 1. Install and use renv ----
# **Initialization: Install and use renv ----
# The renv package helps you create reproducible environments for your R
# projects. This is helpful when working in teams because it makes your R
# projects more isolated, portable and reproducible.

# Further reading:
#   Summary: https://rstudio.github.io/renv/
#   More detailed article: https://rstudio.github.io/renv/articles/renv.html

# Install renv:
if (!is.element("renv", installed.packages()[, 1])) {
  install.packages("renv", dependencies = TRUE)
}
require("renv")

# Use renv::init() to initialize renv in a new or existing project.

# The prompt received after executing renv::init() is as shown below:
# This project already has a lockfile. What would you like to do?

# 1: Restore the project from the lockfile.
# 2: Discard the lockfile and re-initialize the project.
# 3: Activate the project without snapshotting or installing any packages.
# 4: Abort project initialization.

# Select option 1 to restore the project from the lockfile
renv::init()

# This will set up a project library, containing all the packages you are
# currently using. The packages (and all the metadata needed to reinstall
# them) are recorded into a lockfile, renv.lock, and a .Rprofile ensures that
# the library is used every time you open that project.

# This can also be configured using the RStudio GUI when you click the project
# file, e.g., "BBT4206-R.Rproj" in the case of this project. Then
# navigate to the "Environments" tab and select "Use renv with this project".

# As you continue to work on your project, you can install and upgrade
# packages, using either:
# install.packages() and update.packages or
# renv::install() and renv::update()

# You can also clean up a project by removing unused packages using the
# following command: renv::clean()

# After you have confirmed that your code works as expected, use
# renv::snapshot() to record the packages and their
# sources in the lockfile.

# Later, if you need to share your code with someone else or run your code on
# a new machine, your collaborator (or you) can call renv::restore() to
# reinstall the specific package versions recorded in the lockfile.

# Execute the following code to reinstall the specific package versions
# recorded in the lockfile:
renv::restore()

# One of the packages required to use R in VS Code is the "languageserver"
# package. It can be installed manually as follows if you are not using the
# renv::restore() command.
if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")

# Loading Datasets ----
## STEP 2: Download sample datasets ----
# Create a folder called "data" and store the following 2 files inside the
# "data" folder:


## STEP 3. Load the downloaded sample datasets ----
# Load the datasets

library(readxl)
Student_Perfomance_Dataset <- read_excel("data/Student Perfomance Dataset.xlsx")
View(Student_Perfomance_Dataset)


## STEP 4. Load sample datasets that are provided as part of a package ----
if (!is.element("mlbench", installed.packages()[, 1])) {
  install.packages("mlbench", dependencies = TRUE)
}
require("mlbench")


# Dimensions ----
## STEP 5. Preview the Loaded Datasets ----
# Dimensions refer to the number of observations (rows) and the number of
# attributes/variables/features (columns). Execute the following commands to
# display the dimensions of your datasets:

dim(Student_Perfomance_Dataset)


# Data Types ----
## STEP 6. Identify the Data Types ----
# Knowing the data types will help you to identify the most appropriate
# visualization types and algorithms that can be applied. It can also help you
# to identify the need to convert from categorical data (factors) to integers
# or vice versa where necessary. Execute the following command to identify the
# data types:
sapply(Student_Perfomance_Dataset, class)


# Descriptive Statistics ----

# You must first understand your data before you can use it to design
# prediction models and to make generalizable inferences. It is not until you
# take the time to truly understand your dataset that you can fully comprehend
# the context of the results you achieve. This understanding can be done using
# descriptive statistics such as:

# 1. Measures of frequency
# (e.g., count, percent)

# 2. Measures of central tendency
# (e.g., mean, median, mode)
# Further reading: https://www.scribbr.com/statistics/central-tendency/

# 3. Measures of distribution/dispersion/spread/scatter/variability
# (e.g., range, quartiles, interquartile range, standard deviation, variance,
# kurtosis, skewness)
# Further reading: https://www.scribbr.com/statistics/variability/
# Further reading:
#   https://digitaschools.com/descriptive-statistics-skewness-and-kurtosis/
# Further reading: https://www.scribbr.com/statistics/skewness/

# 4. Measures of relationship
# (e.g., covariance, correlation, ANOVA)

# Further reading: https://www.k2analytics.co.in/covariance-and-correlation/
# Further reading: https://www.scribbr.com/statistics/one-way-anova/
# Further reading: https://www.scribbr.com/statistics/two-way-anova/

# Understanding your data can lead to:
# (i)	  Data cleaning: Removing bad data or imputing missing data.
# (ii)	Data transformation: Reduce the skewness by applying the same function
#       to all the observations.
# (iii)	Data modelling: You may notice properties of the data such as
#       distributions or data types that suggest the use (or not) of
#       specific algorithms.

## Measures of Frequency ----

### STEP 7. Identify the number of instances that belong to each class. ----
# It is more sensible to count categorical variables (factors or dimensions)
# than numeric variables, e.g., counting the number of male and female
# participants instead of counting the frequency of each participant’s height.
Student_Perfomance_Dataset_freq <- Student_Perfomance_Dataset$mentor
cbind(frequency = table(Student_Perfomance_Dataset_freq),
      percentage = prop.table(table(Student_Perfomance_Dataset_freq)) * 100)

Student_Perfomance_Dataset_freq <- Student_Perfomance_Dataset$`Attendance Waiver Granted: 1 = Yes, 0 = No`
cbind(frequency = table(Student_Perfomance_Dataset_freq),
      percentage = prop.table(table(Student_Perfomance_Dataset_freq)) * 100)



## Measures of Central Tendency ----
### STEP 8. Calculate the mode ----
# Unfortunately, R does not have an in-built function for calculating the mode.
# We, therefore, must manually create a function that can calculate the mode.

Student_Perfomance_Dataset_mode <- names(table(Student_Perfomance_Dataset$mentor))[
  which(table(Student_Perfomance_Dataset$mentor) == max(table(Student_Perfomance_Dataset$mentor)))
]
print(Student_Perfomance_Dataset_mode)

Student_Perfomance_Dataset_mode <- names(table(Student_Perfomance_Dataset$`Attendance Waiver Granted: 1 = Yes, 0 = No`))[
  which(table(Student_Perfomance_Dataset$`Attendance Waiver Granted: 1 = Yes, 0 = No`) == max(table(Student_Perfomance_Dataset$`Attendance Waiver Granted: 1 = Yes, 0 = No`)))
]
print(Student_Perfomance_Dataset_mode)



## Measures of Distribution/Dispersion/Spread/Scatter/Variability ----

### STEP 9. Measure the distribution of the data for each variable ----
summary(Student_Perfomance_Dataset)


# Step 10. Measure the standard deviation of each numeric variable while excluding non-numeric columns (factors and strings)

# Filter out the numeric columns
numeric_columns <- Student_Perfomance_Dataset[, sapply(Student_Perfomance_Dataset, is.numeric)]

# Calculate the standard deviation for each numeric column
standard_deviations <- sapply(numeric_columns, sd)

# Display the standard deviations
print(standard_deviations)


### STEP 11. Measure the variance of each variable ----


# Filter out the numeric columns
numeric_columns <- Student_Perfomance_Dataset[, sapply(Student_Perfomance_Dataset, is.numeric)]

# Calculate the variance for each numeric column
variances <- sapply(numeric_columns, var)

# Display the variances
print(variances)


### STEP 12. Measure the kurtosis of each variable ----
# The Kurtosis informs you of how often outliers occur in the results.

# There are different formulas for calculating kurtosis.
# Specifying “type = 2” allows us to use the 2nd formula which is the same
# kurtosis formula used in SPSS and SAS. More details about any function can be
# obtained by searching the R help knowledge base. The knowledge base says:

# In “type = 2” (used in SPSS and SAS):
# 1.	Kurtosis < 3 implies a low number of outliers
# 2.	Kurtosis = 3 implies a medium number of outliers
# 3.	Kurtosis > 3 implies a high number of outliers

if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")

sapply(Student_Perfomance_Dataset[, 26],  kurtosis, type = 2)


### STEP 13. Measure the skewness of each variable ----

# The skewness informs you of the asymmetry of the distribution of results.
# Similar to kurtosis, there are several ways of computing the skewness.
# Using “type = 2” can be interpreted as:

# 1.	Skewness between -0.4 and 0.4 (inclusive) implies that there is no skew
# in the distribution of results; the distribution of results is symmetrical;
# it is a normal distribution.
# 2.	Skewness above 0.4 implies a positive skew; a right-skewed distribution.
# 3.	Skewness below -0.4 implies a negative skew; a left-skewed distribution.

sapply(Student_Perfomance_Dataset[, 26],  skewness, type = 2)



## Measures of Relationship ----

## STEP 14. Measure the covariance between variables ----
# Note that the covariance and the correlation are computed for numeric values
# only, not categorical values.
Student_Perfomance_Dataset_cov <- cov(Student_Perfomance_Dataset[, -27])
View(Student_Perfomance_Dataset_cov)


## STEP 15. Measure the correlation between variables ----
Student_Perfomance_Dataset_cor <- cor(Student_Perfomance_Dataset [, c(1, 23, 26)])
View(Student_Perfomance_Dataset)


# Inferential Statistics ----
# Read the following article:
#   https://www.scribbr.com/statistics/inferential-statistics/
# Statistical tests (either for comparison, correlation, or regression) can be
# used to conduct *hypothesis testing*.

## Parametric versus Non-Parametric Statistical Tests ----
# If all the 3 points below are true, then
# use parametric tests, else use non-parametric tests.
# (i)	  the population that the sample comes from follows a normal distribution
#       of scores
# (ii)  the sample size is large enough to represent the population
# (iii) the variances of each group being compared are similar

## Statistical tests for comparison ----
# (i)	  t Test: parametric; compares means; uses 2 samples.
# (ii)	ANOVA: parametric; compares means; can use more than 3 samples.
# (iii)	Mood’s median: non-parametric; compares medians; can use more than 2
#       samples.
# (iv)	Wilcoxon signed-rank: non-parametric; compares distributions; uses 2
#       samples.
# (v)	  Wilcoxon rank-sum (Mann-Whitney U): non-parametric; compares sums of
#       rankings; uses 2 samples.
# (vi)	Kruskal-Wallis H: non-parametric; compares mean rankings; can use more
#       than 3 samples.

## Statistical tests for correlation ----
# (i)	  Pearson’s r: parametric; expects interval/ratio variables.
# (ii)	Spearman’s r: non-parametric; expects ordinal/interval/ratio variables.
# (iii)	Chi square test of independence: non-parametric; nominal/ordinal
#       variables.

## Statistical tests for regression ----
# (i)	  Simple linear regression: predictor is 1 interval/ratio variable;
#       outcome is 1 interval/ratio variable.
# (ii)	Multiple linear regression: predictor can be more than 2 interval/ratio
#       variables; outcome is 1 interval/ratio variable.
# (iii)	Logistic regression: predictor is 1 variable (any type); outcome is 1
#       binary variable.
# (iv)	Nominal regression: predictor can be more than 1 variable; outcome is 1
#       nominal variable.
# (v)	  Ordinal regression: predictor can be more than 1 variable; outcome is 1
#       ordinal variable.

## STEP 16. Perform ANOVA on the “crop_dataset” dataset ----
# ANOVA (Analysis of Variance) is a statistical test used to estimate how a
# quantitative dependent variable changes according to the levels of one or
# more categorical independent variables.

# The null hypothesis (H0) of the ANOVA is that
# “there is no difference in means”, and
# the alternative hypothesis (Ha) is that
# “the means are different from one another”.

# We can use the “aov()” function in R to calculate the test statistic for
# ANOVA. The test statistic is in turn used to calculate the p-value of your
# results. A p-value is a number that describes how likely you are to have
# found a particular set of observations if the null hypothesis were true. The
# smaller the p-value, the more likely you are to reject the null-hypothesis.


# Dependent variable:	GRADE
# Independent variables:	gender


Student_Perfomance_Dataset_one_way_anova <- aov(gender ~ GRADE, data = Student_Perfomance_Dataset)
summary(Student_Perfomance_Dataset_one_way_anova)




# Qualitative Data Analysis ----
# This can be done through either
# thematic analysis:
#   https://www.scribbr.com/methodology/thematic-analysis/ or
# critical discourse analysis:
#   https://www.scribbr.com/methodology/discourse-analysis/

# Basic Visualization for Understanding the Dataset ----

# Note: If you are using R Studio, ensure that the "Plots" window on the bottom
# right of R Studio has enough space to display the chart.

# The fastest way to improve your understanding of the dataset is to visualize
# it. Visualization can help you to spot outliers and give you an idea of
# possible data transformations you can apply. The basic visualizations to
# understand your dataset can be univariate visualizations (helps you to
# understand a single attribute) or multivariate visualizations (helps you to
# understand the interaction between attributes). Packages used to create
# visualizations include:
# (i)	  Graphics package: Used to quickly create basic plots of data. This is
#       the most appropriate to quickly understand the dataset before
#       conducting further analysis.
# (ii)  Lattice package: Used to create more visually appealing plots of data.
# (iii) ggplot2 package: Used to create even more visually appealing plots of
#       data that can then be used to present the analysis results to the
#       intended users. Given its complexity, it is not necessary to use
#       ggplot2 to have a basic understanding of the dataset prior to further
#       analysis.

# Note that the goal at this point is to understand your data, not to create
# visually appealing plots that are publicly shared. The visually appealing
# plots will be created much later after the best prediction model has been
# chosen.

## Univariate Plots ----
### STEP 17. Create Histograms for Each Numeric Attribute ----
# Histograms help in determining whether an attribute has a Gaussian
# distribution. They can also be used to identify the presence of outliers.


# Set the layout for the histograms
par(mfrow = c(1, ncol(Student_Perfomance_Dataset)))

# Loop through each numeric column and create a histogram
for (i in 1:ncol(Student_Perfomance_Dataset)) {
  if (is.numeric(Student_Perfomance_Dataset[, i])) {
    hist(Student_Perfomance_Dataset[, i], main = names(Student_Perfomance_Dataset)[i])
  }
}

### STEP 18. Create Box and Whisker Plots for Each Numeric Attribute ----
# Box and whisker plots are useful in understanding the distribution of data.
# Further reading: https://www.scribbr.com/statistics/interquartile-range/

# Create box and whisker plots for numeric attributes
par(mfrow = c(1, 3))
numeric_cols <- sapply(Student_Perfomance_Dataset, is.numeric)

for (i in 1:ncol(Student_Perfomance_Dataset)) {
  if (numeric_cols[i]) {
    boxplot(Student_Perfomance_Dataset[, i], main = names(Student_Perfomance_Dataset)[i])
  }
}

### STEP 19. Create Bar Plots for Each Categorical Attribute ----
# Categorical attributes (factors) can also be visualized. This is done using a
# bar chart to give an idea of the proportion of instances that belong to each
# category.

# Load necessary libraries (if not already loaded)
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# Create a bar plot for "Absenteeism_percentage"
ggplot(Student_Perfomance_Dataset, aes(x = factor(round(`Absenteeism Percentage`, 2)))) +
  geom_bar() +
  labs(title = "Absenteeism Percentage", x = "Percentage", y = "Count") +
  theme_minimal()

# Create a bar plot for "Grade"
ggplot(Student_Perfomance_Dataset, aes(x = GRADE)) +
  geom_bar() +
  labs(title = "Grade Distribution", x = "GRADE", y = "Count") +
  theme_minimal()


### STEP 20. Create a Missingness Map to Identify Missing Data ----
# Some machine learning algorithms cannot handle missing data. A missingness
# map (also known as a missing plot) can be used to get an idea of the amount
# missing data in the dataset. The x-axis of the missingness map shows the
# attributes of the dataset whereas the y-axis shows the instances in the
# dataset.
# Horizontal lines indicate missing data for an instance whereas vertical lines
# indicate missing data for an attribute. The missingness map requires the
# “Amelia” package.

# Execute the following to create a map to identify the missing data in each

if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

missmap(Student_Perfomance_Dataset, col = c("red", "grey"), legend = TRUE)

## Multivariate Plots ----

### STEP 21. Create a Correlation Plot ----
# Correlation plots can be used to get an idea of which attributes change
# together. The function “corrplot()” found in the package “corrplot” is
# required to perform this. The larger the dot in the correlation plot, the
# larger the correlation. Blue represents a positive correlation whereas red
# represents a negative correlation.

# Install and load the necessary packages
if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
library(corrplot)
library(ggcorrplot)

# Create correlation plots for your datasets

# Using corrplot
corrplot(cor(Student_Perfomance_Dataset[, sapply(Student_Perfomance_Dataset, is.numeric)]), method = "circle")

# Using ggcorrplot for a visually appealing plot
ggcorrplot(cor(Student_Perfomance_Dataset[, sapply(Student_Perfomance_Dataset, is.numeric)]))


### STEP 22. Create a Scatter Plot ----

if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE)
}
library(ggplot2)

ggplot(Student_Perfomance_Dataset, aes(x = `Absenteeism Percentage`, y = GRADE)) +
  geom_point() + geom_smooth(method = lm)



### STEP 23. Create Multivariate Box and Whisker Plots by Class ----
# This applies to datasets where the target (dependent) variable is categorical.
# Execute the following code:
if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")

featurePlot(x = Student_Perfomance_Dataset[, 23], y = Student_Perfomance_Dataset[, 26], plot = "box")



# **Deinitialization: Create a snapshot of the R environment ----
# Lastly, as a follow-up to the initialization step, record the packages
# installed and their sources in the lockfile so that other team-members can
# use renv::restore() to re-install the same package version in their local
# machine during their initialization step.
renv::snapshot()

# References ----
## Bevans, R. (2023a). ANOVA in R | A Complete Step-by-Step Guide with Examples. Scribbr. Retrieved August 24, 2023, from https://www.scribbr.com/statistics/anova-in-r/ # nolint ----

## Bevans, R. (2023b). Sample Crop Data Dataset for ANOVA (Version 1) [Dataset]. Scribbr. https://www.scribbr.com/wp-content/uploads//2020/03/crop.data_.anova_.zip # nolint ----

## Fisher, R. A. (1988). Iris [Dataset]. UCI Machine Learning Repository. https://archive.ics.uci.edu/dataset/53/iris # nolint ----

## National Institute of Diabetes and Digestive and Kidney Diseases. (1999). Pima Indians Diabetes Dataset [Dataset]. UCI Machine Learning Repository. https://www.kaggle.com/datasets/uciml/pima-indians-diabetes-database # nolint ----

## StatLib CMU. (1997). Boston Housing [Dataset]. StatLib Carnegie Mellon University. http://lib.stat.cmu.edu/datasets/boston_corrected.txt # nolint ----


# **Required Lab Work Submission** ----

# NOTE: The lab work should be done in groups of between 2 and 5 members using
#       Git and GitHub.

## Part A ----
# Create a new file called "Lab2-Submission-ExploratoryDataAnalysis.R".
# Provide all the code you have used to perform an exploratory data analysis of
# the "Class Performance Dataset" provided on the eLearning platform.

## Part B ----
# Upload *the link* to your "Lab2-Submission-ExploratoryDataAnalysis.R" hosted
# on Github (do not upload the .R file itself) through the submission link
# provided on eLearning.

## Part C ----
# Create a markdown file called "Lab-Submission-Markdown.Rmd"
# and place it inside the folder called "markdown". Use R Studio to ensure the
# .Rmd file is based on the "GitHub Document (Markdown)" template when it is
# being created.

# Refer to the following file in Lab 1 for an example of a .Rmd file based on
# the "GitHub Document (Markdown)" template:
#     https://github.com/course-files/BBT4206-R-Lab1of15-LoadingDatasets/blob/main/markdown/BIProject-Template.Rmd # nolint

# Include Line 1 to 14 of BIProject-Template.Rmd in your .Rmd file to make it
# displayable on GitHub when rendered into its .md version

# It should have code chunks that explain only *the most significant*
# analysis performed on the dataset.

# The emphasis should be on Explanatory Data Analysis (explains the key
# statistics performed on the dataset) as opposed to
# Exploratory Data Analysis (presents ALL the statistics performed on the
# dataset). Exploratory Data Analysis that presents ALL the possible statistics
# re-creates the problem of information overload.

## Part D ----
# Render the .Rmd (R markdown) file into its .md (markdown) version by using
# knitR in RStudio.
# Documentation of knitR: https://www.rdocumentation.org/packages/knitr/

# Upload *the link* to "Lab-Submission-Markdown.md" (not .Rmd)
# markdown file hosted on Github (do not upload the .Rmd or .md markdown files)
# through the submission link provided on eLearning.