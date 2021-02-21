FROM nginx:latest
MAINTAINER homoacademycus

RUN mkdir -p /opt/webapp
RUN cd /opt/webapp
WORKDIR /opt/webapp

RUN yum install npm
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install -g --save-dev eslint prettier eslint-config-prettier nodemon
RUN npm init -y
RUN eslint --init

ADD install_nodeweb.sh /opt/webapp/install_nodeweb.sh
ADD npm.prettierrc /opt/webapp/.prettierrc
ADD react.eslintrc.json /opt/webapp/.eslintrc.json

RUN groupadd --gid 30680 $username
RUN useradd --system --uid 30680 --gid developer developer
RUN gpasswd --restrict developer
RUN passwd -l root
USER developer


