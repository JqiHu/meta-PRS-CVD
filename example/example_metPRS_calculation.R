# Example: compute meta-PRS_CVD from standardized PRS components
# Inputs required:
#   - Z_CAD, Z_IS, Z_HF (standardized, mean=0 sd=1 in your dataset)
# Parameters:
#   - parameters/beta_estimates.csv
#   - parameters/correlation_matrix.csv

beta_path <- "parameters/beta_estimates.csv"
rho_path  <- "parameters/correlation_matrix.csv"

beta_df <- read.csv(beta_path, stringsAsFactors = FALSE)
rho_df  <- read.csv(rho_path, check.names = FALSE)

# vector beta in the correct order
prs_order <- c("PRS_CAD", "PRS_IS", "PRS_HF")
beta <- setNames(beta_df$beta, beta_df$prs)[prs_order]

# rho matrix
rho <- as.matrix(rho_df[ , -1])
rownames(rho) <- rho_df[[1]]
rho <- rho[prs_order, prs_order]

# --- toy input: replace with your own table ---
# a data.frame with standardized PRS columns:
dat <- data.frame(
  eid = c(1,2,3),
  Z_CAD = c(0.2, -0.1, 1.1),
  Z_IS  = c(0.4,  0.0, 0.8),
  Z_HF  = c(-0.2, 0.5, 1.3)
)

Zmat <- as.matrix(dat[, c("Z_CAD","Z_IS","Z_HF")])
colnames(Zmat) <- prs_order

# numerator for each individual
num <- as.vector(Zmat %*% beta)

# denominator (constant across individuals)
den <- sqrt(
  beta["PRS_CAD"]^2 + beta["PRS_IS"]^2 + beta["PRS_HF"]^2 +
    2*beta["PRS_CAD"]*beta["PRS_IS"]*rho["PRS_CAD","PRS_IS"] +
    2*beta["PRS_CAD"]*beta["PRS_HF"]*rho["PRS_CAD","PRS_HF"] +
    2*beta["PRS_IS"]*beta["PRS_HF"]*rho["PRS_IS","PRS_HF"]
)

dat$metaPRS_CVD <- num / den
print(dat)
