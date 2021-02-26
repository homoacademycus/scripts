FROM centos:7
MAINTAINER homoacademycus

ARG workingdir=/reactApp
ARG appuser=react
ARG appuserid=30680

RUN apt update
RUN apt -y install npm

RUN groupadd --gid ${appuserid} ${appuser}
RUN useradd --system --uid ${appuserid} --gid ${appuser} ${appuser}
RUN gpasswd --restrict ${appuser}

RUN mkdir -p ${workingdir}
RUN cd ${workingdir}
WORKDIR ${workingdir}

RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install -g --save-dev eslint prettier eslint-config-prettier nodemon
RUN npm init -y
RUN eslint --init
COPY npm.prettierrc ${workingdir}/.prettierrc
COPY react.eslintrc.json ${workingdir}/.eslintrc.json
RUN chown -R $root:{appuser} ${workingdir}
RUN chmod -R 775 ${workingdir}

RUN npm install -g create-react-app
RUN npm install -g --save-dev eslint prettier eslint-config-prettier
RUN npm install react react-dom react-router-dom react-app react-scripts 
RUN npm install styled-components prop-types
RUN npm install axios react-redux redux-actions redux-sega
RUN npm install brcypt jsonwebtoken axios gh-pages qs

ENTRYPOINT ["/bin/bash"]

