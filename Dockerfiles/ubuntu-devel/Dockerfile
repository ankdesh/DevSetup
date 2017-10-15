FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  sudo \
  git \
  vim \
  gcc \
  g++ \
  ipython \
  wget \
  screen \
  python-pip
RUN rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash ankdesh
RUN adduser ankdesh sudo
RUN sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers

USER ankdesh
WORKDIR /home/ankdesh

# Basic ankdesh type setup
RUN wget https://raw.githubusercontent.com/ankdesh/DevSetup/master/scripts/setup_git.sh
RUN wget https://raw.githubusercontent.com/ankdesh/DevSetup/master/scripts/setup_rc.sh

RUN bash setup_git.sh
RUN bash setup_rc.sh

RUN rm setup_git.sh
RUN rm setup_rc.sh
