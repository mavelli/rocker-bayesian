FROM rocker/verse:3.3
MAINTAINER Damir Perisa

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
  jags \
  mercurial gdal-bin libgdal-dev gsl-bin libgsl-dev \ 
  libc6-i386

RUN wget -nd -P /tmp http://pj.freefaculty.org/Debian/squeeze/amd64/openbugs_3.2.2-1_amd64.deb
RUN dpkg -i /tmp/openbugs_3.2.2-1_amd64.deb && rm /tmp/openbugs_3.2.2-1_amd64.deb 

RUN install2.r --error \
  --repos "https://cloud.r-project.org" \
  --deps "TRUE" \
  brms \
  bayesplot \
  R2jags \  
  R2OpenBUGS \
  rgdal \
  rjags \
  rstan \
  rstanarm 
  
RUN install2.r --error \
  --repos "https://inla.r-inla-download.org/R/stable" \
  INLA
  
RUN R -e "library(devtools); devtools::install_github('mjskay/tidybayes')"
