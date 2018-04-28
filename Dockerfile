FROM ubuntu:14.04.4

RUN apt-get update && apt-get install -y wget

#update system timezone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" >> /etc/timezone

#Install MariaDB
RUN apt-get update && apt-get -y install mariadb-server supervisor; mkdir -p /var/log/supervisor

ADD sql/*               /opt/
ADD /conf/my.cnf        /opt/
ADD /conf/mariadb.conf  /etc/supervisor/conf.d/mariadb.conf

#update mysql database
RUN /etc/init.d/mysql start &&\
    mysqladmin -u root password "123456" &&\
    mysql -uroot -p123456 mysql < /opt/initDatabase.sql

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]
CMD ["/usr/bin/supervisord"]
EXPOSE 3306
