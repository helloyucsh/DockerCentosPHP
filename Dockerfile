FROM centos:latest
MAINTAINER http://www.centos.org
LABEL Vendor="CentOS"
LABEL License=GPLv2
LABEL Version=2.4.6-31

RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all
RUN yum -y install php && yum clean all
RUN yum -y install php-mbstring &&  yum clean all
RUN yum -y gd mbstring pdo pdo_mysql pdo_pgsql zip  &&  yum clean all
RUN yum -y install php-mysql &&  yum clean all
RUN yum -y install procps &&  yum clean all

VOLUME /var/www/html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
