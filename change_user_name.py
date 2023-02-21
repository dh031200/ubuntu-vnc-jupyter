import argparse

s = "FROM ubuntu:22.04\n"
k = """
EXPOSE 5901/tcp
EXPOSE 8888/tcp

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
RUN apt-get update && apt-get -y upgrade && apt-get -y install sudo xfce4 tigervnc-standalone-server xfce4-terminal wget pip

WORKDIR /home/ubuntu

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN echo "ubuntu:ubuntu" | chpasswd
RUN echo "ubuntu   ALL=(ALL)       NOPASSWD:       ALL" >> /etc/sudoers
COPY .run.sh .
COPY cck.sh .
COPY cdk.sh .


RUN chmod 777 *.sh

USER ubuntu

CMD ["/bin/bash", ".run.sh"]
"""

def main(old, new):
    if old != new:txt=s+k.replace(old, new)
    else:txt=s+k
    with open('docker/Dockerfile', 'w') as f:
        f.write(txt)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--old', type=str, default='ubuntu')
    parser.add_argument('--new', type=str, default='ubuntu')
    args = parser.parse_args()
    main(args.old, args.new)
    if args.old == args.new:print('Set default\nUsername : ubuntu')
    else:print(f'change username {args.old} -> {args.new}')
