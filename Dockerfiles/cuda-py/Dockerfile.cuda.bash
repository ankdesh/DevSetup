FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

MAINTAINER Ankur Deshwal <a.s.deshwal@gmail.com>

RUN apt-get update && apt-get install -y sudo

RUN useradd -ms /bin/bash ankdesh
RUN adduser ankdesh sudo
RUN sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers

RUN apt-get update && apt-get install -y \
        python3-pip \
        python3-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
        python-pip \
        python-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# jupyter
EXPOSE 8888

USER ankdesh
WORKDIR /home/ankdesh

COPY jupyter_notebook_config.py /home/ankdesh/.jupyter/

RUN pip3 install -U distribute \
        setuptools \
        pip \
        virtualenv

RUN pip install -U distribute \
        setuptools \
        pip \
        virtualenv

# Basic ankdesh type setup
RUN wget https://raw.githubusercontent.com/ankdesh/DevSetup/master/scripts/setup_git.sh
RUN wget https://raw.githubusercontent.com/ankdesh/DevSetup/master/scripts/setup_rc.sh

RUN bash setup_git.sh
RUN bash setup_rc.sh

RUN rm setup_git.sh
RUN rm setup_rc.sh

RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/nvidia/lib/:/usr/local/cuda/lib64/" >> ~/.bashrc

CMD ["/bin/bash"]
