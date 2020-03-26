# Download base image: latest Ubuntu LTS
FROM python:3.8.2-slim-buster

MAINTAINER Robert Sass <info@brainedia.com>

# Software updaten & installieren
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y python3-dev || apt-get install -y python-dev || true
RUN apt-get install -y python3-venv || apt-get install -y python-venv || true

# Python environment einrichten
RUN mkdir ~/jupyterlab && cd ~/jupyterlab
RUN pip install jupyterlab && pip install notebook

# Volume configuration
VOLUME ["/var/lib/docker/volumes/jupyter_data"]

# Standardkommando ausführen
CMD cd ~/jupyterlab && export JUPYTER_DATA_DIR=/var/lib/docker/volumes/jupyter_data && jupyter lab --ip 0.0.0.0 --port 8888 --allow-root

# Exposing Jupyter's port
EXPOSE 8888
