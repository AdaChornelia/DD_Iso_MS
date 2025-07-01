# Eurasia Isoscape

Fitting geostatistical model summary

```
### spaMM summary of the fit of the mean model ### 

formula: mean_source_value ~ 1 + elev + lat_abs + (1 | source_ID) + Matern(1 | 
    long + lat)
REML: Estimation of corrPars and lambda by REML.
      Estimation of fixed effects by ML.
Estimation of lambda by 'outer' REML, maximizing Re.logL.
family: gaussian( link = identity ) 
 ------------ Fixed effects (beta) ------------
              Estimate  Cond. SE  t-value
(Intercept) -19.734354 4.424e+01  -0.4461
elev         -0.008495 7.716e-04 -11.0095
lat_abs      -1.319228 4.627e-01  -2.8509
 --------------- Random effects ---------------
Family: gaussian( link = identity ) 
Distance(s): Earth 
                   --- Correlation parameters:
        2.nu        2.rho 
4.900691e-01 5.601618e-05 
           --- Variance parameters ('lambda'):
lambda = var(u) for u ~ Gaussian; 
   source_ID  :  1e-05 
   long + lat  :  2657  
# of obs: 375; # of groups: source_ID, 375; long + lat, 375 
 -------------- Residual variance  ------------
Prior weights: 355 382 2 5 27 ...
phi was fixed [through  "phi" ~ 0 + offset(pred_disp) ] to 269.209 353.05 319.299 259.895 442.366 ...
 ------------- Likelihood values  -------------
                        logLik
logL       (p_v(h)): -1344.630
Re.logL  (p_b,v(h)): -1346.059
NULL


### spaMM summary of the fit of the residual dispersion model ### 

formula: var_source_value ~ 1 + (1 | source_ID) + Matern(1 | long + lat)
Estimation of corrPars and lambda by REML (p_bv approximation of Re.logL).
Estimation of fixed effects by ML (p_v approximation of logL).
Estimation of lambda by 'outer' REML, maximizing Re.logL.
family: Gamma( link = log ) 
 ------------ Fixed effects (beta) ------------
            Estimate Cond. SE t-value
(Intercept)    5.899    2.225   2.651
 --------------- Random effects ---------------
Family: gaussian( link = identity ) 
Distance(s): Earth 
                   --- Correlation parameters:
        2.nu        2.rho 
3.143464e-01 7.996763e-06 
           --- Variance parameters ('lambda'):
lambda = var(u) for u ~ Gaussian; 
   source_ID  :  0.0009159 
   long + lat  :  5.78  
# of obs: 372; # of groups: source_ID, 372; long + lat, 372 
 --- Residual variation ( var = phi * mu^2 )  --
Prior weights: 354 381 1 4 26 ...
phi was fixed to 2 
 ------------- Likelihood values  -------------
                        logLik
logL       (p_v(h)): -2528.664
Re.logL  (p_b,v(h)): -2526.946
2.rho are at their lower optimization bound. 
NULL

[models fitted with spaMM version 3.13.0] 

NULL
```
