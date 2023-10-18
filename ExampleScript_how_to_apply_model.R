
# Please specify dataset file:
# Absolute path specifications are required. 
# Please use the slash ("/") or the double backslash character(s) ("\\") as 
# delimiting characters for the path components/directories.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DataFile <- "PATH/TO/YOUR/DATASET/data.xlsx"
data <- read_excel(DataFile)
data <- na.omit(data)
data$SURVIVAL <- as.factor(data$SURVIVAL)


### We instead use here a artificial created example dataset for illustration
### Your dataset needs to have the same columnnames
### As this dataset is random this is just for illustration how to apply the model
### and the precision don't make any sense

# data <- data.frame(Patient=paste0("P",c(1:10)),
#            SOFA_Tag1 = sample(1:22,10),
#            SOFA_Tag2 = sample(1:22,10),
#            SOFA_Tag3 = sample(1:22,10),
#            SOFA_Tag4 = sample(1:22,10),
#            SOFA_Tag5 = sample(1:22,10),
#            SOFA_Tag6 = sample(1:22,10),
#            SOFA_Tag7 = sample(1:22,10))
# 
# print(data)
### Patient  SOFA_Tag1   SOFA_Tag2   SOFA_Tag3   SOFA_Tag4   SOFA_Tag5   SOFA_Tag6   SOFA_Tag7
### P1            4          22          12          6          10          11           2
### P2           15          12          10         14          17          19          14
### P3           11           9          16          8           5          18          15
### P4            6          17           2          1          13           1           8
### P5           22           6          13         11          15           3          10
### P6            5          21          11         20          19          22          20
### P7           14          18           1         22           3           2          21
### P8           20           3          19          3           4          16          13
### P9           16           5          20          7          20           6           4
### P10           9           7          14         16           7          13          19

# Please specify model file:
# Absolute path specifications are required. 
# Please use the slash ("/") or the double backslash character(s) ("\\") as 
# delimiting characters for the path components/directories.
mod <- readRDS("PATH/TO/YOUR/Model/Model_3days_svmPoly_new")

### calculation of predictions of probability for survival or death until day 30
predictions <- predict(mod,data,type="prob") 

print(predictions)
###   alive       dead
### 0.07456260 0.9254374
### 0.21786685 0.7821332
### 0.21176688 0.7882331
### 0.56128306 0.4387169
### 0.19954009 0.8004599
### 0.09718949 0.9028105
### 0.32721451 0.6727855
### 0.15957589 0.8404241
### 0.14033806 0.8596619
### 0.43471101 0.5652890

