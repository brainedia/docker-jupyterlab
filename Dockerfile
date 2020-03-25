# Download base image: latest Ubuntu LTS
FROM ubuntu:latest

# Update and install software
RUN apt-get update
RUN apt-get remove --purge -y python3 && apt-get autoremove -y
RUN apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && apt-get update && apt-get install -y python3.8 && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 0
RUN apt-get install -y python3-pip
RUN apt-get install -y build-essential python3-dev || true
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
