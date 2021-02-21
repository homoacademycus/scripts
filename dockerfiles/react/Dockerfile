FROM nginx:latest
MAINTAINER homoacademycus

RUN mkdir -p /opt/webapp
RUN cd /opt/webapp
WORKDIR /opt/webapp

<<<<<<< HEAD
RUN apt-get update
RUN apt-get -y install npm
=======
RUN yum install npm
>>>>>>> 231affda8088b47bc8a6f0a2afce91c6a96c7ecd
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install -g --save-dev eslint prettier eslint-config-prettier nodemon
RUN npm init -y
RUN eslint --init

<<<<<<< HEAD
ADD install_react.sh /opt/webapp/install_react.sh
ADD npm.prettierrc /opt/webapp/.prettierrc
ADD react.eslintrc.json /opt/webapp/.eslintrc.json

RUN groupadd --gid 30680 developer
=======
ADD install_nodeweb.sh /opt/webapp/install_nodeweb.sh
ADD npm.prettierrc /opt/webapp/.prettierrc
ADD react.eslintrc.json /opt/webapp/.eslintrc.json

RUN groupadd --gid 30680 $username
>>>>>>> 231affda8088b47bc8a6f0a2afce91c6a96c7ecd
RUN useradd --system --uid 30680 --gid developer developer
RUN gpasswd --restrict developer
RUN passwd -l root
USER developer


