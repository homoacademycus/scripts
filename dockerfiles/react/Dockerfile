FROM nginx:latest
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
ADD install_react.sh ${workingdir}/install_react.sh
ADD npm.prettierrc ${workingdir}/.prettierrc
ADD react.eslintrc.json ${workingdir}/.eslintrc.json
RUN chown -R ${appuser} ${workingdir}
RUN chmod -R 775 ${workingdir}

RUN mkdir -p /home/${appuser}
RUN chown -R ${appuser} /home/${appuser}
RUN chmod -R 775 /home/${appuser}

WORKDIR ${workingdir}
RUN passwd -l root
USER ${appuser}

RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install -g --save-dev eslint prettier eslint-config-prettier nodemon
RUN npm init -y
RUN eslint --init

ENTRYPOINT ["/bin/bash"]

