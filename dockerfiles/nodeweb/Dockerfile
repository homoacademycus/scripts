FROM centos:7
MAINTAINER homoacademycus

ARG workingdir=/nodeApp
ARG appuser=nodejs
ARG appuserid=30680

RUN groupadd --gid ${appuserid} ${appuser}
RUN useradd --system --uid ${appuserid} --gid ${appuser} ${appuser}
RUN gpasswd --restrict ${appuser}

RUN mkdir -p ${workingdir}
ADD npm.prettierrc ${workingdir}/.prettierrc
ADD node.eslintrc.json ${workingdir}/.eslintrc.json
RUN chown -R ${appuser} ${workingdir}
RUN chmod -R 775 ${workingdir}
WORKDIR ${workingdir}

RUN mkdir -p /home/${appuser}
RUN chown -R ${appuser} /home/${appuser}
RUN chmod -R 775 /home/${appuser}

RUN yum install npm

RUN passwd -l root
USER ${appuser}

RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install -g --save-dev eslint prettier eslint-config-prettier nodemon
RUN npm init -y
RUN eslint --init

RUN npm install -y express koa koa-router koa-static koa-bodyparser
RUN npm install -y brcypt jsonwebtoken
RUN npm install -y mongoose dotenv joi axios

ENTRYPOINT ["/bin/bash"]

