# KALI LINUX AS BASE IMAGE
FROM kalilinux/kali-rolling:latest

# DOCKERFILE OWNER-MAINTAINER
LABEL maintainer="DzasterAbz"

# DEFAULT ENVIRONMENT
ENV HOME /root

# GET NON-INTERACTIVE SHELL
ENV DEBIAN_FRONTEND = noninteractive

# CONTAINER LABEL
CMD ["echo", "Welcome to DzasterAbz WAPT & BugBounty Toolkit - Version 1.0"]
CMD ["echo", "============================================================"]
CMD ["echo", "Inspired by Hackersploit - AlexisAhmed"]

# CREATING DIRECTORIES
RUN mkdir ${HOME}/Tools && \
    mkdir ${HOME}/Wordlists && \
    mkdir ${HOME}/Bookmarks-Cheatsheets && \
    mkdir ${HOME}/Tips-Methodologies && \
    mkdir ${HOME}/WorkingDirectory

# DEFAULT WORKING LOCATION
WORKDIR ${HOME}/WorkingDirectory

# OPEN PORTS
EXPOSE 80/tcp 443/tcp

# TIMEZONE DATA
RUN ln -fs /usr/share/zoneinfo/Asia/Calcutta /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# WORDLISTS
RUN apt-get -y install seclists \
    jq

# BASIC TOOLS
RUN apt-get update && \
    apt-get upgrade && \
    apt-get full-upgrade && \
    apt-get install -y --no-install-recommends \
    build-essentials \
    tmux \
    gcc \
    iputils \
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

# MAIN TOOLS
RUN apt-get install nmap \
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
    exploitdb \
    exploitdb-bin-sploits \
    exploitdb-papers \
    gobuster \
    hashcat \
    sslscan \
    hydra \
    w3af-console \
    wireshark \
    tcpdump \
    tshark \
    arachni \
    websploit \
    theharvester \
    routersploit \
    snort \
    masscan \
    metasploit-framework

