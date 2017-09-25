FROM centos:7

RUN yum -y install yum-priorities

# EPEL
RUN yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm

# Basic dependencies
RUN yum -y install \
           attr \
           cmake \
           compat-expat1 \
           compat-openldap \
           expat \
           freetype \
           gcc \
           glibc-headers \
           man \
           quota \
           time \
           unzip \
           wget &&\
    yum -y update && \
    yum clean all

# miniconda
ENV PATH /opt/conda/bin:$PATH
RUN wget -nv http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /opt/conda &&\
    conda config --set always_yes yes --set changeps1 no &&\
    conda config --add channels http://conda.anaconda.org/NLeSC &&\
    conda config --set show_channel_urls yes &&\
    conda update -qy conda &&\
    conda install -y conda-build
