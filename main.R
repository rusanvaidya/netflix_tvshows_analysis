---
title: "Netflix Dataset"
output: html_document
date: "2023-03-31"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
path <- "E:/EDU_UTS/UTS_ASSIGNMENTS/36104 Data Visualization and Narratives/TASK(1)_PART(B)/code"
setwd(path)
```

## Installing Packages

```{r}
install.packages("dyplr")
install.packages("lubridate")
install.packages("plotly")
install.packages("ggplot2")
```
## Read csv file

```{r}
df <- read.csv("netflix1.csv")
head(df, 5)
```

## Checking data types

```{r}
str(df)
```
## Checking for missing rows in dataset

```{r}
missing_rows <- which(is.na(df))
print(missing_rows)
```
## Creating a subset dataframe

```{r}
df_tvshows <- df[df$type == 'TV Show',]
head(df_tvshows, 5)
```

## Changing date from character to string

```{r}
df_tvshows$date_added <- as.Date(df_tvshows$date_added, format="%m/%d/%Y")
head(df_tvshows, 5)
```

```{r}
str(df_tvshows)
```
## Removing Seasons from duration

```{r}
df_tvshows$duration = gsub("Seasons", "", df_tvshows$duration)
df_tvshows$duration = gsub("Season", "", df_tvshows$duration)
df_tvshows$duration <- as.numeric(df_tvshows$duration)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
