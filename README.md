# Jupyter Lab (Docker Image)

Image running JupyterLab on port 8888.

Based on [python:3.8.2-slim-buster](https://hub.docker.com/layers/python/library/python/3.8.2-slim-buster/images/sha256-3f897b49c7d6a4d88158a70fbef2326cbcd13f004329ba48bb809cad999ae373)


## Usage

Run container like this:
```
sudo docker run --volume=/var/jupyter_data:/var/lib/docker/volumes/jupyter_data -p 8888:8888 -d --name jupyterlab brainedia/jupyterlab
```
