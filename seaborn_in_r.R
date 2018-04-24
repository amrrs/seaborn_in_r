#loading required R libraries 

library(reticulate) #the superpower bridges python and R

#specifying which version of python to use

use_python('C:\\PROGRA~1\\Python35\\python.exe')

#importing required Python libraries/modules

sns <- import('seaborn')
plt <- import('matplotlib.pyplot')
pd <- import('pandas')

#using R's inbuilt AirPassengers dataset

df <- datasets::AirPassengers

#converting Time-Series object into an R Dataframe 
#Thx: https://stackoverflow.com/questions/5331901/transforming-a-time-series-into-a-data-frame-and-back

df1 <- data.frame(tapply(df, list(year = floor(time(df)), month = month.abb[cycle(df)]), c))

df1 <- df1[month.abb]

#building a heatmap using seaborn 
#please note the function r_to_py() that converts R object into a python 

sns$heatmap(r_to_py(df1), fmt="g", cmap ='viridis')

#display the plot

plt$show()


#building a seaborn pairplot using pairplot()

sns$pairplot(r_to_py(iris), hue = 'Species')

#display the plot

plt$show()


