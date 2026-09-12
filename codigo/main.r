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
cat("a) Students Numbers of Group:\n")
cat("   Alexandre Grandgeiro:", alexandre_sn, "\n")
cat("   Bruno Lage:", bruno_sn, "\n")
cat("   Danny Secundino:", danny_sn, "\n")
cat("   Saulo Gomes:", saulo_sn, "\n")
cat("\n")

cat("b) Highest student number: M =", M, "\n")
cat("\n")

cat("c) Start of group's dataset: r =", r, "\n")
cat("\n")

cat("d) Date of first observation:", data_group[1, "dteday"], "\n")
cat("   Date of last observation:", data_group[300, "dteday"], "\n")
cat("\n")

cat("e) The R code used to construct data_group is the code running right now.\n")
cat("\n\n")

# =========================
# Second Question
# =========================
