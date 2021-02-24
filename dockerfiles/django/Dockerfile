FROM centos:7
MAINTAINER homoacademycus

ARG workingdir=/djangoApp
ARG appuser=django
ARG appuserid=30680

RUN groupadd --gid ${appuserid} ${appuser}
RUN useradd --system --uid ${appuserid} --gid ${appuser} ${appuser}
RUN gpasswd --restrict ${appuser}

RUN mkdir -p ${workingdir}
COPY pip.django.list ${workingdir}/pip.django.list
RUN chown -R ${appuser} ${workingdir}
RUN chmod -R 775 ${workingdir}
WORKDIR ${workingdir}

RUN mkdir -p /home/${appuser}
RUN chown -R ${appuser} /home/${appuser}
RUN chmod -R 775 /home/${appuser}

RUN yum install -y git
RUN yum install -y python3

RUN passwd -l root
USER ${appuser}
RUN pip3 install -r /tmp/pip.django.list

ENTRYPOINT ["/bin/bash"]

