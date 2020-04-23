# KALI LINUX BASE IMAGE:LATEST
FROM kalilinux/kali-rolling:latest

# MAINTAINER: DZASTERABZ
LABEL maintainer="abhiramonmail@gmail.com"

# JUMP TO
ENV HOME /root

# BASH RESPONSE
ENV DEBIAN_FRONTEND=noninteractive

# PRESENT WORKING DIRECTORY
WORKDIR /root

# ALL CONFIGURATIONS
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove
RUN mkdir ${HOME}/Toolkit && \
    mkdir ${HOME}/Wordlist
RUN apt-get -y update && \
    apt-get -y full-upgrade && \
    apt-get install -y --no-install-recommends \
    build-essential \
    tmux \
    gcc \
    pluma \
    nano \
    git \
    wget \
    python3 \
    python3-pip \
    python \
    python-pip \
    curl \
    make \
    man-db \
    net-tools \
    tzdata \
    nmap \
    whois \
    nikto \
    perl \
    dnsutils \
    dirb \
    exploitdb \
    wpscan \
    uniscan \

# PYTHON CONFIGURATION
RUN python -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools

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

RUN cd /opt && \
    sudo git clone https://github.com/rapid7/metasploit-framework.git && \
    sudo chown -R 'whoami' /opt/metasploit-framework && \
    cd metasploit-framework && \
    sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'

RUN echo "export PATH=$PATH:/usr/lib/postgresql/10/bin" >> ~/.bashrc && \
    . ~/.bashrc && \
    usermod -a -G postgres whoami && \
    su - 'whoami' && \
    cd /opt/metasploit-framework/ && \
    ./msfdb init

# TIMEZONE DATA
RUN ln -fs /usr/share/zoneinfo/Asia/Calcutta /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata
    
# SEARCHSPLOIT-EXPLOITDB
RUN apt-get -y install exploitdb-bin-sploits \ 
    exploitdb-papers

# INSTASAVE
RUN git clone https://github.com/sameera-madushan/InstaSave.git && \
    cd InstaSave && \
    pip3 install -r requirements.txt

# FINAL RECON
RUN git clone https://github.com/thewhiteh4t/FinalRecon.git && \
    cd FinalRecon && \
    pip3 install -r requirements.txt

# OWASP MARYAM
RUN git clone https://github.com/saeeddhqan/Maryam.git && \
    cd Maryam && \
    pip install -r requirements.txt && \
    chmod +x maryam

# WEBKILLER
RUN git clone https://github.com/ultrasecurity/webkiller.git && \
    cd webkiller && \
    pip3 install -r requirements.txt && \
    chmod +x webkiller.py

# PULSAR
RUN git clone https://github.com/pulsar && \
    cd pulsar && \
    chmod +x install.sh && \
    ./install.sh

# SECLIST
RUN apt-get -y install seclists

# XSSER
RUN apt-get -y install python3-pycurl \
    python3-bs4 \
    python3-geoip \
    python3-geoip2 \
    python3-gi \
    python3-cairocffi \
    python3-selenium \
    firefoxdriver

# XSPEAR
RUN gem install XSpear && \
    gem install colorize && \
    gem install selenium-webdriver && \
    gem install terminal-table && \
    gem install progress_bar

# XXSTRIKE
RUN git clone https://github.com/s0md3v/XSStrike && \
    pip3 install fuzzywuzzy && \
    pip3 install python-levenshtein && \
    pip3 install prettytable && \
    pip3 install requests

# ZAP CLI
RUN pip install --upgrade zapcli

# RAPIDSCAN
RUN wget -O rapidscan.py https://raw.githubusercontent.com/skavngr/rapidscan/master/rapidscan.py && chmod +x rapidscan.py

# STRIKER
RUN git clone https://github.com/s0md3v/Striker.git

# WPSCAN
RUN git clone https://github.com/wpscanteam/wpscan && \
    cd wpscan/ && \
    bundle install && make install

# TESTSSL
RUN git clone https://github.com/s0md3v/Striker.git

# A2SV
RUN git clone https://github.com/hahwul/a2sv.git && \
    cd a2sc && \
    pip install argparse && \
    pip install netaddr && \
    apt-get install openssl

# SQLMAP
RUN git clone https://github.com/sqlmapproject/sqlmap.git sqlmap-dev

# S3SCACNNER
RUN git clone https://github.com/sa7mon/S3Scanner.git

# NOSQL
RUN git clone https://github.com/codingo/NoSQLMap.git && \
    python setup.py install

# WFUZZ
RUN pip install wfuzz

# CORSY
RUN git clone https://github.com/s0md3v/Corsy.git && \
    pip3 install tld && \
    pip3 install requests

# SILVER
RUN git clone https://github.com/s0md3v/Silver && \
    pip3 install -r requirements.txt

# MASSCAN
RUN sudo apt-get -y install git \
    gcc \
    make \
    libcap-dev && \
    git clone https://github.com/robertdavidgraham/masscan && \
    cd masscan && \
    make

# GITROB
RUN go get github.com/michenriksen/gitrob

# GITMINER
RUN git clone http://github.com/UnkL4b/GitMiner && \
    cd GitMiner && \
    pip3 install -r requirements.txt

# GOBUSTER
RUN go get github.com/OJ/gobuster

# DIRSEARCH
RUN git clone https://github.com/maurosoria/dirsearch.git && \
    cd dirsearch && \
   
# PARAMSPIDER
RUN git clone https://github.com/devanshbatham/ParamSpider && \
    cd ParamSpider && \
    pip3 install -r requirements.txt

# KNOCKPY
RUN apt-get install python-dnspython && \
    git clone https://github.com/guelfoweb/knock.git

# SUBLIST3R
RUN git clone https://github.com/aboul3la/Sublist3r.git && \
    pip install -r requirements.txt

# PHOTON
RUN git clone https://github.com/s0md3v/Photon.git

# AMASS
RUN snap install amass

# ALTDNS
RUN pip install py-altdns

# ASSETFINDER
RUN go get -u github.com/tomnomnom/assetfinder
