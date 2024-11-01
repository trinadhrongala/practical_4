library(readr) 
survey_data <- read_csv("survey_data.csv")
df<-survey_data
names(df)[7] <- "award"
names(df)[8] <- "gender"
names(df)[9] <- "height"
names(df)[10] <- "continent"
names(df)[11] <- "pe_minutes"
names(df)[12] <- "miles"
names(df)[13] <- "gbptransport"
names(df)[14] <- "get2campusminutes"
names(df)[15] <- "gbpfood"

df$isAsian<-
  ifelse(df$continent=="Asia","Asia","Not Asia")
df2<-subset(df,gbpfood<150)

hist(df2$gbpfood)
#Having put the limit at 150 we get something
#that is a bit normal but not convincingly. (If we
#had put the limit at 80 it does appear more
#normal but still not very good.
t.test(df2$gbpfood ~ df2$isAsian)
wilcox.test(df2$gbpfood ~ df2$isAsian) 


#The diagram used for comparison of means is a
#box plot
boxplot(df2$gbpfood ~ df2$isAsian, xlab =
          "Provenance", ylab = "£s weekly spent on
food", main = "Money spent on food ")

