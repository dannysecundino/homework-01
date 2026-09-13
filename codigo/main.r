# =========================
# First Question
# =========================

# 1. Defining the highest student number
# students numbers
alexandre_sn <- 578345
bruno_sn <- 578342
danny_sn <- 579763
saulo_sn <- 579493

# highest student number
M <- max(c(alexandre_sn, bruno_sn, danny_sn, saulo_sn)) # 579763

# 2. Defining the start and the end of group's dataset
# start
r <- 1 + (M %% 100)     # 64

# end
end <- 300 + r - 1      # 363

# 3. Defining data_group (ie., the group's dataset)
# loading the entire file
all_data <- read.csv("HW1_bike_sharing.csv")

# defining our scope
data_group <- all_data[r:end, ]         # collect the lines 64-363

# 4. Defining the first 10 observations (we'll use them in the subsequent questions to validate our manual computations)
first_ten <- data_group[1:10, ]

# 5. Presenting our results
cat("=========================First Question=========================\n")
cat("1. Students Numbers of Group:\n")
cat("   Alexandre Grangeiro:", alexandre_sn, "\n")
cat("   Bruno Lage:", bruno_sn, "\n")
cat("   Danny Secundino:", danny_sn, "\n")
cat("   Saulo Gomes:", saulo_sn, "\n")
cat("\n")

cat("2. Highest student number: M =", M, "\n")
cat("\n")

cat("3. Start of group's dataset: r =", r, "\n")
cat("\n")

cat("4. Date of first observation:", data_group[1, "dteday"], "\n")
cat("   Date of last observation:", data_group[300, "dteday"], "\n")
cat("\n")

cat("5. The R code used to construct data_group is the code running right now.\n")
cat("\n\n")

# =========================
# Second Question
# =========================

# 0. Defining a new column (total_user)
# in data_group
data_group$total_user <- data_group$casual + data_group$registered

# in first_ten
first_ten$total_user <- first_ten$casual + first_ten$registered

# 1. Answering the first step
# the answers will be presented at this code in the section "Presenting our results" of this question
# however, a more detailed answer will be at the report

# in addition, we can check if there are any missing values [we know that there are none, so we'll only store this information on a variable]

has_missing_values = any(is.na(data_group))  # returns TRUE if there are any missing values and FALSE otherwise [we tried it, and the result is FALSE]

# 2. Calculating the measures of central tendency [we'll consider the following relevant numerical variables: temp, casual, registered]
# with the first ten observations (to compare with manual computations)
# mean
xn_first10_temp <- mean(first_ten$temp)
xn_first10_casual <- mean(first_ten$casual)
xn_first10_registered <- mean(first_ten$registered)
xn_first10_total_user <- mean(first_ten$total_user)
# median
me_first10_temp <- median(first_ten$temp)
me_first10_casual <- median(first_ten$casual)
me_first10_registered <- median(first_ten$registered)
me_first10_total_user <- median(first_ten$total_user)

# mode [none of the numerical variables have a mode that is meaningful to calculate]

# with all group's dataset
# mean
xn_temp <- mean(data_group$temp)
xn_casual <- mean(data_group$casual)
xn_registered <- mean(data_group$registered)
xn_total_user <- mean(data_group$total_user)

# median
me_temp <- median(data_group$temp)
me_casual <- median(data_group$casual)
me_registered <- median(data_group$registered)
me_total_user <- median(data_group$total_user)

# mode [none of the numerical variables have a mode that is meaningful to calculate]

# 3. Quartiles analyses [choosed variable: casual] (we'll use native functions of R to do this!)
# with the first ten observations (to compare with manual computations)
# quartiles
Q1_f10 <- quantile(first_ten$casual, 0.25)
Q2_f10 <- quantile(first_ten$casual, 0.5)
Q3_f10 <- quantile(first_ten$casual, 0.75)

# interquartile range
iqr_f10 <- IQR(first_ten$casual)

# bounds for identifying potential outliers
lower_bound_f10 <- Q1_f10 - 1.5 * iqr_f10
upper_bound_f10 <- Q3_f10 + 1.5 * iqr_f10

# identifying outliers
outliers_f10 <- first_ten[first_ten$casual < lower_bound_f10 | first_ten$casual > upper_bound_f10, ]   # store the lines out of bounds to variable casual

