#uncomment the next line if you don't have this library installed
#install.packages("htmltab")

library(htmltab)

#getting the table and changing the headers to match
url <- "https://questionnaire-148920.appspot.com/swe/data.html"
salaries <- htmltab(doc = url, which = "//table[@class = 'table']", header = c(1), body = "//tr")
names(salaries) <- c("Player", "Salary", "Year", "Level")

#cleaning the data by removing "$" and ",", and the Null values
salaries$Salary <- as.numeric(gsub("[\\$,]", "", salaries$Salary))
salaries <- na.omit(salaries)

#sorting the data by salary in a descending order
sorted.salaries <- salaries[order(salaries$Salary, decreasing = TRUE),]

#calculating the offer by taking the mean of the 125 highest values
offer <- mean(sorted.salaries$Salary[c(1:125)])

offer