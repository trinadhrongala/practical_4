#Correlation

df2<-subset(df,miles<100 & gbptransport<150)

hist(df2$gbptransport, main = "Histogram of
Transport Costs")
cor.test(df2$miles, df2$gbptransport,
         method="spearman")

plot(df2$miles, df2$gbptransport,
     xlab = "Miles to Campus", ylab =
       "Weekly Transport Cost £s", main
     = "Scatterplot of Distance to
Campus vs Transport Cost") #
#adds the dots
abline(lm(df2$gbptransport ~
            df2$miles), col = "red") 