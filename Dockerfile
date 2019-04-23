FROM rowanto/docker-java8-mvn-nodejs-npm

# removendo repositórios desnecessários e instalando sshpass
RUN echo "deb http://httpredir.debian.org/debian jessie main\ndeb http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN rm -rf /etc/apt/sources.list.d/jessie-backports.list \
                && apt-get update \
                && apt-get install -y sshpass

# Adicionando proxies para acesso interno
RUN echo "Acquire::http::proxy \"http://10.239.68.1:3128/\";\n\
Acquire::ftp::proxy \"ftp://10.239.68.1:3128/\";\n\
Acquire::https::proxy \"https://10.239.68.1:3128/\";" > /etc/apt/apt.conf.d/95proxies