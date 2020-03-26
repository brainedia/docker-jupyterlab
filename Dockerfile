# Download base image: latest Ubuntu LTS
FROM python:3.8.2-alpine3.11

# Software installieren und updaten & Python environment einrichten
COPY init.sh /scripts/init.sh
RUN ["chmod", "+x", "/scripts/init.sh"]
RUN /scripts/init.sh

# Volume configuration
VOLUME ["/var/lib/docker/volumes/jupyter_data"]

# Standardkommando ausführen
COPY run.sh /scripts/run.sh
RUN ["chmod", "+x", "/scripts/run.sh"]
ENTRYPOINT ["/scripts/run.sh"]

# Exposing Jupyter's port
EXPOSE 8888