# with all group's dataset
# quartiles
Q1 <- quantile(data_group$casual, 0.25)
Q2 <- quantile(data_group$casual, 0.5)
Q3 <- quantile(data_group$casual, 0.75)

# interquartile range
iqr <- IQR(data_group$casual)

# bounds for identifying potential outliers
lower_bound <- Q1 - 1.5 * iqr
upper_bound <- Q3 + 1.5 * iqr

# identifying outliers
outliers <- data_group[data_group$casual < lower_bound | data_group$casual > upper_bound, ]   # store the lines out of bounds to variable casual

# 4. Boxplot and Histogram
# with the first ten observations (to compare with manual computations)
boxplot(first_ten$casual,
        main = "Casual Users Boxplot (First Ten Observations)",
        ylab = "Number of casual users",
        col = "orange")

# histogram
h <- hist(first_ten$casual, plot = FALSE)      # firt make the histogram, without plotting it
hist(first_ten$casual,                         # plotting the histogram
     main = "Casual Users Histogram (First Ten Observations)",
     xlab = "Number of casual users",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     ylim = c(0, max(h$density) * 1.2))    # adds 20% clearance to the upper limit

# with all group's dataset
# boxplot
boxplot(data_group$casual,
        main = "Casual Users Boxplot",
        ylab = "Number of casual users",
        col = "steelblue")
# histogram
h <- hist(data_group$casual, plot = FALSE)      # firt make the histogram, without plotting it
hist(data_group$casual,                         # plotting the histogram
     main = "Casual Users Histogram",
     xlab = "Number of casual users",
     ylab = "Density",
     col = "steelblue",
     border = "black",
     freq = FALSE,
     ylim = c(0, max(h$density) * 1.2))    # adds 20% clearance to the upper limit

# 5. Defining the variable low_usage
# with the first ten observations (to compare with manual computations)
# first quartile
Q1_lowusage_f10 <- quantile(first_ten$total_user, 0.25)

# new column low_usage
first_ten$low_usage <- ifelse(first_ten$total_user < Q1_lowusage_f10, 1, 0)

# proportion of days classified as having low usage compared with all frame
prop_lu_f10 <- nrow(first_ten[first_ten$low_usage == 1, ])/nrow(first_ten)

# with all group's dataset
# first quartile
Q1_lowusage <- quantile(data_group$total_user, 0.25)

# new column low_usage
data_group$low_usage <- ifelse(data_group$total_user < Q1_lowusage, 1, 0)

# proportion of days classified as having low usage compared with all frame
prop_lu <- nrow(data_group[data_group$low_usage == 1, ])/nrow(data_group)

# 6. Presenting our results
cat("=========================Second Question=========================\n")
cat("1. Performing analyses:\n")
cat("a) Classifying the variables:\n")
cat("   instant: numerical.\n")
cat("   dteday: categorical.\n")
cat("   season: categorical.\n")
cat("   weathersit: categorical.\n")
cat("   temp: numerical.\n")
cat("   casual: numerical.\n")
cat("   registered: numerical.\n")

cat("b) Identifying the categories of the categorical variables:\n")
cat("   dteday: ordinal.\n")
cat("   season: nominal.\n")
cat("   weathersit: nominal.\n")

cat("c) Identifying the units of measurement and the meaning of the numerical variables:\n")
cat("   instant: no unit of measurement; represents an identification of the observation, like a ID.\n")
cat("   temp: degrees Celsius; represents the temperature of the day.\n")
cat("   casual: persons; represents the number of users non-registered that used bikes on the day.\n")
cat("   registered: persons; represents the number of users registered that used bikes on the day.\n")

cat("d) Check for missing values:\n")
cat("   We have stored this information in the variable has_missing_values, and your result is:", has_missing_values, "\n")
if(has_missing_values) {
    cat("   It means that there are some missing values.\n")
} else {
    cat("   It means that there are not any missing values.\n")
}
cat("\n")


