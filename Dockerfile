# KALI LINUX AS BASE IMAGE
FROM kalilinux/kali-rolling:latest

# DOCKERFILE OWNER-MAINTAINER
LABEL maintainer="DzasterAbz"

# DEFAULT ENVIRONMENT
ENV HOME /root

# GET NON-INTERACTIVE SHELL
ENV DEBIAN_FRONTEND=noninteractive

# CREATING DIRECTORIES
RUN mkdir ${HOME}/Tools && \
    mkdir ${HOME}/WorkingDirectory

# DEFAULT WORKING LOCATION
WORKDIR ${HOME}/WorkingDirectory

# OPEN PORTS
EXPOSE 80/tcp 443/tcp

# BASIC TOOLS
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y full-upgrade && \
    apt-get install -y --no-install-recommends \
    build-essential \
    tmux \
    gcc \
    iputils* \
    dnsutils \
    net-tools \
    git \
    nano \
    gdb \
    wget \
    vim \
    curl \
    awscli \
    tzdata \
    make \
    man-db \
    python \
    python3 \
    python-pip \
    python3-pip \
    perl \
    nasm \
    openssl \
    snapd \
    zsh \
    openjdk-8-jre \
    ruby \
    postgresql \
    && rm -rf /var/lib/apt/lists/*

# PYTHON CONFIGURATION
RUN python -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools

# ADDITIONAL DOCKER ISSUES
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get install -y -q && \
    apt-get install -y  apt

# MAIN TOOLS
RUN apt-get update && apt-get full-upgrade && apt-get install -y --no-install-recommends \
    nmap \
    whois \
    nikto \
    dirb \
    sublist3r \
    zaproxy \
    whatweb \
    dirbuster \
    sqlmap \
    wpscan \
    uniscan \
    gobuster \
    hashcat \
    sslscan \
    hydra \
    wireshark \
    tcpdump \
    tshark \
    websploit \
    theharvester \
    routersploit \
    masscan \
    metasploit-framework

# METASPLOIT WITH DEPENDENCIES
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential \
    libreadline-dev \
    libssl-dev \
    libpq5 \
    libpq-dev \
    libreadline5 \
    libsqlite3-dev \
    libpcap-dev \
    git-core \
    autoconf \
    postgresql \
    curl \
    zlib1g-dev \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    gawk \
    bison \
    libffi-dev \
    libgdbm-dev \
    libncurses5-dev \
    libtool \
    sqlite3 \
    libgmp-dev \
    gnupg2 \ 
    dirmngr

# INSTALLING DEPENDENCIES (Cloned from AlexisAhmed)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sqlmap \
    dirb \
    cpanminus \
    libldns-dev \
    libcurl4-openssl-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    ruby-dev \
    libgmp-dev \
    zlib1g-dev \
    libpcap-dev \
    libwww-perl \
    hydra \
    dnsrecon \
    powerline\
    fonts-powerline\
    && rm -rf /var/lib/apt/lists/*

# WPSCAN
RUN gem install wpscan

## PENTESTING LABS
# Git Repository for PentestLab Management
RUN git clone https://github.com/eystsen/pentestlab.git


