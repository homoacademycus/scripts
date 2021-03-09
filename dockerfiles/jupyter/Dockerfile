FROM centos:7
MAINTAINER homoacademycus

ARG workingdir=/datalab
ARG appuser=jupyter
ARG appuserid=30680

RUN groupadd --gid 30680 ${appuser}
RUN useradd --system --uid 30680 --gid ${appuser} ${appuser}
RUN gpasswd --restrict ${appuser}

RUN mkdir -p ${workingdir}
RUN chown -R ${appuser} ${workingdir}
RUN chmod -R 775 ${workingdir}
WORKDIR ${workingdir}

RUN mkdir -p /home/${appuser}
RUN chown -R ${appuser} /home/${appuser}
RUN chmod -R 775 /home/${appuser}

RUN yum install -y git
RUN yum install -y python3

USER ${appuser}
RUN pip3 install -r jupyter

ENTRYPOINT "/bin/bash"


