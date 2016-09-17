library(shiny)

letterList<-"all"
letterList<-append(letterList,toupper(letters),1)

sexList<-c("both","male","female")

# mostPopularBabyNames<-mostPopularBabyNames[order(-mostPopularBabyNames$count),]




# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Top Baby Names from 1880 to 2015"),
  
  h4("The data used for this application comes from the Social Security Administration and can be found here:"),
  h4("https://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-national-level-data"),
  
  h2(" "),
  
# 1) Only show 2 columns from table
# 2) make numbers look like integers
# 3) Remove unnecessary output
# 4) Put some intro text to explain what's going on
# 5) Check if I want to fix titles/headers

  
  
  sidebarLayout(
    sidebarPanel(
      
      # 
      selectInput("sexList", label = h4("Select a gender"),
                  sexList,
                  selected = "both"),
      
     
        numericInput("year", label=h4("Select a year between 1880 and 2015:"), 1880, min = 1880, max = 2015),
    
    
    selectInput("letter", label = h4("Select the first letter of the baby names (optional):"), 
                letterList, 
                selected = "all")
    
    ),
    
      
      
      # helpText("Note: while the data view will show only the specified",
      #          "number of observations, the summary will still be based",
      #          "on the full dataset.")
      # ,
      
      ##submitButton("Update View")
    
    
    
    
    
    # Show a summary of the dataset and an HTML table with the
    # requested number of observations. Note the use of the h4
    # function to provide an additional header above each output
    # section.

    mainPanel(
    
      # 
      # fluidRow(column(3, verbatimTextOutput("sexValue"))),
      # 
      # fluidRow(column(3, verbatimTextOutput("Yearvalue"))),
      # 
      # fluidRow(column(3, verbatimTextOutput("value"))),
      
      h4("Top Baby Names"),
      tableOutput("babyNames")

    ))
  ))
