FROM amazonlinux
MAINTAINER ehlerst

RUN yum groupinstall 'Development Tools' -y

### List of deps from the ruby docs
RUN yum -y update && yum -y install autoconf automake bison curl-devel gcc gcc-c++ git-core httpd-devel libevent-devel libxml2 libxml2-devel mysql-devel openssl openssl-devel readline-devel sqlite-devel zlib zlib-devel libxslt libxslt-devel wget

RUN yum -y install ruby23 rubygem23 ruby23-devel

RUN yum clean all

# Install some tools for building
RUN gem install rubocop fpm pleaserun
