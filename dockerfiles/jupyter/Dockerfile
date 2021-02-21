FROM centos:7
MAINTAINER homoacademycus

RUN mkdir -p /datalab
WORKDIR /datalab

RUN yum install -y git
RUN yum install -y python3
ADD pip.jupyter.list /tmp/pip.jupyter.list
RUN pip3 install -r /tmp/pip.jupyter.list

RUN groupadd --gid 30680 developer
RUN useradd --system --uid 30680 --gid developer developer
RUN gpasswd --restrict developer
RUN passwd -l root
USER developer




