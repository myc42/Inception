FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb_script.sh /mariadb_script.sh
RUN chmod +x /mariadb_script.sh

EXPOSE 3306
#EXPOSE 5688

ENTRYPOINT ["/mariadb_script.sh"]