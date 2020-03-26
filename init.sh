#!/bin/bash

# Software updaten & installieren
apt-get update
apt-get install -y python3-venv || true

# Python environment einrichten
mkdir environments && cd environments
python3 -m venv jupyterlab
source jupyterlab/bin/activate
pip install jupyterlab || pip3 install jupyterlab
pip install notebook || pip3 install notebook
