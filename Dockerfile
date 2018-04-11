FROM rocker/verse:latest
MAINTAINER Damir Perisa

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
  jags \
  mercurial gdal-bin libgdal-dev gsl-bin libgsl-dev \ 
  libc6-i386

RUN wget http://pj.freefaculty.org/Debian/squeeze/amd64/openbugs_3.2.2-1_amd64.deb /tmp
RUN dpkg -i /tmp/openbugs_3.2.2-1_amd64.deb

RUN install2.r --error \
  R2jags \
  rjags \
  rgdal \
  R2OpenBUGS 
  
RUN R -e "install.packages('rstan', repos = 'https://cloud.r-project.org/', dep = TRUE)"
RUN R -e "install.packages('INLA', repos = c(getOption('repos'), INLA = 'https://inla.r-inla-download.org/R/stable'), dep = TRUE)"