cat("2. Calculating measures of central tendency:\n")
cat("[We'll consider the following relevant numerical variables: temp, casual, registered, total_user]\n")
cat("a) For the first ten observations (to compare with manual computations):\n")
cat("   i) Mean:\n")
cat("       temp:", xn_first10_temp, "\n")
cat("       casual:", xn_first10_casual, "\n")
cat("       registered:", xn_first10_registered, "\n")
cat("       total_user:", xn_first10_total_user, "\n")
cat("   ii) Median:\n")
cat("       temp:", me_first10_temp, "\n")
cat("       casual:", me_first10_casual, "\n")
cat("       registered:", me_first10_registered, "\n")
cat("       total_user:", me_first10_total_user, "\n")
cat("   iii) Mode:\n")
cat("       None of the numerical variables have a mode that is meaningful to calculate\n")
cat("b) For all group's dataset:\n")
cat("   i) Mean:\n")
cat("       temp:", xn_temp, "\n")
cat("       casual:", xn_casual, "\n")
cat("       registered:", xn_registered, "\n")
cat("       total_user:", xn_total_user, "\n")
cat("   ii) Median:\n")
cat("       temp:", me_temp, "\n")
cat("       casual:", me_casual, "\n")
cat("       registered:", me_registered, "\n")
cat("       total_user:", me_total_user, "\n")
cat("   iii) Mode:\n")
cat("       None of the numerical variables have a mode that is meaningful to calculate\n")
cat("\n")


cat("3. Analyzing the quartiles:\n")
cat("[We have choosed the variable casual]\n")
cat("a) For the first ten observations (to compare with manual computations):\n")
cat("   i) Quartiles and Interquartile Range:\n")
cat("       Q1 =", Q1_f10, "\n")
cat("       Q2 =", Q2_f10, "\n")
cat("       Q3 =", Q3_f10, "\n")
cat("       IQR =", iqr_f10, "\n")
cat("   ii) Lower and upper bounds for identifying potential outliers:\n")
cat("       Lower bound:", lower_bound_f10, "\n")
cat("       Upper bound:", upper_bound_f10, "\n")
cat("   iii) Outliers:\n")
cat("       Quantity of outliers:", nrow(outliers_f10), "\n")
cat("       Date of outliers:\n")
cat("           ", outliers_f10$dteday, "\n")
cat("b) For all group's dataset:\n")
cat("   i) Quartiles and Interquartile Range:\n")
cat("       Q1 =", Q1, "\n")
cat("       Q2 =", Q2, "\n")
cat("       Q3 =", Q3, "\n")
cat("       IQR =", iqr, "\n")
cat("   ii) Lower and upper bounds for identifying potential outliers:\n")
cat("       Lower bound:", lower_bound, "\n")
cat("       Upper bound:", upper_bound, "\n")
cat("   iii) Outliers:\n")
cat("       Quantity of outliers:", nrow(outliers), "\n")
cat("       Date of outliers:\n")
cat("           ", outliers$dteday, "\n")
cat("\n")

cat("4. Boxplot and Histogram:\n")
cat("Both are at the generated pdf Rplots.pdf\n")
cat("\n")

cat("5. Variable low_usage:\n")
cat("a) For the first ten observations (to compare with manual computations):\n")
cat("   i) First quartile value: Q1 =", Q1_lowusage_f10,"\n")
cat("   ii) Number of days classified as having low usage:", nrow(first_ten[first_ten$low_usage == 1, ]),"\n")
cat("   iii) Proportion compared with all frame:", prop_lu_f10,"\n")
cat("b) For all group's dataset:\n")
cat("   i) First quartile value: Q1 =", Q1_lowusage,"\n")
cat("   ii) Number of days classified as having low usage:", nrow(data_group[data_group$low_usage == 1, ]),"\n")
cat("   iii) Proportion compared with all frame:", prop_lu,"\n")
cat("\n\n")

# =========================
# Third Question
# =========================

# 1. Analysing system usage for each season of the year
# for our analyses (seasons at the northern hemisphere):
# 1: winter
# 2: spring
# 3: summer
# 4: autumn

# with the first ten observations (to compare with manual computations)
# 1: winter
winter_obs_f10 <- first_ten[first_ten$season == 1, ]    # observations at winter
xn_winter_f10 <- mean(winter_obs_f10$total_user)        # mean
me_winter_f10 <- median(winter_obs_f10$total_user)      # median
sd_winter_f10 <- sd(winter_obs_f10$total_user)          # sample standard deviation
prop_lu_winter_f10 <- nrow(winter_obs_f10[winter_obs_f10$low_usage == 1, ])/nrow(winter_obs_f10)   # proportion of days classified as having low usage compared with all frame  
if (nrow(winter_obs_f10) > 0){ # we need to check if that is an empty vactor
    boxplot(winter_obs_f10$total_user,                  # boxplot
            main = "Winter Total User (First Ten Observations)",
            ylab = "Number of users",
            col = "orange")
}            

