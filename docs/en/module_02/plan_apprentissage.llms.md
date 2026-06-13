# Module 2 - Learning plan

STT-1100 Introduction to Data Science

# Module objectives

At the end of this module, you should be able to

- Use GitHub via RStudio to clone a repository and make commits and pushes.

- Read an `xls` file in RStudio.

- Manage and transform digital data using `dplyr` (`glimpse`, `select`, `mutate`, `filter`).

- Calculate and interpret descriptive statistics for numerical variables (`mean`, `median`, `standard deviation`, `variance`, `range`, `quantiles`), including for subgroups of data.

- Visualize numerical variables with `ggplot2` (`histogram`, `box plot`, `scatter plot`) and interpret the resulting graphs.

- Produce and interpret graphs comparing the distribution of continuous variables between groups (`superimposed histograms`, `juxtaposed box plots`, `stacked densities (ridge plots)`, `facet visualization`).

- Use `ggplot2` options to improve the quality of graphs (titles, legends, readable axes, graphic consistency, `facets`).

# Initial readings

As module 2 is spread over 2 weeks, there is a little more reading, to prepare yourself for the first part of the module you can skim the readings and come back to them in more detail in preparation for part 2.

We start with a few chapters in the famous R4DS by Hadley Wickham and Garrett Grolemund:

