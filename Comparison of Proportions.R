
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