# 2: spring
spring_obs_f10 <- first_ten[first_ten$season == 2, ]    # observations at spring
xn_spring_f10 <- mean(spring_obs_f10$total_user)        # mean
me_spring_f10 <- median(spring_obs_f10$total_user)      # median
sd_spring_f10 <- sd(spring_obs_f10$total_user)          # sample standard deviation
prop_lu_spring_f10 <- nrow(spring_obs_f10[spring_obs_f10$low_usage == 1, ])/nrow(spring_obs_f10)   # proportion of days classified as having low usage compared with all frame  
if (nrow(spring_obs_f10) > 0){ # we need to check if that is an empty vactor
    boxplot(spring_obs_f10$total_user,                      # boxplot
            main = "Spring Total User (First Ten Observations)",
            ylab = "Number of users",
            col = "orange")
}

# 3: summer
summer_obs_f10 <- first_ten[first_ten$season == 3, ]    # observations at summer
xn_summer_f10 <- mean(summer_obs_f10$total_user)        # mean
me_summer_f10 <- median(summer_obs_f10$total_user)      # median
sd_summer_f10 <- sd(summer_obs_f10$total_user)          # sample standard deviation
prop_lu_summer_f10 <- nrow(summer_obs_f10[summer_obs_f10$low_usage == 1, ])/nrow(summer_obs_f10)   # proportion of days classified as having low usage compared with all frame  
if (nrow(summer_obs_f10) > 0){ # we need to check if that is an empty vactor
    boxplot(summer_obs_f10$total_user,                      # boxplot
            main = "Summer Total User (First Ten Observations)",
            ylab = "Number of users",
            col = "orange")
}

# 4: autumn
autumn_obs_f10 <- first_ten[first_ten$season == 4, ]    # observations at autumn
xn_autumn_f10 <- mean(autumn_obs_f10$total_user)        # mean
me_autumn_f10 <- median(autumn_obs_f10$total_user)      # median
sd_autumn_f10 <- sd(autumn_obs_f10$total_user)          # sample standard deviation
prop_lu_autumn_f10 <- nrow(autumn_obs_f10[autumn_obs_f10$low_usage == 1, ])/nrow(autumn_obs_f10)   # proportion of days classified as having low usage compared with all frame  
if (nrow(autumn_obs_f10) > 0){ # we need to check if that is an empty vactor
    boxplot(autumn_obs_f10$total_user,                      # boxplot
            main = "Autumn Total User (First Ten Observations)",
            ylab = "Number of users",
            col = "orange")
}

# with all group's dataset
# here, we don't need to check if that is an empty vactor, because we know that there are observations for each season in 300 days
# 1: winter
winter_obs <- data_group[data_group$season == 1, ]      # observations at winter
xn_winter <- mean(winter_obs$total_user)                # mean
me_winter <- median(winter_obs$total_user)              # median
sd_winter <- sd(winter_obs$total_user)                  # sample standard deviation
prop_lu_winter <- nrow(winter_obs[winter_obs$low_usage == 1, ])/nrow(winter_obs)   # proportion of days classified as having low usage compared with all frame  
boxplot(winter_obs$total_user,                          # boxplot
        main = "Winter Total User",
        ylab = "Number of users",
        col = "steelblue")

# 2: spring
spring_obs <- data_group[data_group$season == 2, ]      # observations at spring
xn_spring <- mean(spring_obs$total_user)                # mean
me_spring <- median(spring_obs$total_user)              # median
sd_spring <- sd(spring_obs$total_user)                  # sample standard deviation
prop_lu_spring <- nrow(spring_obs[spring_obs$low_usage == 1, ])/nrow(spring_obs)   # proportion of days classified as having low usage compared with all frame  
boxplot(spring_obs$total_user,                          # boxplot
        main = "Spring Total User",
        ylab = "Number of users",
        col = "steelblue")

