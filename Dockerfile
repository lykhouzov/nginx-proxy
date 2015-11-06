FROM centos:7

MAINTAINER Aleksandr Lykhouzov <lykhouzov@gmail.com>

COPY ./nginx.repo /etc/yum.repos.d/nginx.repo

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
# Install PHP
&& yum -y update && yum install -y \
nginx \
&& /usr/bin/yum clean all \
&& rm -f /etc/nginx/conf.d/*

EXPOSE 80 443
CMD ["nginx","-g","daemon off;"]
