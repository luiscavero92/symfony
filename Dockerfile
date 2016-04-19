FROM mysql:5.6

ENV MYSQL_ROOT_PASSWORD="password"

# Añado mi propio archivo de configuración my.cnf
ADD ./docker-settings/my.cnf /etc/mysql