FROM ubuntu:16.04

ARG UID=1000

RUN apt-get update && apt-get install -y \
  sudo \
  git \
  vim \
  gcc \
  g++ \
  ipython \
  wget \
  screen \
  virtualenv
RUN rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash ankdesh --uid $UID
RUN adduser ankdesh sudo
RUN sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers

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
