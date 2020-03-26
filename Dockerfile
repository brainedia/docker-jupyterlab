# Download base image: latest Ubuntu LTS
FROM python:3.8.2-alpine3.11

# Update and install software
RUN apt-get update
RUN apt-get install -y python3-venv || true

# Python environment einrichten
RUN mkdir environments && cd environments
RUN python3 -m venv jupyterlab
RUN . jupyterlab/bin/activate
RUN pip install jupyterlab || pip3 install jupyterlab
RUN pip install notebook || pip3 install notebook

# Volume configuration
VOLUME ["/var/lib/docker/volumes/jupyter_data"]

# Standardkommando ausführen
CMD export JUPYTER_DATA_DIR=/var/lib/docker/volumes/jupyter_data && jupyter lab

# Exposing Jupyter's port
EXPOSE 8888
