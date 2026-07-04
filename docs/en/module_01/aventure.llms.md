# Adventure 1 - Dive into data science

STT-1100 Introduction to Data Science

# How to pass this module

Welcome to this first data science adventure! This module is designed to provide you with a comprehensive introduction to the fundamental tools and concepts that will support you throughout your data science journey.

- **Read each section carefully** before proceeding with the experiment. Theoretical explanations provide the basis for understanding the practical examples.

- **Actively experiment** by running the proposed code and exploring the results. Feel free to modify the examples to test your ideas.

- **Ask questions** if you encounter difficulties or if certain concepts remain unclear.

This module is a gateway to the vast world of data science. Take the time to explore each step, and have fun learning!

Character card

Your role Early-stage student analyst

Main contact STT-1100 teaching team

Organization and context Introduction to data science course

Mission Prepare a first reproducible report with R, RStudio and Quarto

Data `UlavalSSD::MeteoQuebec`

Deliverable Short Quarto HTML report

# IT tools

In this course, we will use professional computing tools that are essential in data science. These tools allow data to be manipulated, analyzed and visualized in an efficient and reproducible manner. Here is an overview of the main tools that you will discover:

**RStudio**: An Integrated Development Environment (IDE) for R that makes it easy to write scripts, run code, and manage projects. It offers an intuitive interface and many professional features to help you structure your analyses.

**Quarto**: a powerful tool for producing reproducible documents that combine explanatory text, code and results. With Quarto, you can generate professional reports, presentations and even websites.

These tools are not limited to their technical aspect; they also promote good practices in data science, such as rigorous project organization, clear documentation and reproducibility of analyses. They will be your allies throughout this course and your future experiences in data science.

## Discovery of RStudio

RStudio is an integrated development environment (IDE) for R. It makes it easy to write, run, and manage projects in R, while integrating many professional features. Here is an overview of its main windows and functionalities:

### The main windows of RStudio

RStudio is made up of four main panels:

- **Console**: generally located at the bottom left, it allows you to directly execute commands in R.

- **Script**: at the top left, this is the place where you write and save your scripts (`.R` or `.qmd` files). You can notice that this adventure is indeed a `.qmd` in the script window.

- **Environment**: at the top right, it displays the objects currently available in memory (*datasets*, variables, functions).

- **Graph (*Plots*), files and help**: at the bottom right, this panel allows you to view your graphs, explore the project files, or access the documentation.

> **NOTE:**
>
> - **Test the console**: open the console and type the following command:
>
>   ``` r
>   print("Hello, RStudio!")
>   ```
>
>   Observe the result displayed directly in the console.
>
> - **Create a script**: Click `File > New File > R Script`, write the following code and run it with `Ctrl + Enter` (Windows/Linux) or `Cmd + Enter` (Mac):
>
>   ``` r
>   message("You are working in an R script!")
>   ```
>
>   Save the file under the name `test_script.R`.

### Important features

- **Projects**: RStudio organizes your work into projects, which is ideal for structuring your files and data. We will work on projects from the next module.

- **Integrated Terminal**: to execute system commands without leaving RStudio. We won’t use it for the moment but know that it exists.

- **Packages**: the “Packages” tab allows you to easily install and load libraries.

> **TIP:**
>
> Install the `dplyr` package using the GUI or via the following command in the console:
>
> ``` r
> install.packages("dplyr")
> ```
>
> Once installed, load it with:
>
> ``` r
> library(dplyr)
> ```

### Configure your environment

To get started efficiently, customize the preferences (`Tools > Global Options`) to adjust the appearance and settings according to your needs.

> **TIP:**
>
> - **Exploring options**: Access `Tools > Global Options` and explore the different possible configurations. Try changing the interface theme (e.g. dark theme) and see the difference.

## Basics of programming in R

R programming is essential for manipulating, analyzing and visualizing data. This section introduces you to the basics of programming and offers you exercises to practice.