- [Data visualization](https://r4ds.hadley.nz/data-visualize.html)
  *Learn how to use `ggplot2` to create your first graphs. This introduction to data visualization shows you how to effectively represent numerical variables and how to customize your charts.*

- [Data transformation](https://r4ds.hadley.nz/data-transform.html)
  *Learn how to transform your datasets with `dplyr`: filter, sort, create new columns and summarize information. This chapter lays the foundation for tidyverse-style data manipulation.*

- [Exploratory Data Analysis (EDA)](https://r4ds.hadley.nz/EDA.html)
  *Explore your data to identify trends, detect extreme values and formulate hypotheses. This chapter presents simple but powerful techniques for visual and statistical analysis.*

- [Tidy data (spreadsheets)](https://r4ds.hadley.nz/spreadsheets.html)
  *Find out how to organize your data to make it actionable. This chapter discusses the concept of “clean data” and shows you how to recognize common table structures in Excel or CSV files.*

### 📐 Tidyverse Style Guide

- [Best practices for visualization with ggplot2 (Tidyverse Style Guide)](https://style.tidyverse.org/ggplot2.html)

### 📗 A new reference book

In this module, we introduce a second reference work: **Introduction to Modern Statistics** (*by Mine Çetinkaya-Rundel and Johanna Hardin*).

> Note: we will often abbreviate with **IMS**

This book, also available free online, offers a **modern and applied approach to statistics**. It emphasizes visualization, statistical intuition and best practices in data science. It constitutes an excellent complement to R4DS, in particular for deepening the statistical aspects of exploratory analyses.

- [Introduction to Modern Statistics – Chapter 5: Exploring numerical data](https://openintro-ims.netlify.app/explore-numerical)
  *In this chapter, you will learn how to explore numerical data using statistical tools like numerical summaries, histograms, and boxplots. It offers a clear and rigorous vision of data distribution.*

# Adventure

[Adventure 2](../module_02/aventure.llms.md)

# Challenge

Here is the challenge you will have to complete for **module 2**. It is divided into two parts:

**Part 1**: Complete your logbook and submit it to GitHub. Ten (10) logbooks will be selected at random and will be subject to a **summative evaluation**.

**Part 2**: Submit the **data analysis report** on GitHub that Dr. Adélie can use as part of her grant application.

# Consolidation exercises

To put into practice what you have learned from this module, you will find below **13 exercises** covering all the concepts of module 2 (`ggplot2`, `dplyr`, EDA, tidy data, good style practices and *IMS* style descriptive statistics).
We will mainly use the **`mpg`** dataset from the `ggplot2` library (performance of cars sold in the United States, 1999‑2008). When other datasets are used, they are specified in the statement.

### Dataset `mpg` – Description of variables

| Variable | Type | Description |
|----|----|----|
| `manufacturer` | character | Car manufacturer (e.g. *toyota*, *audi*). |
| `model` | character | Specific vehicle model (e.g. *corolla*, *a4*). |
| `displ` | numeric | Engine displacement in liters (L). |
| `year` | integer | Model year (1999 or 2008). |
| `cyl` | integer | Number of engine cylinders. |
| `trans` | character | Transmission type: automatic (`auto`) or manual (`manual`). |
| `drv` | character | Final drive type: front-wheel drive (`f`), rear-wheel drive (`r`) or all-wheel drive (`4`). |
| `cty` | numeric | **City** consumption in miles per gallon (MPG). |
| `hwy` | numeric | **Highway** consumption in miles per gallon (MPG). |
| `fl` | character | Fuel type: *c* (CNG), *d* (diesel), *e* (ethanol), *p* (premium), *r* (regular). |
| `class` | character | Vehicle category: *compact*, *suv*, *minivan*, etc. |

> ℹ️ Source: EPA *Fuel Economy* database, included in **ggplot2** and documented with `?mpg`.

------------------------------------------------------------------------

## Exercise 1 — First graph *(quick view)*

*Context:* you discover the relationship between engine capacity (`displ`) and highway consumption (`hwy`) in **`mpg`**. Draw a scatterplot.

> **TIP:**
>
> ``` r
> library(tidyverse)
>
> mpg %>%
>   ggplot(aes(displ, hwy)) +
>   geom_point() +
>   labs(
>     title = "Highway consumption vs displacement",
>     x = "Cylinder capacity (L)",
>     y = "Highway MPG"
>   )
> ```

------------------------------------------------------------------------

## Exercise 2 — Adding color and theme *(aesthetic)*

*Context:* improve the readability of the previous graph by distinguishing points by **vehicle category** (`class`) and applying a minimalist theme.

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(displ, hwy, color = class)) +
>   geom_point(alpha = 0.8, size = 2) +
>   theme_minimal() +
>   labs(
>     title = "Consumption according to category",
>     color = "Category"
>   )
> ```

------------------------------------------------------------------------

## Exercise 3 — Filter with `dplyr` *(targeted extraction)*

*Context:* the marketing manager of **Toyota** wants to know the dispersion of its models. Select only *Toyota* cars and display `model`, `displ`, `hwy`.

> **TIP:**
>
> ``` r
> toyota <- mpg %>%
>   filter(manufacturer == "toyota") %>%
>   select(model, displ, hwy)
>
> toyota
> ```

------------------------------------------------------------------------

## Exercise 4 — Derived variable and summary *(descriptive statistics)*

*Context:* we define a measure of **overall efficiency** `efficiency = hwy / cty`. Calculate, by category (`class`), the mean and standard deviation of this new variable.

> **TIP:**
>
> ``` r
> mpg %>%
>   mutate(efficiency = hwy / cty) %>%
>   group_by(class) %>%
>   summarize(
>     eff_mean = mean(efficiency, na.rm = TRUE),
>     eff_sd = sd(efficiency, na.rm = TRUE)
>   )
> ```

------------------------------------------------------------------------

## Exercise 5 — Histogram and density *(distribution)*

*Background:* You are intrigued by the displacement distribution. Plot the histogram of `displ` (class width 0.5L) and overlay the density.

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(displ)) +
>   geom_histogram(binwidth = 0.5, fill = "steelblue", color = "white") +
>   geom_density(aes(y = ..count.. * 0.5), linewidth = 1) +
>   labs(x = "Displacement (L)")
> ```

------------------------------------------------------------------------

## Exercise 6 — Extreme value *(outlier identification)*

*Context:* a magazine wants to know which model has the **best highway consumption**. Find it and display `manufacturer`, `model`, `year`, `hwy`.

> **TIP:**
>
> ``` r
> mpg %>%
>   filter(hwy == max(hwy)) %>%
>   select(manufacturer, model, year, hwy)
> ```

------------------------------------------------------------------------

## Exercise 7 — Best practices \#1 *(tidyverse style)*

*Background:* you receive a sloppy script. Rewrite it to follow the tidyverse style guide.

- First run the code to see what it gives. \> This is the old way of making a graph with `base R`.

- Reproduce the graph with `ggplot2` respecting good style practices.

``` r
plot(mpg$displ,mpg$hwy,col=as.factor(mpg$drv));title("plot")
```

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(displ, hwy, color = drv)) +
>   geom_point() +
>   labs(
>     title = "Highway consumption vs displacement",
>     x = "Cylinder capacity (L)",
>     y = "Highway MPG",
>     color = "Transmission"
>   )
> ```

------------------------------------------------------------------------

## Exercise 8 — Best practices \#2 *(script structure)*

*Context:* create a file `analyse_mpg.R` with:

- a clear header (author, date);

- loading `tidyverse`;

- a pipeline that calculates the average of `hwy` by `class` and saves it in `mean_hwy`.

> **TIP:**
>
> ``` r
> #analyse_mpg.R – A. Nicosia
> # Date: 2025‑05‑20
>
> library(tidyverse)
>
> mean_hwy <- mpg %>%
>   group_by(class) %>%
>   summarize(mean_hwy = mean(hwy, na.rm = TRUE))
> ```

------------------------------------------------------------------------

## Exercise 9 — “tidy” data *(pivot_longer)*

*Context:* you are moving annual sales from wide to long format for easier visualizations.

``` r
dirty <- tibble(
  brand = c("A", "B"),
  sales_2023 = c(120, 95),
  sales_2024 = c(150, 110)
)
```

> **TIP:**
>
> ``` r
> sales_long <- dirty %>%
>   pivot_longer(
>     cols = starts_with("sales_"),
>     names_to = "year",
>     names_prefix = "sales_",
>     values_to = "units"
>   )
>
> sales_long
> ```

------------------------------------------------------------------------

## Exercise 10 — Numerical summary *(five‑number)*

*Context:* quick statistical summary of city MPG (`cty`).

> **TIP:**
>
> ``` r
> fivenum(mpg$cty)
> # or
> summary(mpg$cty)
> ```

------------------------------------------------------------------------

## Exercise 11 — Boxplot by category *(comparison of groups)*

*Context:* visualize the distribution of `hwy` by `class`, classes sorted by decreasing median.

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(x = reorder(class, hwy, median, na.rm = TRUE), y = hwy)) +
>   geom_boxplot(fill = "orange") +
>   coordinate_flip() +
>   labs(
>     x = "Category (sorted)",
>     y = "Highway MPG"
>   )
> ```

------------------------------------------------------------------------

## Exercise 12 — Facets *(transmission distribution)*

*Context:* compare displacement distributions (`displ`) according to transmission type (`drv`).

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(displ)) +
>   geom_histogram(binwidth = 0.5, fill = "darkseagreen") +
>   facet_wrap(~ drv, nrow = 1) +
>   labs(x = "Displacement (L)")
> ```

------------------------------------------------------------------------

## Exercise 13 — Complete statistical analysis *(IMS inspiration)*

*Background:* As in Chapter 5 of *Introduction to Modern Statistics*, you need to explore the **`hwy`** variable in depth.

1.  Calculate the mean, standard deviation, median, IQR and number of observations.
2.  Create a histogram of `hwy` with density overlaid.
3.  Add a (horizontal) boxplot below the histogram.
4.  Interpret: symmetric or asymmetric distribution? extreme values? What can we conclude about the energy efficiency of cars?

> **TIP:**
>
> ``` r
> #1. Statistics
> mpg %>%
>   summarize(
>     n = n(),
>     mean_hwy = mean(hwy),
>     sd_hwy = sd(hwy),
>     median_hwy = median(hwy),
>     IQR_hwy = IQR(hwy)
>   )
>
> #2‑3. Histogram + boxplot
> library(patchwork) # for assembly (optional)
>
> p1 <- mpg %>%
>   ggplot(aes(hwy)) +
>   geom_histogram(binwidth = 2, fill = "steelblue", color = "white") +
>   geom_density(aes(y = ..count.. * 2), linewidth = 1) +
>   labs(title = "Highway MPG Distribution")
>
> p2 <- mpg %>%
>   ggplot(aes(y = hwy)) +
>   geom_boxplot(fill = "orange", width = 0.4) +
>   theme_void()
>
> p1 / p2 # patchwork stacks both graphics
> ```
>
> *Interpretation:* the distribution is slightly right-skewed; a few very efficient vehicles (\>40 MPG) appear as outliers. Overall, the median around 24 MPG indicates that a majority of cars remain moderately efficient.
