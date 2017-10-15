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

COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
# https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

# Something Jupyter suggests to do:
# http://jupyter-notebook.readthedocs.io/en/latest/public_server.html#docker-cmd
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# jupyter
EXPOSE 8888

USER ankdesh
WORKDIR /home/ankdesh

RUN pip3 install -U distribute \
        setuptools \
        pip \
        virtualenv

RUN pip install -U distribute \
        setuptools \
        pip \
        virtualenv

CMD ["/bin/bash"]
