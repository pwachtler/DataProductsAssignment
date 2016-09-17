# Data Products Course Assignment

This repository contains the Shiny App I created as my Course Assignment submission for the Data Products class on Coursera.

My app uses data from the Social Security Administration on the most popular baby names from 1880 to 2015. This data can be found here: (https://www.ssa.gov/oact/babynames/background.html).  Within the app, a user can select a gender, year, and first letter of a name (if desired) to see the Top 10 most popular baby names that fit the selected criteria.  The app dynamically updates the output table when a user selects a new option.

I created the ReadingNames.R script to read all of the baby name data and load it into a single .txt file (babyNames.txt), which is used as the main data source for my app.  This text file is rather large, so I stored it in this repo within the babyNames.zip file.

My app can be found here: https://paulw.shinyapps.io/Shiny_App/

IMPORTANT: Please note that it may take a few seconds for the data table in the app to load and is dependent on your connection speed
