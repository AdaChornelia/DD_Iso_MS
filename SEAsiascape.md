# SEAsiascape 
5°N-32°N and 90°E-123°E

Result for SE Asia isoscape, geostatistical model fit

```
### spaMM summary of the fit of the mean model ### 

formula: mean_source_value ~ 1 + elev + lat_abs + (1 | source_ID) + Matern(1 | 
    long + lat)
REML: Estimation of corrPars and lambda by REML.
      Estimation of fixed effects by ML.
Estimation of lambda by 'outer' REML, maximizing restricted logL.
family: gaussian( link = identity ) 
 ------------ Fixed effects (beta) ------------
             Estimate Cond. SE t-value
(Intercept) -29.84282  3.72780 -8.0055
elev         -0.01047  0.00142 -7.3762
lat_abs      -0.11847  0.16687 -0.7099
 --------------- Random effects ---------------
Family: gaussian( link = identity ) 
Distance(s): Earth 
                   --- Correlation parameters:
       2.nu       2.rho 
0.056822976 0.002784519 
           --- Variance parameters ('lambda'):
lambda = var(u) for u ~ Gaussian; 
   source_ID  :  1e-05 
   long + lat  :  62.96  
# of obs: 108; # of groups: source_ID, 108; long + lat, 107 
 -------------- Residual variance  ------------
Prior weights: 118 24 16 25 64 ...
phi was fixed [through  "phi" ~ 0 + offset(pred_disp) ] to 221.541 528.307 249.538 490.359 454.562 ...
 ------------- Likelihood values  -------------
                        logLik
logL       (p_v(h)): -391.6551
Re.logL  (p_b,v(h)): -397.0429
NULL


### spaMM summary of the fit of the residual dispersion model ### 

formula: var_source_value ~ 1 + (1 | source_ID) + Matern(1 | long + lat)
Estimation of corrPars and lambda by REML (P_bv approximation of restricted logL).
Estimation of fixed effects by ML (P_v approximation of logL).
Estimation of lambda by 'outer' REML, maximizing restricted logL.
family: Gamma( link = log ) 
 ------------ Fixed effects (beta) ------------
            Estimate Cond. SE t-value
(Intercept)    6.261   0.8122   7.709
 --------------- Random effects ---------------
Family: gaussian( link = identity ) 
Distance(s): Earth 
                   --- Correlation parameters:
        2.nu        2.rho 
1.455416e-01 2.685091e-05 
           --- Variance parameters ('lambda'):
lambda = var(u) for u ~ Gaussian; 
   source_ID  :  2.87e-05 
   long + lat  :  1.08  
# of obs: 108; # of groups: source_ID, 108; long + lat, 107 
 --- Residual variation ( var = phi * mu^2 )  --
Prior weights: 117 23 15 24 63 ...
phi was fixed to 2 
 ------------- Likelihood values  -------------
                       logLik
logL      (P_v(h)): -753.8564
Re.logL (P_b,v(h)): -753.1454
2.rho are at their lower optimization bound. 
NULL

[models fitted with spaMM version 4.5.0] 

```
