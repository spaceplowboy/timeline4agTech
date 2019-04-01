
setwd("C:/data/GitHub/timeline4agTech")
year<-read.csv("yearPAintro.csv") 
currentYear<-format(Sys.time(), "%Y")

library(ggplot2)
library(timelineS)

year$date2<-paste(year$yearAvailable, "-03-03",sep="")
myVars<-c("tech" ,  "date2")
timeDat<-year[myVars]

head(timeDat)
colnames(timeDat)<-c("Events", "Event_Dates")
timeDat$Event_Dates<-as.Date(timeDat$Event_Dates)  

png("timelinePurple.png", width = 1200, height=600, units="px", pointsize =18)
timelineS(timeDat, 
          #main = "Commercialization of Precision Technologies", 
          buffer.days = 900,
          label.direction = "updown", label.angle = 0, 
          label.length   = c(0.1,  0.4,  0.2,  .6,  0.4, .4), 
          label.position = c(3, 1, 3, 1, 3, 1, 3, 1), 
          label.cex = 1.0, 
          labels = timeDat[,1],
          line.color = "purple", label.color = "purple", point.color = "purple", pch = "-")

dev.off()
