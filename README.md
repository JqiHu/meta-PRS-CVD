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

For individual i ,

<img src="https://latex.codecogs.com/svg.image?\mathrm{meta\text{-}PRS}_{\mathrm{CVD},i}=\frac{\beta_{\mathrm{CAD}}Z_{i,\mathrm{CAD}}+\beta_{\mathrm{IS}}Z_{i,\mathrm{IS}}+\beta_{\mathrm{HF}}Z_{i,\mathrm{HF}}}{\sqrt{\beta_{\mathrm{CAD}}^{2}+\beta_{\mathrm{IS}}^{2}+\beta_{\mathrm{HF}}^{2}+2\beta_{\mathrm{CAD}}\beta_{\mathrm{IS}}\rho_{\mathrm{CAD%2CIS}}+2\beta_{\mathrm{CAD}}\beta_{\mathrm{HF}}\rho_{\mathrm{CAD%2CHF}}+2\beta_{\mathrm{IS}}\beta_{\mathrm{HF}}\rho_{\mathrm{IS%2CHF}}}}" />

Where Z_i,CAD, Z_i,IS, and Z_i,HF are standardized PRS components (mean = 0, SD = 1) for CAD, ischemic stroke (IS), and heart failure (HF), respectively, for individual i.

beta_CAD, beta_IS, and beta_HF are Cox proportional hazards regression coefficients estimated for each standardized PRS component.

rho_CAD,IS, rho_CAD,HF, and rho_IS,HF are Pearson correlation coefficients between standardized PRS components.

## Files

- `parameters/beta_estimates.csv`: meta-PRS coefficients (β)
- `parameters/correlation_matrix.csv`: correlations among standardized PRS (ρ)
- `example/example_metaPRS_calculation.R`: example script to compute meta-PRS_CVD

## Notes

- Each component PRS should be standardized (mean=0, SD=1) in the target dataset prior to computing meta-PRS.
- The denominator is constant given β and ρ, and ensures meta-PRS is on a comparable scale.
- This meta-PRS was derived and validated in individuals of European ancestry. Its performance and calibration may not generalize to other ancestral populations.

## Citation
If you use this meta-PRS in your work, please cite:

Ye, Y., Hu, J., Pang, F., Cui, C., & Zhao, H. (2024). Genomic risk prediction of cardiovascular diseases among type 2 diabetes patients in the UK Biobank. Frontiers in Bioinformatics, 3, 1320748. https://doi.org/10.3389/fbinf.2023.1320748
