FROM mysql:5.6

# Añado mi propio archivo de configuración my.cnf
ADD ./docker-settings/my.cnf /etc/mysql
