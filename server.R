library(shiny)
library(data.table)
library(scales)

# Define server logic required to summarize and view the 
# selected dataset
shinyServer(function(input, output) {
  
  com<-comma_format()
  babyNames<-fread("babyNames.txt",sep=",")
  mostPopularBabyNames<-babyNames[order(-babyNames$count),]
  mostPopularBabyNames$count<-formatC(mostPopularBabyNames$count, format="d", big.mark=',')
 
  
  
  # letterList<-"all"
  # letterList<-append(letterList,toupper(letters),1)
  # 
  # sexList<-c("both","male","female")
  # # 
  # # 
  
  
    # # Pass through the letterList value for first dropdown
    # output$letterList <- renderUI({
    #   selectInput("letterList", "Choose Option:", as.list(letterList))
    #   # selectInput("letterList", as.list(letterList)) 
    # })
    # 
    # 
    # # Pass through the sexList value for second dropdown
    # output$sexList <- renderUI({
    #   selectInput("sexList", "Choose Option:", as.list(sexList))
    #   #  selectInput("sexList", as.list(sexList))
    # })
    
    
    babyOut <- reactive({
      
    #mostPopularBabyNames<-com(mostPopularBabyNames)  
      
    txtYear<-as.character(input$year)
    inLetter<-input$letter
      
    if (input$sexList=="both")
    {
      
      if (input$letter=="all")
      { baby<-head(mostPopularBabyNames[which(mostPopularBabyNames$year==txtYear)],10)
       subset(baby,select=c("name","sex","count"))
      } else
      {
        baby<-head(mostPopularBabyNames[which(mostPopularBabyNames$year==txtYear & substr(mostPopularBabyNames$name,1,1)==inLetter)],10)
        subset(baby,select=c("name","sex","count"))
      }
    }
  
    
    else if (input$sexList=="male")
    {
      
      if (inLetter=="all")
      { baby<-head(mostPopularBabyNames[which(mostPopularBabyNames$sex=="M" & mostPopularBabyNames$year==txtYear),],10)
        subset(baby,select=c("name","sex","count"))
      } else 
      {
        baby<-head(mostPopularBabyNames[which(mostPopularBabyNames$sex=="M" & mostPopularBabyNames$year==txtYear & substr(mostPopularBabyNames$name,1,1)==inLetter),],10)
        subset(baby,select=c("name","sex","count"))
      }
    } 
      
    ##sex = female
    else 
      {
      if (inLetter=="all")
          { baby<-head(mostPopularBabyNames[which(mostPopularBabyNames$sex=="F" & mostPopularBabyNames$year==txtYear),],10)
          subset(baby,select=c("name","sex","count"))
          } else 
          {
            baby<-head(mostPopularBabyNames[which(mostPopularBabyNames$sex=="F" & mostPopularBabyNames$year==txtYear & substr(mostPopularBabyNames$name,1,1)==inLetter),],10)
            subset(baby,select=c("name","sex","count"))
          }
    }
    
    })
    
    # ##Calculate most popular baby names of 1986, male that starts with the letter "P"
    # head(babyNames[which(babyNames$sex=="M" & babyNames$year==1986 & substr(babyNames$name,1,1)=="P"),])

  
  output$sexValue <- renderPrint({ input$sexList })
  
  output$Yearvalue <- renderText({ input$year })
  
  output$value <- renderPrint({ input$letter })
  
  output$babyNames <- renderTable({
    babyOut()
  })
  
  
  # # Generate a summary of the dataset
  # output$summary <- renderPrint({
  #   dataset <- datasetInput()
  #   summary(dataset)
  # })
  # 
  # # Show the first "n" observations
  # output$view <- renderTable({
  #   head(datasetInput(), n = input$obs)
  # })
})