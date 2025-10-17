# Isoscape-Data Descriptor

## About
Resources for Data Descriptor: Asia Isoscape Manuscript

## Read More, Citation:
When using these sources, please cite the article below:



Chornelia, A. & Hughes, A.C. 20xx. Stable hydrogen isotope signatures in tropical bat hair and the Asian Isoscape: A dataset to advance regional migration research. In Review

Chornelia, A., Lu, J., & Hughes, A. C. (2025). Following the Flight of Asian Bats: Stable Hydrogen Isotope Analysis Uncovers Bat Migration Patterns, and Promising Future Directions. Journal of Biogeography, 52(11), e70063. https://doi.org/10.1111/jbi.70063



![Deuterium](https://github.com/AdaChornelia/DD_Iso_MS/blob/main/Figures/DeuteriumSymbol.png "Deuterium")


## Files
|No | File name | Details |
|--|-------------|----------|
|1 | EurasiaFit.md | Summary of geostatistical model fit results for the Eurasia isoscape/continental|
|2 | AsiaFit.md | Summary of geostatistical model fit results for the Asia isoscape |
|3 | SEAsiaFit.md | Summary of geostatistical model fit results for the Southeast Asia isoscape |
|4 | R_Script_Eurasia_Isoscape.Rmd | R markdown |
|5 | R_Script_Asia_Isoscape.Rmd | R markdown |
|6 | R_Script_SEAsia_Isoscape.Rmd | R markdown |
|7 | Elevation-raster-summary.md | structural raster summary for all three isoscapes |
|8 | allscript.R | R script to process raw data---building the isoscape |

Note: read more in IsoriX documentation for a detailed explanation 


## Analysis Workflow
In summary, the workflow includes: 
1) Loading the aggregate data (.csv files)
2) Running the geostatistical model (mixed-effect model) or loading a pre-fitted model from .rda file
3) Preparing the elevation raster (loading and aggregating)
4) Making predictions to construct the isoscape
6) Exporting the isoscape file to GIS and generating plot


## Comparisons interpretation between models (Eurasia Fit, Asia Fit and SE Asia Fit)
Please refers to the files: EurasiaFit.md, AsiaFit.md, and SEAsiaFit.md

### Results

### Overview

We analyzed three sets of spaMM model outputs, each comprising a mean model (Gaussian mixed model) and a residual dispersion model (Gamma mixed model), fitted to datasets of varying sizes (375, 172, and 108 observations, respectively). All models included fixed effects for elevation (`elev`) and absolute latitude (`lat_abs`), random effects for `source_ID`, and spatial correlation structured by a Matern covariance on the longitude and latitude coordinates. The following sections summarize and compare the main findings across these models.

