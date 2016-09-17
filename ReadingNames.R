library(data.table)
##Find the count of the number of files in the "names" directory
numFiles<-length(dir("names"))
babyNames<-data.frame()


##Change the working directory to go into the names folder to retrieve the baby name data
currentwd<-getwd()
setwd("names")
fileName <-"yob"
fileNumber <-1879


for (i in 1:numFiles)
{
  tempTable<-matrix(ncol=4)
  fileNumber<-fileNumber+1
  tempTable<-fread(paste0(fileName,fileNumber,".txt",collapse=""),sep=",")
  yearTable<-matrix(nrow=nrow(tempTable),ncol=1)
  
  for (j in 1:nrow(tempTable))
    { 
      yearTable[j,1]<-toString(fileNumber)
  }
  tempTable<-cbind(tempTable,yearTable)
  


  babyNames<- rbind(babyNames,tempTable)
  
}

colnames(babyNames)<-c("name","sex","count","year")

setwd(currentwd)
write.csv(babyNames,"babyNames.txt",row.names = FALSE)

# 
# mostPopularBabyNames<-aggregate(babyNames$count, by=list(babyNames$name,babyNames$sex), FUN=sum)
# colnames(mostPopularBabyNames)<-c("name","sex","count")
# 
# ##Calculate most popular baby names of all time, both genders
# mostPopularBabyNames<-mostPopularBabyNames[order(-mostPopularBabyNames$count),]
# 
# 
# 
# ##Calculate most popular baby names of all time, male
# head(mostPopularBabyNames[which(mostPopularBabyNames$sex=="M"),])
# 
# ##Calculate most popular baby names of all time, female
# head(mostPopularBabyNames[which(mostPopularBabyNames$sex=="F"),])
# 
# ##Calculate most popular baby names of all time, male and start with letter "P"
# head(mostPopularBabyNames[which(mostPopularBabyNames$sex=="M" & substr(mostPopularBabyNames$name,1,1)=="P"),])
# 
# ##Calculate most popular baby names of 1986, male that starts with the letter "P"
# head(babyNames[which(babyNames$sex=="M" & babyNames$year==1986 & substr(babyNames$name,1,1)=="P"),])
