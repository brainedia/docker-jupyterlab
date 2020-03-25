# Download base image: latest Ubuntu LTS
FROM ubuntu:latest

# Update and install software
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get remove --purge -y python3
RUN apt-get autoremove -y
RUN apt-get install -y python3.8
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
RUN apt-get install -y python3-pip
RUN pip install --upgrade pip || pip3 install --upgrade pip || pip3 install --upgrade pip3
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev
RUN apt-get install -y python3.8-venv

# Python environment einrichten
RUN mkdir environments && cd environments
RUN python3 -m venv jupyterlabs
RUN source jupyterlabs/bin/activate
RUN pip install jupyterlab
RUN pip install notebook

# Volume configuration
VOLUME ["/home/jupyter/jupyter_data"]

# Standardkommando ausführen
CMD jupyter notebook

# Exposing Jupyter's port
EXPOSE 8888