# METASPLOIT WITH DEPENDENCIES
RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get -y update && \
    apt-get -y install oracle-java8-installer && \
    apt-get -y update && \
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
    pgadmin3 \
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
    # SQLMAP
    sqlmap \
    # DIRB
    dirb \
    # DNSENUM
    cpanminus \
    # WFUZZ
    python-pycurl \
    # KNOCK
    python-dnspython \
    # MASSDNS
    libldns-dev \
    # WPSCAN
    libcurl4-openssl-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    ruby-dev \
    libgmp-dev \
    zlib1g-dev \
    # MASSCAN
    libpcap-dev \
    # THEHARVEST
    python3.7 \
    # JOOMSCAN
    libwww-perl \
    # HYDRA
    hydra \
    # DNSRECON
    dnsrecon \
    # ZSH
    powerline\
    # ZSH
    fonts-powerline\
    && rm -rf /var/lib/apt/lists/*

# # INSTASAVE
# RUN git clone https://github.com/sameera-madushan/InstaSave.git && \
#     cd InstaSave && \
#     pip3 install -r requirements.txt

# # FINAL RECON
# RUN git clone https://github.com/thewhiteh4t/FinalRecon.git && \
#     cd FinalRecon && \
#     pip3 install -r requirements.txt

# # OWASP MARYAM
# RUN git clone https://github.com/saeeddhqan/Maryam.git && \
#     cd Maryam && \
#     pip install -r requirements.txt && \
#     chmod +x maryam

# # WEBKILLER
# RUN git clone https://github.com/ultrasecurity/webkiller.git && \
#     cd webkiller && \
#     pip3 install -r requirements.txt && \
#     chmod +x webkiller.py

# # PULSAR
# RUN git clone https://github.com/pulsar && \
#     cd pulsar && \
#     chmod +x install.sh && \
#     ./install.sh

# # XSSER
# RUN apt-get -y install python3-pycurl \
#     python3-bs4 \
#     python3-geoip \
#     python3-geoip2 \
#     python3-gi \
#     python3-cairocffi \
#     python3-selenium \
#     firefoxdriver \
#     xsser

# # XSPEAR
# RUN gem install XSpear && \
#     gem install colorize && \
#     gem install selenium-webdriver && \
#     gem install terminal-table && \
#     gem install progress_bar

# # XXSTRIKE
# RUN git clone https://github.com/s0md3v/XSStrike && \
#     pip3 install fuzzywuzzy && \
#     pip3 install python-levenshtein && \
#     pip3 install prettytable && \
#     pip3 install requests

# # ZAPCLI
# RUN pip install --upgrade zapcli

# # RAPIDSCAN
# RUN wget -O rapidscan.py https://raw.githubusercontent.com/skavngr/rapidscan/master/rapidscan.py && chmod +x rapidscan.py

# # STRIKER
# RUN git clone https://github.com/s0md3v/Striker.git

# # WPSCAN
# RUN git clone https://github.com/wpscanteam/wpscan && \
#     cd wpscan/ && \
#     bundle install && make install

# # TESTSSL
# RUN git clone https://github.com/s0md3v/Striker.git

# # A2SV
# RUN git clone https://github.com/hahwul/a2sv.git && \
#     cd a2sc && \
#     pip install argparse && \
#     pip install netaddr && \
#     apt-get install openssl

# # SQLMAP
# RUN git clone https://github.com/sqlmapproject/sqlmap.git sqlmap-dev

# # S3SCACNNER
# RUN git clone https://github.com/sa7mon/S3Scanner.git

# # NOSQL
# RUN git clone https://github.com/codingo/NoSQLMap.git && \
#     python setup.py install

# # WFUZZ
# RUN pip install wfuzz

# # CORSY
# RUN git clone https://github.com/s0md3v/Corsy.git && \
#     pip3 install tld && \
#     pip3 install requests

# # SILVER
# RUN git clone https://github.com/s0md3v/Silver && \
#     pip3 install -r requirements.txt

# # MASSCAN
# RUN sudo apt-get -y install git \
#     gcc \
#     make \
#     libcap-dev && \
#     git clone https://github.com/robertdavidgraham/masscan && \
#     cd masscan && \
#     make

# # GITROB
# RUN go get github.com/michenriksen/gitrob

# # GITMINER
# RUN git clone http://github.com/UnkL4b/GitMiner && \
#     cd GitMiner && \
#     pip3 install -r requirements.txt

# # GOBUSTER
# RUN go get github.com/OJ/gobuster

# # DIRSEARCH
# RUN git clone https://github.com/maurosoria/dirsearch.git
   
# # PARAMSPIDER
# RUN git clone https://github.com/devanshbatham/ParamSpider && \
#     cd ParamSpider && \
#     pip3 install -r requirements.txt

# # KNOCKPY
# RUN apt-get install python-dnspython && \
#     git clone https://github.com/guelfoweb/knock.git

# # SUBLIST3R
# RUN git clone https://github.com/aboul3la/Sublist3r.git && \
#     pip install -r requirements.txt

# # PHOTON
# RUN cd ${HOME}/Toolkit && \
#     git clone https://github.com/s0md3v/Photon.git && \
#     cd Photon && \
#     chmod +x photon.py && \
#     ln -sf ${HOME}/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer

# AMASS
RUN snap install amass

# ALTDNS
RUN pip install py-altdns

# # VULNERABLE SITES FOR TESTING & LEARNING
# RUN docker pull vulnerables/web-dvwa # docker run -p 80:80 vulnerables/web-dvwa
# RUN docker pull szsecurity/mutillidae  # docker run -p 1337:80 szsecurity/mutlilidae
# RUN docker pull szsecurity/webgoat # docker run -p 1337:80 szsecurity/webgoat
# RUN docker pull raesene/bwapp

# Git Repository for PentestLab Management
RUN git clone https://github.com/eystsen/pentestlab.git


