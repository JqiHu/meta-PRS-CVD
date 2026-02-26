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

meta-PRS_CVD for individual *i*:

meta-PRS_CVD,i = (β1 Zi1 + β2 Zi2 + β3 Zi3) / sqrt(β1^2 + β2^2 + β3^2 + 2β1β2ρ12 + 2β1β3ρ13 + 2β2β3ρ23)

where Zi1, Zi2, Zi3 are standardized PRS_CAD, PRS_IS, and PRS_HF; β are Cox regression coefficients; and ρ are Pearson correlations between standardized PRS components.

## Files

- `parameters/beta_estimates.csv`: meta-PRS coefficients (β)
- `parameters/correlation_matrix.csv`: correlations among standardized PRS (ρ)
- `example/example_metaPRS_calculation.R`: example script to compute meta-PRS_CVD

## Notes

- Each component PRS should be standardized (mean=0, SD=1) in the target dataset prior to computing meta-PRS.
- The denominator is constant given β and ρ, and ensures meta-PRS is on a comparable scale.
- This meta-PRS was derived and validated in individuals of European ancestry. Its performance and calibration may not generalize to other ancestral populations.