# 3: summer
summer_obs <- data_group[data_group$season == 3, ]      # observations at summer
xn_summer <- mean(summer_obs$total_user)                # mean
me_summer <- median(summer_obs$total_user)              # median
sd_summer <- sd(summer_obs$total_user)                  # sample standard deviation
prop_lu_summer <- nrow(summer_obs[summer_obs$low_usage == 1, ])/nrow(summer_obs)   # proportion of days classified as having low usage compared with all frame  
boxplot(summer_obs$total_user,                          # boxplot
        main = "Summer Total User",
        ylab = "Number of users",
        col = "steelblue")

# 4: autumn
autumn_obs <- data_group[data_group$season == 4, ]      # observations at autumn
xn_autumn <- mean(autumn_obs$total_user)                # mean
me_autumn <- median(autumn_obs$total_user)              # median
sd_autumn <- sd(autumn_obs$total_user)                  # sample standard deviation
prop_lu_autumn <- nrow(autumn_obs[autumn_obs$low_usage == 1, ])/nrow(autumn_obs)   # proportion of days classified as having low usage compared with all frame
boxplot(autumn_obs$total_user,                          # boxplot
        main = "Autumn Total User",
        ylab = "Number of users",
        col = "steelblue")


# 2. Analyzing system usage for each weather condition
# for our analyses (weather conditions):



# X. Presenting our results
cat("=========================Third Question==========================\n")
cat("1. Analysing system usage for each season of the year:\n")
cat("Considering the seasons at the northern hemisphere and analysing dteday, we can make a correspondence:\n")
cat("                   1: winter.\n")
cat("                   2: spring.\n")
cat("                   3: summer.\n")
cat("                   4: autumn.\n")
cat("(For each case, we have plotted a boxplot, except for empty-vector cases.)\n")
cat("a) For the first ten observations (to compare with manual computations):\n")
cat("   i) Winter:\n")
cat("      Mean: ", xn_winter_f10, "\n")
cat("      Median: ", me_winter_f10, "\n")
cat("      Sample Standard Deviation: ", sd_winter_f10, "\n")
cat("      Proportion of Low Usage Days: ", prop_lu_winter_f10, "\n")

cat("   ii) Spring:\n")
cat("      Mean: ", xn_spring_f10, "\n")
cat("      Median: ", me_spring_f10, "\n")
cat("      Sample Standard Deviation: ", sd_spring_f10, "\n")
cat("      Proportion of Low Usage Days: ", prop_lu_spring_f10, "\n")

cat("   iii) Summer:\n")
cat("      Mean: ", xn_summer_f10, "\n")
cat("      Median: ", me_summer_f10, "\n")
cat("      Sample Standard Deviation: ", sd_summer_f10, "\n")
cat("      Proportion of Low Usage Days: ", prop_lu_summer_f10, "\n")

cat("   iv) Autumn:\n")
cat("      Mean: ", xn_autumn_f10, "\n")
cat("      Median: ", me_autumn_f10, "\n")
cat("      Sample Standard Deviation: ", sd_autumn_f10, "\n")
cat("      Proportion of Low Usage Days: ", prop_lu_autumn_f10, "\n")

cat("b) For all group's dataset:\n")
cat("   i) Winter:\n")
cat("      Mean: ", xn_winter, "\n")
cat("      Median: ", me_winter, "\n")
cat("      Sample Standard Deviation: ", sd_winter, "\n")
cat("      Proportion of Low Usage Days: ", prop_lu_winter, "\n")
cat("   ii) Spring:\n")
cat("      Mean: ", xn_spring, "\n")
cat("      Median: ", me_spring, "\n")
cat("      Sample Standard Deviation: ", sd_spring, "\n")
cat("      Proportion of Low Usage Days: ", prop_lu_spring, "\n")
cat("   iii) Summer:\n")
cat("      Mean: ", xn_summer, "\n")
cat("      Median: ", me_summer, "\n")
cat("      Sample Standard Deviation: ", sd_summer, "\n")
cat("      Proportion of Low Usage Days: ", prop_lu_summer, "\n")
cat("   iv) Autumn:\n")
cat("      Mean: ", xn_autumn, "\n")
cat("      Median: ", me_autumn, "\n")
cat("      Sample Standard Deviation: ", sd_autumn, "\n")
cat("      Proportion of Low Usage Days: ", prop_lu_autumn, "\n")
cat("\n")

cat("2. Analyzing system usage for each weather condition:\n")

