setwd(dirname(file.choose()))
getwd()

# 2. to read data
covid_data <- read.csv("final_covid_data.csv", stringsAsFactors = FALSE)

# 3. Inspect the data
head(covid_data)
summary(covid_data)
str(covid_data)

# 4. check missing values
library(Amelia)
missmap(covid_data, col = c("black", "skyblue"), legend = TRUE, main = "Missingness Map")

# 6. Check the dependent variable for outliers
boxplot(covid_data$total, 
        main="Boxplot of Total COVID-19 Deaths", 
        ylab="Total Death Rate", 
        col="skyblue")

# 7. Histogram 
hist(covid_data$total, prob=TRUE, 
     main="Histogram of Total COVID-19 Deaths", 
     xlab="Total Death Rate", 
     col="lightgrey")
lines(density(covid_data$total), col="blue", lwd=2)

# 8. Q-Q Plot
qqnorm(covid_data$total, main="Normal Q-Q Plot")
qqline(covid_data$total, col="red", lwd=2)

# 9. Test for Normality
shapiro.test(covid_data$total)

# 10. Visual Correlogram
library(corrgram)
corrgram(covid_data[ , -c(1,2)], 
         order=TRUE, 
         lower.panel=panel.shade, 
         upper.panel=panel.pie, 
         text.panel=panel.txt, 
         main="Correlogram of Covid Data Variables")

# 11. Scatterplots 
# Testing if Bad Health correlates with Total Deaths
plot(covid_data$bad_health_rate, covid_data$total_rate,
     main = "Scatterplot: Bad Health vs Total Deaths",
     xlab = "Bad Health Rate",
     ylab = "Total Deaths Rate",
     pch = 19,
     col = "blue")

# Testing if Deprivation correlates with Total Deaths
plot(covid_data$deprived_2, covid_data$total_rate,
     main = "Scatterplot: Deprivation vs Total Deaths",
     xlab = "Deprived Level 2",
     ylab = "Total Deaths Rate",
     pch = 19,
     col = "red")

# 12. KMO Test for Sampling Adequacy
library(psych)
KMO(cor(covid_data[ , -c(1,2)]))

# 13. Eigenvalues
ev <- eigen(cor(covid_data[ , -c(1,2)]))
print(ev$values)

# Plot Scree Plot to visualize "elbow"
plot(ev$values, type="b", main="Scree Plot", xlab="Component Number", ylab="Eigenvalue")

# 14. Principal Component Analysis (PCA)
fit_pca <- principal(covid_data[ , -c(1,2)], nfactors=4, rotate="varimax")
print(fit_pca)

# Cluster Analysis
covid_scaled <- scale(covid_data[ , -c(1,2)])

# 16. Run K-Means Clustering
set.seed(123)
kmeans_fit <- kmeans(covid_scaled, centers=6)

# 17. Visualize/Save the clusters
covid_data$cluster <- kmeans_fit$cluster
head(covid_data)

#new data with clusters to CSV for your report
write.csv(covid_data, "covid_data_with_clusters.csv")
getwd()

# 18. Stepwise Multiple Regression
library(RcmdrMisc)
full_model <- lm(total_rate ~ ., data=covid_data[, -c(1,2,ncol(covid_data))])

# Run Stepwise Regression
best_model <- stepwise(full_model, direction="forward")

# 19. Summary of the Best Model
summary(best_model)

# 20Check VIF (multicollinearity check)
library(car)
vif(best_model)

# 21. Relative Importance
library(relaimpo)
calc.relimp(best_model, type = c("lmg"), rela = TRUE)

