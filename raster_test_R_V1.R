#From Orange, export data as a csv.  Remove extra rows (non data and heading)
#import data file (csv) using the environment import function
#read data and name it as object = data1 
#data <- read.table("capeCodTrain") - change name of file of interest
data1 <- read.csv("C:/Project_2/capeCodPredict9_RF.csv")
View(capeCodPredict9_RF) 

#Create new object from just the class column $-name of column of interest
#ClassList <- "capeCodTrain"
ClassList <- data1$mD.Random.Forest

#Convert data to numeric from factor
#remove unrepresented classes
#complete list - ClassList <- factor(ClassList, levels = c("1","2","3", "4","5","7","15","18","19","20","21"))
#example - capeCodTrain = 2,3,7,15,18,19,
ClassList <- factor(ClassList, levels = c("2","3","5","7","15","18","19","20","21"))
ClassList <- as.numeric(ClassList)

#ClassList <- as.matrix()
#Create Matrix from list of class values and the numbe of rows and columns
df <- matrix(ClassList, nrow = 63, byrow = TRUE)

#Create Color SCheme 
#remove unrepresented classes by making into comments
cols <- c(
  #'1' = rgb(1.,1.,0.),
  '2' = rgb(1.,0.,0.),
  '3' = rgb(0,1,0),
  #'4' = rgb(0.33,0.33,1),
  '5' = rgb(1,0.67,0.33),
  '7' = rgb(0,0.67,0),
  '15' = rgb(1,0.5,0.5),
  '18' = rgb(0,0,0),
  '19' = rgb(0.4,0.27,0.13),
  '20' = rgb(0,0,1),
  '21' = rgb(0.67,0.33,0))

#Create a raster object from matrix 
r <-raster(df)

#Plot raster and manually define the color scheme using same cols as before
plot(r, col = cols, axes = FALSE)



