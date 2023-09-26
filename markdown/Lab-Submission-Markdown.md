Business Intelligence Lab Submission Markdown
================
<Specify your name here>
<Specify the date when you submitted the lab>

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [\<Provide an Appropriate Title
  Here\>](#provide-an-appropriate-title-here)
  - [\<You Can Have a Sub-Title Here\>](#you-can-have-a-sub-title-here)

# Student Details

<table>
<colgroup>
<col style="width: 35%" />
<col style="width: 64%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Student ID Numbers and Names of Group Members</strong></td>
<td><p>&lt;list one student name and ID per line; you should be between
2 and 5 members per group&gt;</p>
<p>1.122998-Starfield-Glenn Oloo</p>
<p>2.134782-Starfield-Yasmin Choma</p>
<p>3.134783-Starfield- Moses Mbugua</p></td>
</tr>
<tr class="even">
<td><strong>BBIT 4.2 Group</strong></td>
<td>&lt;either group A, B, or C&gt;</td>
</tr>
<tr class="odd">
<td><strong>Course Code</strong></td>
<td>BBT4206</td>
</tr>
<tr class="even">
<td><strong>Course Name</strong></td>
<td>Business Intelligence II</td>
</tr>
<tr class="odd">
<td><strong>Program</strong></td>
<td>Bachelor of Business Information Technology</td>
</tr>
<tr class="even">
<td><strong>Semester Duration</strong></td>
<td>21<sup>st</sup> August 2023 to 28<sup>th</sup> November 2023</td>
</tr>
</tbody>
</table>

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults:  
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE,                        collapse = FALSE, tidy = TRUE)`.

> output:  
>   
> github_document:  
> toc: yes  
> toc_depth: 4  
> fig_width: 6  
> fig_height: 4  
> df_print: default  
>   
> editor_options:  
> chunk_output_type: console

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

# \<Provide an Appropriate Title Here\>

Describe the code chunk here:

\`\`\`{library(readxl)} Student_Perfomance_Dataset \<-
readxl::read_excel(“data/Student Perfomance Dataset.xlsx”)

View(Student_Perfomance_Dataset)



    ```r
    # Load the dataset from an Excel file
    library(readxl)
    Student_Perfomance_Dataset <- read_excel("data/Student Perfomance Dataset.xlsx")

Describe the next code chunk here:

``` r
library(readr)
sapply(Student_Perfomance_Dataset, class)
```

    ##                                                          gender 
    ##                                                       "numeric" 
    ##                                                          mentor 
    ##                                                       "numeric" 
    ##                                Average Course Evaluation Rating 
    ##                                                       "numeric" 
    ##               Average Pedagogical Strategy Effectiveness Rating 
    ##                                                       "numeric" 
    ##                                Project: Section 1-4: (20%) x/10 
    ##                                                       "numeric" 
    ##                               Project: Section 5-11: (50%) x/10 
    ##                                                       "numeric" 
    ##                                  Project: Section 12: (30%) x/5 
    ##                                                       "numeric" 
    ##                                Project: (10%): x/30 x 100 TOTAL 
    ##                                                       "numeric" 
    ##                         Quiz 1 on Concept 1 (Introduction) x/32 
    ##                                                       "numeric" 
    ##                               Quiz 3 on Concept 3 (Linear) x/15 
    ##                                                       "numeric" 
    ##                           Quiz 4 on Concept 4 (Non-Linear) x/22 
    ##                                                       "numeric" 
    ##                         Quiz 5 on Concept 5 (Dashboarding) x/10 
    ##                                                       "numeric" 
    ##                 Quizzes and  Bonus Marks (7%): x/79 x 100 TOTAL 
    ##                                                       "numeric" 
    ##                   Lab 1 - 2.c. - (Simple Linear Regression) x/5 
    ##                                                       "numeric" 
    ##  Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5 
    ##                                                       "numeric" 
    ## Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                       "numeric" 
    ##               Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                       "numeric" 
    ##                            Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                       "numeric" 
    ##                                        Lab Work (7%) x/25 x 100 
    ##                                                       "numeric" 
    ##                                          CAT 1 (8%): x/38 x 100 
    ##                                                       "numeric" 
    ##                                         CAT 2 (8%): x/100 x 100 
    ##                                                       "numeric" 
    ##                      Attendance Waiver Granted: 1 = Yes, 0 = No 
    ##                                                       "numeric" 
    ##                                          Absenteeism Percentage 
    ##                                                       "numeric" 
    ##                                    Coursework TOTAL: x/40 (40%) 
    ##                                                       "numeric" 
    ##                                                EXAM: x/60 (60%) 
    ##                                                       "numeric" 
    ##                          TOTAL = Coursework TOTAL + EXAM (100%) 
    ##                                                       "numeric" 
    ##                                                           GRADE 
    ##                                                     "character"

## \<You Can Have a Sub-Title Here\>

``` r
Student_Perfomance_Dataset_freq <- Student_Perfomance_Dataset$mentor
cbind(frequency = table(Student_Perfomance_Dataset_freq), percentage = prop.table(table(Student_Perfomance_Dataset_freq)) *
    100)
```

    ##   frequency percentage
    ## 0        59         59
    ## 1        41         41

``` r
Student_Perfomance_Dataset_freq <- Student_Perfomance_Dataset$`Attendance Waiver Granted: 1 = Yes, 0 = No`
cbind(frequency = table(Student_Perfomance_Dataset_freq), percentage = prop.table(table(Student_Perfomance_Dataset_freq)) *
    100)
```

    ##   frequency percentage
    ## 0        96  95.049505
    ## 1         5   4.950495

``` r
library(readr)
Student_Perfomance_Dataset_mode <- names(table(Student_Perfomance_Dataset$mentor))[which(table(Student_Perfomance_Dataset$mentor) ==
    max(table(Student_Perfomance_Dataset$mentor)))]
print(Student_Perfomance_Dataset_mode)
```

    ## [1] "0"

``` r
Student_Perfomance_Dataset_mode <- names(table(Student_Perfomance_Dataset$`Attendance Waiver Granted: 1 = Yes, 0 = No`))[which(table(Student_Perfomance_Dataset$`Attendance Waiver Granted: 1 = Yes, 0 = No`) ==
    max(table(Student_Perfomance_Dataset$`Attendance Waiver Granted: 1 = Yes, 0 = No`)))]
print(Student_Perfomance_Dataset_mode)
```

    ## [1] "0"

``` r
library(readr)
summary(Student_Perfomance_Dataset)
```

    ##      gender           mentor     Average Course Evaluation Rating
    ##  Min.   :0.0000   Min.   :0.00   Min.   :2.909                   
    ##  1st Qu.:0.0000   1st Qu.:0.00   1st Qu.:4.273                   
    ##  Median :1.0000   Median :0.00   Median :4.545                   
    ##  Mean   :0.5743   Mean   :0.41   Mean   :4.531                   
    ##  3rd Qu.:1.0000   3rd Qu.:1.00   3rd Qu.:4.909                   
    ##  Max.   :1.0000   Max.   :1.00   Max.   :5.000                   
    ##                   NA's   :1      NA's   :1                       
    ##  Average Pedagogical Strategy Effectiveness Rating
    ##  Min.   :3.182                                    
    ##  1st Qu.:4.068                                    
    ##  Median :4.545                                    
    ##  Mean   :4.432                                    
    ##  3rd Qu.:4.909                                    
    ##  Max.   :5.000                                    
    ##  NA's   :1                                        
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##                                                                    
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.015                  Mean   : 62.39                  
    ##  3rd Qu.:1.250                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  NA's   :1                                                      
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 3.00                    
    ##  1st Qu.:11.53                           1st Qu.: 7.00                    
    ##  Median :15.33                           Median : 9.00                    
    ##  Mean   :16.36                           Mean   : 9.53                    
    ##  3rd Qu.:19.63                           3rd Qu.:12.00                    
    ##  Max.   :31.25                           Max.   :15.00                    
    ##                                          NA's   :2                        
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 3.00                         Min.   : 0.000                         
    ##  1st Qu.:10.91                         1st Qu.: 5.000                         
    ##  Median :13.50                         Median : 6.330                         
    ##  Mean   :13.94                         Mean   : 6.367                         
    ##  3rd Qu.:17.50                         3rd Qu.: 8.000                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##  NA's   :6                             NA's   :12                             
    ##  Quizzes and  Bonus Marks (7%): x/79 x 100 TOTAL
    ##  Min.   :26.26                                  
    ##  1st Qu.:43.82                                  
    ##  Median :55.31                                  
    ##  Mean   :56.22                                  
    ##  3rd Qu.:65.16                                  
    ##  Max.   :95.25                                  
    ##                                                 
    ##  Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :3.000                                
    ##  1st Qu.:5.000                                
    ##  Median :5.000                                
    ##  Mean   :4.898                                
    ##  3rd Qu.:5.000                                
    ##  Max.   :5.000                                
    ##  NA's   :3                                    
    ##  Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5
    ##  Min.   :2.150                                                 
    ##  1st Qu.:3.150                                                 
    ##  Median :4.850                                                 
    ##  Mean   :4.166                                                 
    ##  3rd Qu.:5.000                                                 
    ##  Max.   :5.000                                                 
    ##  NA's   :6                                                     
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :2.85                                                   
    ##  1st Qu.:4.85                                                   
    ##  Median :4.85                                                   
    ##  Mean   :4.63                                                   
    ##  3rd Qu.:4.85                                                   
    ##  Max.   :5.00                                                   
    ##  NA's   :9                                                      
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :1.850                                    
    ##  1st Qu.:4.100                                    
    ##  Median :4.850                                    
    ##  Mean   :4.425                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  NA's   :18                                       
    ##  Lab 5 - Chart JS Dashboard Setup x/5 Lab Work (7%) x/25 x 100
    ##  Min.   :0.000                        Min.   : 17.80          
    ##  1st Qu.:0.000                        1st Qu.: 70.80          
    ##  Median :5.000                        Median : 80.00          
    ##  Mean   :3.404                        Mean   : 79.72          
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20          
    ##  Max.   :5.000                        Max.   :100.00          
    ##                                                               
    ##  CAT 1 (8%): x/38 x 100 CAT 2 (8%): x/100 x 100
    ##  Min.   :32.89          Min.   :  0.00         
    ##  1st Qu.:59.21          1st Qu.: 51.00         
    ##  Median :69.73          Median : 63.50         
    ##  Mean   :69.39          Mean   : 62.13         
    ##  3rd Qu.:82.89          3rd Qu.: 81.75         
    ##  Max.   :97.36          Max.   :100.00         
    ##  NA's   :4              NA's   :31             
    ##  Attendance Waiver Granted: 1 = Yes, 0 = No Absenteeism Percentage
    ##  Min.   :0.00000                            Min.   : 0.00         
    ##  1st Qu.:0.00000                            1st Qu.: 7.41         
    ##  Median :0.00000                            Median :14.81         
    ##  Mean   :0.04951                            Mean   :15.42         
    ##  3rd Qu.:0.00000                            3rd Qu.:22.22         
    ##  Max.   :1.00000                            Max.   :51.85         
    ##                                                                   
    ##  Coursework TOTAL: x/40 (40%) EXAM: x/60 (60%)
    ##  Min.   : 7.47                Min.   : 5.00   
    ##  1st Qu.:20.44                1st Qu.:26.00   
    ##  Median :24.58                Median :34.00   
    ##  Mean   :24.53                Mean   :33.94   
    ##  3rd Qu.:29.31                3rd Qu.:42.00   
    ##  Max.   :35.08                Max.   :56.00   
    ##                               NA's   :4       
    ##  TOTAL = Coursework TOTAL + EXAM (100%)    GRADE          
    ##  Min.   : 7.47                          Length:101        
    ##  1st Qu.:45.54                          Class :character  
    ##  Median :58.69                          Mode  :character  
    ##  Mean   :57.12                                            
    ##  3rd Qu.:68.83                                            
    ##  Max.   :87.72                                            
    ## 

``` r
library(readr)

numeric_columns <- Student_Perfomance_Dataset[, sapply(Student_Perfomance_Dataset,
    is.numeric)]
standard_deviations <- sapply(numeric_columns, sd)
print(standard_deviations)
```

    ##                                                          gender 
    ##                                                       0.4969212 
    ##                                                          mentor 
    ##                                                              NA 
    ##                                Average Course Evaluation Rating 
    ##                                                              NA 
    ##               Average Pedagogical Strategy Effectiveness Rating 
    ##                                                              NA 
    ##                                Project: Section 1-4: (20%) x/10 
    ##                                                       2.1018040 
    ##                               Project: Section 5-11: (50%) x/10 
    ##                                                       2.7890284 
    ##                                  Project: Section 12: (30%) x/5 
    ##                                                              NA 
    ##                                Project: (10%): x/30 x 100 TOTAL 
    ##                                                      20.1517428 
    ##                         Quiz 1 on Concept 1 (Introduction) x/32 
    ##                                                       6.5052771 
    ##                               Quiz 3 on Concept 3 (Linear) x/15 
    ##                                                              NA 
    ##                           Quiz 4 on Concept 4 (Non-Linear) x/22 
    ##                                                              NA 
    ##                         Quiz 5 on Concept 5 (Dashboarding) x/10 
    ##                                                              NA 
    ##                 Quizzes and  Bonus Marks (7%): x/79 x 100 TOTAL 
    ##                                                      16.4938796 
    ##                   Lab 1 - 2.c. - (Simple Linear Regression) x/5 
    ##                                                              NA 
    ##  Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5 
    ##                                                              NA 
    ## Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                              NA 
    ##               Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                              NA 
    ##                            Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                       2.3327203 
    ##                                        Lab Work (7%) x/25 x 100 
    ##                                                      19.3031268 
    ##                                          CAT 1 (8%): x/38 x 100 
    ##                                                              NA 
    ##                                         CAT 2 (8%): x/100 x 100 
    ##                                                              NA 
    ##                      Attendance Waiver Granted: 1 = Yes, 0 = No 
    ##                                                       0.2180017 
    ##                                          Absenteeism Percentage 
    ##                                                       9.0886796 
    ##                                    Coursework TOTAL: x/40 (40%) 
    ##                                                       6.2240076 
    ##                                                EXAM: x/60 (60%) 
    ##                                                              NA 
    ##                          TOTAL = Coursework TOTAL + EXAM (100%) 
    ##                                                      15.7253295

``` r
library(readr)
numeric_columns <- Student_Perfomance_Dataset[, sapply(Student_Perfomance_Dataset,
    is.numeric)]
variances <- sapply(numeric_columns, var)
print(variances)
```

    ##                                                          gender 
    ##                                                      0.24693069 
    ##                                                          mentor 
    ##                                                              NA 
    ##                                Average Course Evaluation Rating 
    ##                                                              NA 
    ##               Average Pedagogical Strategy Effectiveness Rating 
    ##                                                              NA 
    ##                                Project: Section 1-4: (20%) x/10 
    ##                                                      4.41758020 
    ##                               Project: Section 5-11: (50%) x/10 
    ##                                                      7.77867921 
    ##                                  Project: Section 12: (30%) x/5 
    ##                                                              NA 
    ##                                Project: (10%): x/30 x 100 TOTAL 
    ##                                                    406.09273663 
    ##                         Quiz 1 on Concept 1 (Introduction) x/32 
    ##                                                     42.31862986 
    ##                               Quiz 3 on Concept 3 (Linear) x/15 
    ##                                                              NA 
    ##                           Quiz 4 on Concept 4 (Non-Linear) x/22 
    ##                                                              NA 
    ##                         Quiz 5 on Concept 5 (Dashboarding) x/10 
    ##                                                              NA 
    ##                 Quizzes and  Bonus Marks (7%): x/79 x 100 TOTAL 
    ##                                                    272.04806537 
    ##                   Lab 1 - 2.c. - (Simple Linear Regression) x/5 
    ##                                                              NA 
    ##  Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5 
    ##                                                              NA 
    ## Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                              NA 
    ##               Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                              NA 
    ##                            Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                      5.44158416 
    ##                                        Lab Work (7%) x/25 x 100 
    ##                                                    372.61070416 
    ##                                          CAT 1 (8%): x/38 x 100 
    ##                                                              NA 
    ##                                         CAT 2 (8%): x/100 x 100 
    ##                                                              NA 
    ##                      Attendance Waiver Granted: 1 = Yes, 0 = No 
    ##                                                      0.04752475 
    ##                                          Absenteeism Percentage 
    ##                                                     82.60409695 
    ##                                    Coursework TOTAL: x/40 (40%) 
    ##                                                     38.73827016 
    ##                                                EXAM: x/60 (60%) 
    ##                                                              NA 
    ##                          TOTAL = Coursework TOTAL + EXAM (100%) 
    ##                                                    247.28598699

``` r
if (!is.element("e1071", installed.packages()[, 1])) {
    install.packages("e1071", dependencies = TRUE)
}
require("e1071")
```

    ## Loading required package: e1071

``` r
sapply(Student_Perfomance_Dataset[, 26], kurtosis, type = 2)
```

    ## TOTAL = Coursework TOTAL + EXAM (100%) 
    ##                              0.3814857

``` r
sapply(Student_Perfomance_Dataset[, 26], skewness, type = 2)
```

    ## TOTAL = Coursework TOTAL + EXAM (100%) 
    ##                             -0.4713841

``` r
Student_Perfomance_Dataset_cov <- cov(Student_Perfomance_Dataset[, -27])
View(Student_Perfomance_Dataset_cov)
```

``` r
Student_Perfomance_Dataset_cor <- cor(Student_Perfomance_Dataset[, c(1, 23, 26)])
View(Student_Perfomance_Dataset)
```

``` r
Student_Perfomance_Dataset_one_way_anova <- aov(gender ~ GRADE, data = Student_Perfomance_Dataset)
summary(Student_Perfomance_Dataset_one_way_anova)
```

    ##             Df Sum Sq Mean Sq F value Pr(>F)  
    ## GRADE        4   2.87  0.7174   3.156 0.0175 *
    ## Residuals   96  21.82  0.2273                 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# Set the layout for the histograms
par(mfrow = c(1, ncol(Student_Perfomance_Dataset)))

# Loop through each numeric column and create a histogram
for (i in 1:ncol(Student_Perfomance_Dataset)) {
    if (is.numeric(Student_Perfomance_Dataset[, i])) {
        hist(Student_Perfomance_Dataset[, i], main = names(Student_Perfomance_Dataset)[i])
    }
}
```

``` r
# Create box and whisker plots for numeric attributes
par(mfrow = c(1, 3))
numeric_cols <- sapply(Student_Perfomance_Dataset, is.numeric)

for (i in 1:ncol(Student_Perfomance_Dataset)) {
    if (numeric_cols[i]) {
        boxplot(Student_Perfomance_Dataset[, i], main = names(Student_Perfomance_Dataset)[i])
    }
}
```

![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-1.png)<!-- -->![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-2.png)<!-- -->![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-3.png)<!-- -->![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-4.png)<!-- -->![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-5.png)<!-- -->![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-6.png)<!-- -->![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-7.png)<!-- -->![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-8.png)<!-- -->![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Box%20and%20Whisker%20Plots%20-%20step%2018-9.png)<!-- -->

``` r
# Load necessary libraries (if not already loaded)
if (!require(ggplot2)) {
    install.packages("ggplot2")
    library(ggplot2)
}
```

    ## Loading required package: ggplot2

``` r
# Create a bar plot for 'Absenteeism_percentage'
ggplot(Student_Perfomance_Dataset, aes(x = factor(round(`Absenteeism Percentage`,
    2)))) + geom_bar() + labs(title = "Absenteeism Percentage", x = "Percentage",
    y = "Count") + theme_minimal()
```

![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Bar%20Plots%20for%20Each%20Categorical%20Attribute%20-%20step%2019-1.png)<!-- -->

``` r
# Create a bar plot for 'Grade'
ggplot(Student_Perfomance_Dataset, aes(x = GRADE)) + geom_bar() + labs(title = "Grade Distribution",
    x = "GRADE", y = "Count") + theme_minimal()
```

![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20Bar%20Plots%20for%20Each%20Categorical%20Attribute%20-%20step%2019-2.png)<!-- -->

``` r
if (!is.element("Amelia", installed.packages()[, 1])) {
    install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")
```

    ## Loading required package: Amelia

    ## Loading required package: Rcpp

    ## ## 
    ## ## Amelia II: Multiple Imputation
    ## ## (Version 1.8.1, built: 2022-11-18)
    ## ## Copyright (C) 2005-2023 James Honaker, Gary King and Matthew Blackwell
    ## ## Refer to http://gking.harvard.edu/amelia/ for more information
    ## ##

``` r
missmap(Student_Perfomance_Dataset, col = c("red", "grey"), legend = TRUE)
```

![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20a%20Missingness%20Map%20to%20Identify%20Missing%20Dat%20-%20step%2020-1.png)<!-- -->

``` r
# Install and load the necessary packages
if (!is.element("corrplot", installed.packages()[, 1])) {
    install.packages("corrplot", dependencies = TRUE)
}
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
    install.packages("ggcorrplot", dependencies = TRUE)
}
library(corrplot)
```

    ## corrplot 0.92 loaded

``` r
library(ggcorrplot)

# Create correlation plots for your datasets

# Using corrplot
corrplot(cor(Student_Perfomance_Dataset[, sapply(Student_Perfomance_Dataset, is.numeric)]),
    method = "circle")
```

![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20a%20Correlation%20Plot-%20step%2021-1.png)<!-- -->

``` r
# Using ggcorrplot for a visually appealing plot
ggcorrplot(cor(Student_Perfomance_Dataset[, sapply(Student_Perfomance_Dataset, is.numeric)]))
```

![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20a%20Correlation%20Plot-%20step%2021-2.png)<!-- -->

``` r
if (!is.element("ggplot2", installed.packages()[, 1])) {
    install.packages("ggplot2", dependencies = TRUE)
}
library(ggplot2)

ggplot(Student_Perfomance_Dataset, aes(x = `Absenteeism Percentage`, y = GRADE)) +
    geom_point() + geom_smooth(method = lm)
```

    ## `geom_smooth()` using formula = 'y ~ x'

![](Lab-Submission-Markdown_files/figure-gfm/code%20chunk%20-%20Used%20to%20create%20a%20scatter%20plot%20-%20step%2022-1.png)<!-- -->

``` r
# Execute the following code:
if (!is.element("caret", installed.packages()[, 1])) {
    install.packages("caret", dependencies = TRUE)
}
require("caret")
```

    ## Loading required package: caret

    ## Loading required package: lattice

``` r
featurePlot(x = Student_Perfomance_Dataset[, 23], y = Student_Perfomance_Dataset[,
    26], plot = "box")
```

    ## NULL
