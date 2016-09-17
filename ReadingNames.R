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
