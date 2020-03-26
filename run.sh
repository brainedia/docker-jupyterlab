#!/bin/bash

# Python environment starten
cd environments
source jupyterlab/bin/activate

# Jupyter starten
export JUPYTER_DATA_DIR=/var/lib/docker/volumes/jupyter_data
jupyter lab
