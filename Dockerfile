FROM amazonlinux
MAINTAINER Tim Ehlers <ehlerst@gmail.com>

ENV GOVERSION='1.8.1'

RUN yum groupinstall 'Development Tools' -y

### List of deps from the ruby docs
RUN yum -y update && yum -y install autoconf automake bison curl-devel gcc gcc-c++ git-core httpd-devel libevent-devel libxml2 libxml2-devel mysql-devel openssl openssl-devel readline-devel sqlite-devel zlib zlib-devel libxslt libxslt-devel wget

RUN yum -y install tar rubygem23-rake ruby23 rubygem23 ruby23-devel

RUN yum clean all

### Setup GO
RUN wget https://storage.googleapis.com/golang/go${GOVERSION}.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf go${GOVERSION}.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

RUN mkdir /.gohome

ENV GOPATH=/.gohome

### RPM dirs
RUN mkdir -p /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

# Install some tools for building
RUN gem install rake bundler 

RUN gem install rubocop fpm pleaserun
