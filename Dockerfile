# Download base image: latest Ubuntu LTS
FROM python:3.8.2-alpine3.11

ENTRYPOINT /bin/bash -c

# Software updaten & installieren
RUN apk update
RUN apk add build-base || true
RUN apk add python3-dev || true
RUN apk add python-venv || true

# Python environment einrichten
RUN mkdir ~/environments && cd ~/environments
RUN python3 -m venv jupyterlab
RUN source jupyterlab/bin/activate
RUN pip install jupyterlab || pip3 install jupyterlab
RUN pip install notebook || pip3 install notebook
RUN deactivate

# Volume configuration
VOLUME ["/var/lib/docker/volumes/jupyter_data"]

# Standardkommando ausführen
CMD cd ~/environments && source jupyterlab/bin/activate && export JUPYTER_DATA_DIR=/var/lib/docker/volumes/jupyter_data && jupyter lab

# Exposing Jupyter's port
EXPOSE 8888
