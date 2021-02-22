FROM centos:7
MAINTAINER homoacademycus

RUN mkdir -p /datalab
RUN chown -R developer /datalab
RUN chmod -R 775 /datalab
WORKDIR /datalab

RUN yum install -y git
RUN yum install -y python3

RUN groupadd --gid 30680 developer
RUN useradd --system --uid 30680 --gid developer developer
RUN gpasswd --restrict developer

RUN mkdir -p /home/developer
RUN chown -R developer /home/developer
RUN chmod -R 775 /home/developer

RUN passwd -l root
USER developer

RUN pip3 install -r jupyter



