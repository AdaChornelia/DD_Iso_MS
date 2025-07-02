# Result of Asia isoscape geostatistical model fit
Isoscape 2
10S-60N, and 70E-140E


Summary

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
(Intercept) -18.718811 36.00992 -0.5198
elev         -0.007927  0.00127 -6.2428
lat_abs      -1.312892  0.63615 -2.0638
 --------------- Random effects ---------------
Family: gaussian( link = identity ) 
Distance(s): Earth 
                   --- Correlation parameters:
        2.nu        2.rho 
0.5000000000 0.0001179848 
           --- Variance parameters ('lambda'):
lambda = var(u) for u ~ Gaussian; 
   source_ID  :  1e-05 
   long + lat  :  1740  
# of obs: 172; # of groups: source_ID, 172; long + lat, 172 
 -------------- Residual variance  ------------
Prior weights: 27 5 118 9 39 ...
phi was fixed [through  "phi" ~ 0 + offset(pred_disp) ] to 443.93 865.985 230.928 559.688 358.371 ...
 ------------- Likelihood values  -------------
                        logLik
logL       (p_v(h)): -633.8433
Re.logL  (p_b,v(h)): -634.7446
NULL


### spaMM summary of the fit of the residual dispersion model ### 

formula: var_source_value ~ 1 + (1 | source_ID) + Matern(1 | long + lat)
Estimation of corrPars and lambda by REML (P_bv approximation of restricted logL).
Estimation of fixed effects by ML (P_v approximation of logL).
Estimation of lambda by 'outer' REML, maximizing restricted logL.
family: Gamma( link = log ) 
 ------------ Fixed effects (beta) ------------
            Estimate Cond. SE t-value
(Intercept)    6.035   0.8326   7.248
 --------------- Random effects ---------------
Family: gaussian( link = identity ) 
Distance(s): Earth 
                   --- Correlation parameters:
        2.nu        2.rho 
0.5000000000 0.0002017756 
           --- Variance parameters ('lambda'):
lambda = var(u) for u ~ Gaussian; 
   source_ID  :  3.439e-05 
   long + lat  :  1.592  
# of obs: 172; # of groups: source_ID, 172; long + lat, 172 
 --- Residual variation ( var = phi * mu^2 )  --
Prior weights: 26 4 117 8 38 ...
phi was fixed to 2 
 ------------- Likelihood values  -------------
                       logLik
logL      (P_v(h)): -1176.123
Re.logL (P_b,v(h)): -1175.387
NULL

[models fitted with spaMM version 4.5.0] 

NULL
```