### Create and manipulate objects

In R, everything is an object. Here are the basics for creating objects and manipulating them:

> **TIP:**
>
> - **Create an object**:
>
>   ``` r
>   x <- 42 # Assigns the value 42 to the object x
>   print(x) # Print the value of x
>   x # Also displays the value of x
>   ```
>
> - **Manipulate a vector**:
>
>   ``` r
>   vector <- c(1, 2, 3, 4, 5) # Creates a vector
>   sum <- sum(vector) # Calculates the sum of the elements
>   sum
>   ```
>
> - Create a vector containing the numbers 1 to 10 and calculate its average using the `sum()` function.

### Write conditions

Conditions allow you to make your scripts dynamic.

> **NOTE:**
>
> - **Simple condition**:
>
>   ``` r
>   number <- 10
>   if (number > 5) {
>     print("The number is greater than 5")
>   } else {
>     print("The number is less than or equal to 5")
>   }
>   ```

> **TIP:**
>
> - Write a condition that displays whether a number is even or odd.
>
> Hint: the `%%` function in R gives the remainder of the Euclidean division. For example `10%%2` is 0 because \\10=5\times2\\.

### Built-in basic functions

R has many built-in functions to perform simple or advanced calculations. For example, there is the `mean` function which, as its name suggests, allows you to calculate an average.

The following code block allows us to calculate the average of the vector `(1, 3, 5, 7)`.

``` r
x <- c(1, 3, 5, 7) # Defines the vector x
mean(x) # Call the mean function on x
```

    [1] 4

When you want help with a function, you can simply type the name of it in the help tab in the bottom right dial.

### Define a new function

R also allows us to define our own functions. We will do this several times in the course. Here is a simple little example.

> **NOTE:**
>
> - **Basic calculation**:
>
>   ``` r
>   square <- function(x) {
>     return(x^2)
>   }
>   print(square(4))
>   ```

> **TIP:**
>
> - Create a `cube` function that calculates the cube of a number, then test it with the values 2, 3 and 4.

### Good programming practices

Here are some tips for writing clean, maintainable code:

#### Golden rules

1.  **Name your objects descriptively**:

    ``` r
    average_notes <- mean(c(80, 85, 90))
    ```

2.  **Organize your script with comments**:

    ``` r
    # Calculation of the sum
    sum <- sum(vector)
    ```

