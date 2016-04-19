FROM phpmentors/symfony-app:php56

# Añado mi propio archivo de configuración php.ini
ADD ./docker-settings/php.ini /etc/php5/cli

# Evito problemas de permisos con mi usuario local asignándole a www-data mi UUID
RUN usermod -u 1000 www-data

# Creo un alias para ejecutar comandos de symfony, además evita problemas de permisos al limpiar la caché
RUN echo "alias symfony='sudo -u www-data php /var/app/bin/console'" >> /root/.bashrc

RUN apt-get install wget

# RUN apt-get install -y php5-cli

RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list

RUN wget -O- https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -

RUN apt-get update

RUN apt-get install -y rabbitmq-server