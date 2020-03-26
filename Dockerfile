# Download base image: latest Ubuntu LTS
FROM python:3.8.2-slim-buster

MAINTAINER Robert Sass <info@brainedia.com>

ENTRYPOINT /bin/bash -c

# Software updaten & installieren
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y python3-dev || apt-get install -y python-dev || true
RUN apt-get install -y python3-venv || apt-get install -y python-venv || true

# Python environment einrichten
RUN mkdir ~/environments && cd ~/environments
RUN python3 -m venv jupyterlab
RUN . jupyterlab/bin/activate
RUN pip install jupyterlab || pip3 install jupyterlab
RUN pip install notebook || pip3 install notebook
RUN deactivate

# Volume configuration
VOLUME ["/var/lib/docker/volumes/jupyter_data"]

# Standardkommando ausführen
CMD cd ~/environments && source jupyterlab/bin/activate && export JUPYTER_DATA_DIR=/var/lib/docker/volumes/jupyter_data && jupyter lab

# Exposing Jupyter's port
EXPOSE 8888
