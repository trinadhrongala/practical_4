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



df2<-subset(df,gender=="Man" |
              gender=="Woman")

pt <- table(df2$gender,df2$award)

chisq.test(pt)
#X-squared = 2.4384, df = 4, p-value = 0.6557

colnames(pt) = c("Adv CS", "AI", "CyberSec",
                 "Data Sci.", "Soft Eng.")
percentages <- prop.table(pt, margin=2) * 100 

barplot(percentages, col = c("blue", "pink"), xlab
        = "Awards", ylab = "Percentage",
        main = "Stacked Bar Of Awards by
Men v Women", ylim = c(0, 100),
        legend.text = c("Man", "Woman"),
        args.legend = list(x = "topright"))

tpercentages<-prop.table(t(pt), margin=2) * 100

barplot(tpercentages, col = c("red", "green",
                              "yellow", "pink", "blue"), xlab = "Awards", ylab =
          "Percentage",
        main = "Stacked Bar Of Awards by Men v
Women", ylim = c(0, 100),
        legend.text = rownames(tpercentages),
        args.legend = list(x = "topright"))
