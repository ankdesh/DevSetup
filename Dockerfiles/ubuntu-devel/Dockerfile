FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  git \
  vim \
  gcc \
  g++ \
  ipython \
  wget \
  python-pip

RUN useradd -ms /bin/bash ankdesh

USER ankdesh
WORKDIR /home/ankdesh

# Basic ankdesh type setup
RUN wget https://github.com/ankdesh/DevSetup/blob/master/scripts/setup_git.sh
RUN wget https://github.com/ankdesh/DevSetup/blob/master/scripts/setup_rc.sh

RUN bash setup_git.sh
RUN bash setup_rc.sh

RUN rm setup_git.sh
RUN rm setup_rc.sh
