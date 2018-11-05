FROM docker-registry:5000/library/hcs-base:latest

# generate repo
ADD ./repo/Mariadb.repo /etc/yum.repos.d/

# install MariaDB-Galera
RUN yum install -y MariaDB-server MariaDB-common MariaDB-shared MariaDB-client MariaDB-Galera-server MariaDB-devel; \
    yum clean all;

# initialize
ADD ./sql/*              /opt/
ADD ./conf/my.cnf        /opt/
RUN /etc/init.d/mysql start; \
    mysqladmin -u root password '123456'; \
    mysql -uroot -p123456 mysql < /opt/initDatabase.sql; \
    /etc/init.d/mysql stop; \
    rm -rf /etc/my.cnf; mv /opt/my.cnf /etc/; \
    mkdir /var/log/mariadb; touch /var/log/mariadb/mariadb.log;

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]
EXPOSE 3306
