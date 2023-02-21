FROM ubuntu:22.04

EXPOSE 5901/tcp
EXPOSE 8888/tcp

RUN useradd -rm -d /home/vncbuntu -s /bin/bash -g root -G sudo -u 1001 vncbuntu
RUN apt-get update && apt-get -y upgrade && apt-get -y install sudo xfce4 tigervnc-standalone-server xfce4-terminal wget pip

WORKDIR /home/vncbuntu

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN echo "vncbuntu:vncbuntu" | chpasswd
RUN echo "vncbuntu   ALL=(ALL)       NOPASSWD:       ALL" >> /etc/sudoers
COPY .run.sh .
COPY cck.sh .
COPY cdk.sh .


RUN chmod 777 *.sh

USER vncbuntu

CMD ["/bin/bash", ".run.sh"]
