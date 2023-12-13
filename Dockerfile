FROM rocker/verse:latest
MAINTAINER Damir Perisa

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
  jags \
  mercurial gdal-bin libgdal-dev gsl-bin libgsl-dev \ 
  libc6-i386

RUN wget -nd -P /tmp https://www.mrc-bsu.cam.ac.uk/wp-content/uploads/2018/04/OpenBUGS-3.2.3.tar.gz
RUN tar -xvzf /tmp/OpenBUGS-3.2.3.tar.gz
RUN ./configure
RUN make
RUN sudo make install

RUN install2.r --error \
  --repos "https://stat.ethz.ch/CRAN/" \
  rstan \
  rstantools \ 
  rstanarm \
  bayesplot \
  brms \
  tidybayes
  
RUN install2.r --error \
  --repos "https://stat.ethz.ch/CRAN/" \
  rjags \
  R2jags \  
  R2OpenBUGS \
  rgdal 
  
RUN install2.r --error \
  --repos "https://inla.r-inla-download.org/R/testing" \
  INLA 
