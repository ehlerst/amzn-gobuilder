FROM amazonlinux
MAINTAINER ehlerst
ENV RUBY_VERSION 2.4.0

RUN yum groupinstall 'Development Tools' -y

### List of deps from the ruby docs
RUN yum -y update && yum -y install autoconf automake bison curl-devel gcc gcc-c++ git-core httpd-devel libevent-devel libxml2 libxml2-devel mysql-devel openssl openssl-devel readline-devel sqlite-devel zlib zlib-devel libxslt libxslt-devel wget

RUN yum clean all

RUN wget --no-check-certificate https://cache.ruby-lang.org/pub/ruby/2.4/ruby-$RUBY_VERSION.tar.gz && tar -xzvf ruby-$RUBY_VERSION.tar.gz
WORKDIR ruby-$RUBY_VERSION
RUN ./configure && make && make install
WORKDIR /

# Bundler install
RUN gem install bundler --no-document

# Install some tools for building
RUN gem install fpm pleaserun
