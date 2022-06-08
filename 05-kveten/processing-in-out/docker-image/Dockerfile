FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y xterm wget
RUN groupadd -g 1000 kof
RUN useradd -d /home/kof -s /bin/bash -m kof -u 1000 -g 1000 --create-home
USER kof
ENV HOME /home/kof
COPY processing-4.0b2-linux64.tgz /home/kof/
COPY sketch /home/kof/sketch
RUN cd /home/kof && tar -xf processing-4.0b2-linux64.tgz
CMD /home/kof/processing-4.0b2/processing-java --sketch=/home/kof/sketch --force --run
#CMD /usr/bin/xterm
