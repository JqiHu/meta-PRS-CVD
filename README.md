# Meta-PRS for Cardiovascular Disease (meta-PRS_CVD)

This repository provides parameters to compute the meta-PRS_CVD defined as a linear combination of three standardized PRS components:
- PRS_CAD (coronary artery disease)
- PRS_IS (ischemic stroke)
- PRS_HF (heart failure)

SNP weights for each component PRS are deposited in the PGS Catalog:
- PRS_CAD: PGP000740
- PRS_IS: [Available Soon]
- PRS_HF: [Available Soon]

## Formula

For individual \( i \),

\[
\text{meta-PRS}_{\mathrm{CVD}, i} =
\frac{
\beta_1 Z_{i, \mathrm{CAD}} +
\beta_2 Z_{i, \mathrm{IS}} +
\beta_3 Z_{i, \mathrm{HF}}
}{
\sqrt{
\beta_1^2 + \beta_2^2 + \beta_3^2
+ 2\beta_1\beta_2\rho_{\mathrm{CAD,IS}}
+ 2\beta_1\beta_3\rho_{\mathrm{CAD,HF}}
+ 2\beta_2\beta_3\rho_{\mathrm{IS,HF}}
}
}
\]

where:

- \( Z_{i, \mathrm{CAD}} \), \( Z_{i, \mathrm{IS}} \), and \( Z_{i, \mathrm{HF}} \) are standardized PRS components,
- \( \beta_k \) are Cox regression coefficients,
- \( \rho_{a,b} \) denotes the Pearson correlation between standardized PRS components.

## Files

- `parameters/beta_estimates.csv`: meta-PRS coefficients (β)
- `parameters/correlation_matrix.csv`: correlations among standardized PRS (ρ)
- `example/example_metaPRS_calculation.R`: example script to compute meta-PRS_CVD

## Notes

- Each component PRS should be standardized (mean=0, SD=1) in the target dataset prior to computing meta-PRS.
- The denominator is constant given β and ρ, and ensures meta-PRS is on a comparable scale.
- This meta-PRS was derived and validated in individuals of European ancestry. Its performance and calibration may not generalize to other ancestral populations.