In the course, you must follow the [tydiverse coding best practices](https://style.tidyverse.org/). For this module, we will pay particular attention to certain parts of this guide: chapter 1 Files, chapter 2 Syntax and section 3.1 Functions/Naming. The table below summarizes the important criteria of these sections and will serve as an evaluation grid for your codes. Note that this grid will evolve over the modules.

    Warning: package 'knitr' was built under R version 4.5.2

| Criterion | Explanation |
|:---|:---|
| Syntax and indentation | Respect for indentation and code structure (2 spaces per nesting level, no tabulation) |
| Spaces and readability | Consistent spaces around operators (`<-`, `=`, `+`, etc.) and after commas to improve readability. |
| Line length | Lines of code do not exceed 80 characters (except for justified exceptions) |
| Assignment | Using `<-` instead of `=` for assigning values. |
| Object naming | Use of explicit names and in `snake_case` Ex: `ma_variable` rather than `MaVariable` or `maVariable`. |
| Function style | Spaces after commas, no spaces before opening parentheses. Ex: `mean(x, na.rm = TRUE)`. |
| Consistency and clarity | The code is written in a clear and understandable manner, avoiding unnecessary complexity. |
| Useful comments | Comments are concise and helpful, without being redundant. Use of `#` with a space after it. |

R code evaluation grid according to tidyverse style. {.caption-top .table .table-sm .table-striped .small}

> **TIP:**
>
> - Identify style errors in code.
>
> - Correct them by applying tidyverse style best practices.
>
>   ``` r
>   MyFunction = function(x,y){
>   result=x+y
>   return(result) }
>
>   df=data.frame(id=1:5,name=c("Alice","Bob","Charlie","David","Eva"))
>   df_filtered = subset(df, id>2)
>   df_selected = df_filtered[,c("name")]
>   df_selected$Upper = toupper(df_selected$name)
>   mean(c(1,2,3,4,5),na.rm=TRUE)
>   ```

## Introduction to Quarto

Quarto is a powerful tool for creating reproducible documents combining text, code, and results. It supports different formats, such as HTML, PDF and Word.

### What is Quarto?

Quarto lets you combine R, Python or Julia code with textual explanations, while generating professional reports. Of course, in this course we will use it with R. Its main advantages include:

- **Reproducibility**: the code and the results are directly integrated into the same document.

- **Versatility**: possibility of generating various types of files (reports, presentations, websites).

- **Ease of use**.

### Structure of a Quarto document

A Quarto file always starts with a YAML header, followed by Markdown content and chunks of code.

#### Basic Quarto file example

``` yaml
---
title: "My first Quarto document"
format: html
editor: visual
---
```

#### Insert a *chunk* (block of code) R

To insert a *chunk* (block of code) into a quarto document, you can click on the following symbol:

![](resources/bouton_chunck.png)

Button to add a code block in Rstudio

``` r
# This is a block of code
2+2
```

    [1] 4

You can easily execute a block of code either by executing (`Ctrl + Enter`) line by line or by clicking on the small green arrow in the upper left corner of the code block. You will notice that your results appear below the code box.

Once your report is final, you can generate the report by clicking on the Render button: ![Button to add generate report](resources/bouton_render.png)

> **NOTE:**
>
> - **Create a Quarto document**:
>   1.  Click `File > New File > Quarto Document`.
>   2.  Choose the desired format (HTML, PDF, Word) and generate a basic document.
>   3.  Insert a code block with `Ctrl + Alt + I` shortcut (or symbol) and add R code (a simple trick).
> - **Generate the document**: Use `Ctrl + Shift + K` (or the render button) to generate the final report.

> **TIP:**
>
> 1.  Create a Quarto document in HTML format.
> 2.  Add an R code block to display a summary of the `mtcars` dataset (this is `summary(mtcars)`).
> 3.  Customize the YAML header to include your name and a date.

# Library and data

We saw above that you can improve your R experience by using libraries. As part of the course, we will use a library called `UlavalSSD`. This is a library developed for the course.

## `UlavalSSD`

First, you will install the `UlavalSSD` library and load it into your working environment.

``` r
# Install the remotes package if necessary
install.packages("remotes")

# Install UlavalSSD from GitHub
remotes::install_github("AurelienNicosiaULaval/UlavalSSD")
```

``` r
library(UlavalSSD)
```

Loading the library will allow us to access all of its contents. You can see the library help files with the following code (or by searching in the package tab on the right)

``` r
help(package = "UlavalSSD")
```

> **TIP:**
>
> - Search the contents of the bookstore. What do you notice?

## `MeteoQuebec` data

In this adventure, we will work with the dataset called `MeteoQuebec` available in the `UlavalSSD` library. It is important to note that if the library is not loaded (`library(UlavalSSD)`) then you will not be able to access this dataset.

> **TIP:**
>
> - `MeteoQuebec` is an object name in the environment. Display the database by creating a code block.
> - How many rows and columns does this dataset have?
> - Explore the help to make sure you understand what each column represents.

# Clean data (`Tidy` in English)

## What is clean data?

In the context of data science, **clean data** refers to a set of data that is ready to be used for analyses. This means that the data is organized, consistent, and free of errors or inconsistencies. Working with clean data is essential to ensure the quality of analysis results and models.

### Characteristics of clean data

Clean data must meet the following criteria:

- **No missing values**: All data necessary for the analysis is present.
- **Uniformity of formats**: The formats of dates, numbers and character strings are consistent.
- **No duplicates**: Duplicate entries have been identified and removed if necessary.
- **Error Removal**: Inconsistent or incorrect data has been corrected.
- **Well-defined columns**: Each column has a clear and unique meaning.
- **One line per observation**: The data is structured in a tabular manner, with one line representing a single observation.

### Example of non-clean data

A table containing the following data:

| Name    | Date of Birth | Score |
|---------|---------------|-------|
| Alice   | 01/01/1990    | 85.5  |
| Bob     | 1990-02-15    | 90    |
| Charlie |               | 87.5  |
| Alice   | 01/01/1990    | 85.5  |

Problems: - The date format is not consistent. - A line contains a missing value (Birth Date for Charlie). - The data contains a duplicate for Alice.

### Example of clean data

After cleaning, the data becomes:

| Name    | Date of Birth | Score |
|---------|---------------|-------|
| Alice   | 1990-01-01    | 85.5  |
| Bob     | 1990-02-15    | 90.0  |
| Charlie | 1992-03-20    | 87.5  |

- The date format is uniform (YYYY-MM-DD).
- Duplicates have been removed.
- Missing values ​​have been completed or deleted.

In the coming weeks we will have a complete module on data cleansing. This is simply to introduce you to the concept of clean data so that you are attentive to this aspect every time you encounter data.

> **TIP:**
>
> - In the `MeteoQuebec` dataset, check if there is any missing data. You can use the `summary` function for this. When we apply the `summary` function to a dataset, it gives us descriptive statistics (we will come back to this), but above all it gives the number of missing data per column.
>
> - Are the `MeteoQuebec` data clean? Justify your answer.

# Data manipulation

In this section, we will learn how to manipulate simple data tables in R. You will discover how to extract a row, a column and create a new column using the brackets `[]` and the operator `$`.

## Example of data table

We will use `MeteoQuebec` data. The `head` function is very practical, because as its name suggests, it displays the top (the head) of the database. This allows you to have quick access to the information contained in the variables.

``` r
# Displaying the top of the dataset
head(MeteoQuebec)
```

      ...1 year month day max_temp mean_temp min_temp total_precip total_rain
    1    1 1970    01  01    -12.8     -16.1    -19.4          0.0          0
    2    2 1970    01  02    -12.8     -16.1    -19.4          0.0          0
    3    3 1970    01  03    -13.3     -16.1    -18.9          0.0          0
    4    4 1970    01  04    -13.3     -17.0    -20.6          0.0          0
    5    5 1970    01  05    -12.8     -17.0    -21.1          0.3          0
    6    6 1970    01  06    -10.0     -14.2    -18.3          0.0          0
      total_snow snow_grnd
    1        0.0        18
    2        0.0        18
    3        0.0        18
    4        0.0        18
    5        0.5        15
    6        0.0        15

### Extract a line with brackets `[]`

To extract a specific row, use the format `data_name[row_number, ]`.

Example: Let’s get the 2nd line:

``` r
# Extract the 2nd line
line_2 <- MeteoQuebec[2, ]
print(line_2)
```

      ...1 year month day max_temp mean_temp min_temp total_precip total_rain
    2    2 1970    01  02    -12.8     -16.1    -19.4            0          0
      total_snow snow_grnd
    2          0        18

### Extract a column with brackets `[]`

To extract a column, you can use `data_name[, column_number]` or `data_name[["column_name"]]`.

**Attention**, usually we prefer to extract a column by its name rather than by its number. First of all, if your dataset contains many columns, it will become tedious to find the right number. Also, to be reproducible, it is better to work with the name, since even if the order of the columns changes, your analysis will remain valid.

Example: Let’s get the **total_precip** column:

``` r
# Method 1: By column number
column_score <- MeteoQuebec[, 7]
print(score_column)

#Method 2: By column name
column_score2 <- MeteoQuebec[["total_precip"]]
print(column_score2)
```

### Extract a column with the `$` operator

A simpler method to extract a column is to use the `$` operator.

Example: Let’s get the **mean_temp** column:

``` r
# Extract the "mean_temp" column
column_mean_temp <- MeteoQuebec$mean_temp
print(column_mean_temp)
```

> **NOTE:**
>
> - In the console, type the name of the database `MeteoQuebec`, add a `$` at the end. What is happening?

### Add a new column with `$`

To create a new column, use the `$` operator and assign a value to it.

Example: Let’s add a column **extended_temp**, equal to **max_temp-min_temp**:

``` r
# Add a new column
MeteoQuebec$extended_temp <- MeteoQuebec$max_temp -MeteoQuebec$min_temp
head(MeteoQuebec)
```

      ...1 year month day max_temp mean_temp min_temp total_precip total_rain
    1    1 1970    01  01    -12.8     -16.1    -19.4          0.0          0
    2    2 1970    01  02    -12.8     -16.1    -19.4          0.0          0
    3    3 1970    01  03    -13.3     -16.1    -18.9          0.0          0
    4    4 1970    01  04    -13.3     -17.0    -20.6          0.0          0
    5    5 1970    01  05    -12.8     -17.0    -21.1          0.3          0
    6    6 1970    01  06    -10.0     -14.2    -18.3          0.0          0
      total_snow snow_grnd extended_temp
    1        0.0        18           6.6
    2        0.0        18           6.6
    3        0.0        18           5.6
    4        0.0        18           7.3
    5        0.5        15           8.3
    6        0.0        15           8.3

> **TIP:**
>
> - Create a new column **mean_temp_F** which corresponds to the average temperature per day in degrees fahrenheit.

### Filter rows based on logical conditions

You can use logical conditions with `[]` brackets to extract specific lines.

Example: Let’s get the lines where the average temperature **mean_temp** is greater than 25:

``` r
# Extract rows with a Score > 85
lines_mean_temp_25 <- MeteoQuebec[MeteoQuebec$mean_temp > 25, ]
print(lines_mean_temp_25)
```

> **TIP:**
>
> - Get the lines where the precipitation total **total_precip** is zero:
> - Obtain the subset of data for the month of June only.

**Combine multiple conditions with** `&` or `|`:

- **AND (`&`)**: All conditions must be true to include a line.
- **OR (`|`)**: At least one of the conditions must be true to include a line.

Here is an example where we will look for the subset of data corresponding to the days in the year 2000 for which there was no precipitation.

``` r
head(MeteoQuebec[MeteoQuebec$year == 2000 & MeteoQuebec$total_precip == 0,])
```

           ...1 year month day max_temp mean_temp min_temp total_precip total_rain
    10962 10962 2000    01  05     -3.1     -10.1    -17.0            0         NA
    10963 10963 2000    01  06     -7.7     -13.5    -19.2            0         NA
    10969 10969 2000    01  12     -1.6      -8.4    -15.2            0         NA
    10970 10970 2000    01  13    -13.6     -17.2    -20.7            0         NA
    10971 10971 2000    01  14    -18.2     -21.3    -24.3            0         NA
    10972 10972 2000    01  15    -20.1     -23.9    -27.6            0         NA
          total_snow snow_grnd extended_temp
    10962         NA        NA          13.9
    10963         NA        NA          11.5
    10969         NA        NA          13.6
    10970         NA        NA           7.1
    10971         NA        NA           6.1
    10972         NA        NA           7.5

Portfolio trace

At the end of the adventure, keep a short trace of what you can redo without help.

- a mini Quarto report that renders to HTML;
- two R commands you understand and can explain;
- a note about missing values or variables in `MeteoQuebec`;
- one personal rule for keeping an analysis reproducible.

### Summary

| Action | Order |
|----|----|
| Extract a row | `data[line_number, ]` |
| Extract a column (brackets) | `data[, column_number]` or `data[["column_name"]]` |
| Extract a column (`$`) | `data$column_name` |
| Add a new column | `data$new_column <- ...` |
