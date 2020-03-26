# Download base image: latest Ubuntu LTS
FROM python:3.8.2-alpine3.11

# Software installieren und updaten & Python environment einrichten
RUN ./init.sh

# Volume configuration
VOLUME ["/var/lib/docker/volumes/jupyter_data"]

# Standardkommando ausführen
CMD ./run.sh

# Exposing Jupyter's port
EXPOSE 8888