---
```
### Mean Model Summaries

#### Fixed Effects

- **Elevation (`elev`)** consistently showed a significant negative association with the mean source value across all three models:
  - Model 1: estimate = −0.0085 (t = −11.01, n = 375)
  - Model 2: estimate = −0.0079 (t = −6.24, n = 172)
  - Model 3: estimate = −0.0105 (t = −7.38, n = 108)
  This indicates that higher elevations are robustly associated with reduced mean source values, regardless of dataset size.

- **Absolute Latitude (`lat_abs`)** also had a negative coefficient in all models, but its statistical significance and magnitude varied:
  - Model 1: estimate = −1.32 (t = −2.85) — significant effect
  - Model 2: estimate = −1.31 (t = −2.06) — marginally significant
  - Model 3: estimate = −0.12 (t = −0.71) — not significant
  The effect of latitude appears to diminish as sample size decreases, possibly reflecting reduced power or increased heterogeneity in the smaller datasets.

- **Intercepts** varied between models, with the largest negative value in Model 3 (−29.84), followed by Model 1 (−19.73) and Model 2 (−18.72). None were statistically significant, suggesting no strong baseline offset.

#### Random Effects & Spatial Structure

- **Source-Level Random Effects** exhibited minimal variance in all mean models (`lambda` = 1e−5), indicating that most between-source variability is accounted for by fixed and spatial effects.

- **Spatial Random Effects** (variance for `long + lat`) decreased with sample size:
  - Model 1: 2657 (n = 375)
  - Model 2: 1740 (n = 172)
  - Model 3: 62.96 (n = 108)
  This suggests that spatial structure was strongest in the largest dataset, but less pronounced as sample size decreased, potentially due to reduced spatial coverage or increased noise.

- **Matern Correlation Parameters** provide insight into the spatial dependence structure of the data. The parameter 2.rho represents the spatial range, with smaller values indicating that spatial correlation diminishes quickly as the distance between points increases. In all three models, 2.rho was consistently small (ranging from approximately 5.6e-5 in Model 1, 1.2e-4 in Model 2, to 2.8e-3 in Model 3), suggesting that the influence of spatial proximity on the response variable is localized—i.e., only observations that are very close in geographic space exhibit substantial correlation, while observations further apart are essentially independent. This rapid decay in spatial correlation may reflect underlying environmental heterogeneity or localized ecological processes.

  The smoothness parameter, 2.nu, controls how "smooth" or "rough" the spatial process is. Models 1 and 2 had similar values (approximately 0.49 and 0.5, respectively), indicating a moderately smooth spatial field where changes in the response variable occur gradually over space. In contrast, Model 3 had a much lower 2.nu (approximately 0.06), indicative of a rougher spatial field with more abrupt changes over short spatial scales. This difference in smoothness may be attributable to reduced sample size and spatial coverage in Model 3, which can limit the model's ability to detect gradual spatial trends and instead emphasize local variation. Overall, these results highlight that both the scale and texture of spatial correlation can vary with data density and spatial sampling, and careful interpretation of Matern parameters is warranted, particularly in studies with limited spatial extent or sample size.

#### Model Fit

- **Log-Likelihoods** decreased with sample size, consistent with the reduced number of observations:
  - Model 1: −1344.63 (n = 375)
  - Model 2: −633.84 (n = 172)
  - Model 3: −391.66 (n = 108)

---

### Residual Dispersion Model Summaries

#### Fixed Effects

- **Intercepts** for the variance models were all positive and statistically significant, with the estimated values increasing slightly across models (5.90, 6.04, 6.26), suggesting a stable baseline variance structure.

#### Random Effects & Spatial Structure

- **Source-Level Random Effects** (`lambda`) were low but non-negligible in Models 2 and 3 (3.44e−5 and 2.87e−5), slightly higher than in Model 1 (9.16e−4), suggesting modest between-source variance in residual dispersion.

- **Spatial Random Effects** (variance for `long + lat`) were highest in Model 1 (5.78), and much lower in Models 2 (1.59) and 3 (1.08), paralleling the trend observed in the mean models.

- **Matern Correlation Parameters** again indicated rapid spatial decay, with 2.rho at the lower optimization bound in some models, signaling potential boundary estimation issues in spatial range.

#### Model Fit

- **Log-Likelihoods** for the dispersion models also tracked sample size:
  - Model 1: −2528.66 (n = 372)
  - Model 2: −1176.12 (n = 172)
  - Model 3: −753.86 (n = 108)

---

### Comparative Interpretation

Across all three datasets, the effect of elevation on mean source value was strong, stable, and negative, while the effect of latitude was less consistent, losing significance in the smallest dataset. Spatial structure, as captured by random effects variance and Matern correlation parameters, was most pronounced in the largest dataset, suggesting that sufficient sample size is critical for detecting and modeling spatial patterns. As sample size decreased, both fixed effect precision and spatial variance estimates declined, likely due to reduced information and potential edge effects.

The residual dispersion (variance) models indicated persistent baseline heterogeneity in source value variance, with evidence for modest but non-negligible between-source and spatial variance, though both declined with sample size. Boundary issues in spatial range estimation were noted in some dispersion models and should be interpreted cautiously.

---

### Conclusions

These analyses demonstrate that spatially explicit mixed models are essential for capturing both central tendencies and heterogeneity in environmental data. Elevation consistently predicts lower mean source values, while latitude effects are more sample-dependent. Spatial structure is robustly detected in larger datasets but attenuates with smaller samples. Modeling residual variance with spatial and random effects reveals persistent heterogeneity, though precise estimation may be challenged by sample size and spatial coverage.

---

### Suggestions for Future Studies

- **Increase Spatial and Sample Coverage:** Future research should prioritize expanding both the geographic extent and the number of observations to improve the detection and modeling of spatial structure, ensuring that spatial correlation parameters are reliably estimated.
- **Explore Additional Environmental Predictors:** Incorporate other potentially relevant covariates (e.g., land cover, climate variables, anthropogenic factors) to better explain variation in mean and variance of source values.
- **Model Nonlinear and Interaction Effects:** Investigate whether nonlinear relationships or interactions between elevation, latitude, and other predictors exist, as these may reveal more complex ecological patterns.
- **Assess Temporal Variation:** If temporal data are available, extend the modeling framework to incorporate temporal random effects or spatiotemporal models to capture potential seasonal or interannual dynamics.
- **Consider Alternative Spatial Covariance Structures:** Compare the performance of the Matern correlation with alternative spatial covariance functions to assess the robustness of spatial parameter estimates and model fit.
- **Address Edge and Boundary Effects:** Conduct sensitivity analyses or apply methods to mitigate boundary effects, especially when working with smaller datasets or limited spatial coverage.
- **Validate and Test Model Generalizability:** Apply the modeling approach to independent or cross-validated datasets to assess the generalizability and predictive performance of the models.
- **Incorporate Hierarchical or Multi-scale Structures:** Explore hierarchical or multi-scale spatial models to capture variation at different spatial resolutions (e.g., nested spatial units, regional effects).
- **Quantify Uncertainty in Spatial Parameters:** Use Bayesian approaches or bootstrapping to better quantify uncertainty in spatial correlation and variance estimates, especially in smaller samples.
- **Communicate Ecological and Management Implications:** Relate spatial modeling results to practical ecological questions or management decisions, highlighting areas of high uncertainty or spatial heterogeneity that may warrant focused investigation.

```

## Citation.
Chornelia, A., Lu, J., & Hughes, A. C. (2025). Following the Flight of Asian Bats: Stable Hydrogen Isotope Analysis Uncovers Bat Migration Patterns, and Promising Future Directions. Journal of Biogeography, 52(11), e70063. https://doi.org/10.1111/jbi.70063
