FROM ubuntu:14.04.4

MAINTAINER Rob Holmes <email@robholmes.net>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -q -y language-pack-en-base software-properties-common && \
    LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php5-5.6 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -q -y php5-cli \
                          php5-curl \
                          php5-intl \
                          php5-json \
                          php5-mcrypt && \
    apt-get install -q -y software-properties-common language-pack-en-base && \
    apt-get autoremove -q -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD php-cli.ini /etc/php5/cli/conf.d/

RUN usermod -u 1000 www-data
