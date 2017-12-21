FROM ubuntu:16.04

MAINTAINER Ankur Deshwal <a.s.deshwal@gmail.com>

RUN apt-get update && apt-get install -y \
  sudo \
  git \
  vim \
  gcc \
  g++ \
  wget \
  screen \
  virtualenv
  
RUN rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash ankdesh
RUN adduser ankdesh sudo
RUN sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers

# jupyter
EXPOSE 8888

USER ankdesh
WORKDIR /home/ankdesh

COPY jupyter_notebook_config.py /home/ankdesh/.jupyter/

# Basic ankdesh type setup
RUN wget https://raw.githubusercontent.com/ankdesh/DevSetup/master/scripts/setup_git.sh
RUN wget https://raw.githubusercontent.com/ankdesh/DevSetup/master/scripts/setup_rc.sh

RUN bash setup_git.sh
RUN bash setup_rc.sh

RUN rm setup_git.sh
RUN rm setup_rc.sh

CMD ["/bin/bash"]