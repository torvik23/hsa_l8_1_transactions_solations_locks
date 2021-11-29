ARG PERCONA_VERSION=5.7
FROM percona:${PERCONA_VERSION}

RUN chown -R mysql:root /var/lib/mysql/

CMD ["mysqld"]

EXPOSE 3306
