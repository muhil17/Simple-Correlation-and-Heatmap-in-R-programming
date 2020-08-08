#To import data from the system
  #data is the variable name which holds the dataset 

#Downlaod the data set
data<-read.csv("Enter ur path here")
#Enter ur path at which the dataset is available. Ex - "E:/coding_folder/R_folder/dataset_folder/coded_Music listening preferences at work place.csv"
head(data)

#Correlation is a measure of the linear relationship between two quantitative variables

#correlation must be only numeric so remove the columns and rows with non numeric characters
data1<-data[1:26,1:49]
data1

#use the cor() to establish the relationship for data1
correlation <- cor(data1,method = c("pearson"))
correlation1<-round(correlation,2)
head(correlation1)

#library(reshape2)
#melted_correlation<-melt(correlation1)
#head(melted_correlation)

#use tile()to visualize the correlation matrix
library(ggplot2)
ggplot(data=melted_correlation, aes(x=Var1,y=Var2, fill=value))+geom_tile()

#the plot is not good and non readable.
#heatmap1
col<- colorRampPalette(c("blue", "white", "red"))(40)
heatmap(correlation1, col=col, symm=TRUE)



# Heatmap2
library(ggplot2)
ggplot(melted_correlation, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle =45, vjust = 1, 
                                   size = 1, hjust = 1))+
  coord_fixed()
