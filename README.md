# rocker-bayesian

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

[![](https://images.microbadger.com/badges/version/mavelli/rocker-bayesian.svg)](https://microbadger.com/images/mavelli/rocker-bayesian "Get your own version badge on microbadger.com") - [![](https://images.microbadger.com/badges/image/mavelli/rocker-bayesian.svg)](https://microbadger.com/images/mavelli/rocker-bayesian "Get your own image badge on microbadger.com")


## What is inside
This is a Docker Image for a RStudio environement based on 
[rocker/verse](https://hub.docker.com/r/rocker/verse/) from the awesome [Rocker Project](https://www.rocker-project.org/) with the following Tools added for Bayesian modelling:

* [JAGS is Just Another Gibbs Sampler](http://mcmc-jags.sourceforge.net/)  
* [rjags](https://cran.r-project.org/web/packages/rjags/index.html)
* [R2jags](https://cran.r-project.org/web/packages/R2jags/index.html)
* [RStan](http://mc-stan.org/users/interfaces/rstan)
* [rstanarm](https://cran.r-project.org/web/packages/rstanarm/index.html)
* [INLA](http://www.r-inla.org/)
* [OpenBUGS](http://www.openbugs.net)
* [R2OpenBUGS](https://cran.r-project.org/web/packages/R2OpenBUGS/index.html)
* [bayesplot](https://github.com/stan-dev/bayesplot)
* [tidybayes](https://github.com/mjskay/tidybayes)
* [brms](https://github.com/paul-buerkner/brms)

## How to use it
Since this image is based on [rocker/verse](https://hub.docker.com/r/rocker/verse/), I suggest their excellent documentation on how to use it:
[Using the RStudio image](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image)

in a nutshell:

get the image from docker hub:
```bash
docker pull mavelli/rocker-bayesian
```
run a container:
```bash
docker run -d -p 8787:8787 mavelli/rocker-bayesian
```
connect to rstudio in a webbrowser at
```url
localhost:8787
```
