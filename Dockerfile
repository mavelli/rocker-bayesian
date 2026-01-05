FROM rocker/verse:latest
LABEL maintainer="Damir Perisa"

ENV CRAN_REPO="https://stat.ethz.ch/CRAN/"
ENV INLA_REPO="https://inla.r-inla-download.org/R/testing"
RUN echo "options(repos = c(CRAN = \"$CRAN_REPO\", INLA = \"$INLA_REPO\"))" >> /usr/local/lib/R/etc/Rprofile.site

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
  jags \
  mercurial gdal-bin libgdal-dev gsl-bin libgsl-dev \ 
  libc6-i386 \
  libudunits2-dev \
  build-essential gcc-multilib

RUN wget -nd -P /tmp https://github.com/chjackson/openbugsdoc/raw/refs/heads/main/OpenBUGS-3.2.3.tar.gz
RUN tar -xvzf /tmp/OpenBUGS-3.2.3.tar.gz
RUN cd OpenBUGS-3.2.3 && ./configure
RUN cd OpenBUGS-3.2.3 && make
RUN cd OpenBUGS-3.2.3 && sudo make install

RUN install2.r --error \
  -n -1 \
  posterior \
  rstan \
  rstantools \ 
  rstanarm \
  bayesplot \
  brms \
  tidybayes \
  sp \
  fmesher  \
  rjags \
  R2jags \  
  blavaan \
  R2OpenBUGS \
  MatrixModels \
  INLA \
  ggdist
  
