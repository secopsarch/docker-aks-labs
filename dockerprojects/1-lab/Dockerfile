# Use nginx:alpine-slim as base Docker Image
FROM nginx:alpine-slim

# Custom Labels
LABEL maintainer="Arun Labs"  
LABEL version="1.0"
LABEL description="A simple Nginx Application"

# Build arguments for dynamic values
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

# OCI Labels with dynamic values
LABEL org.opencontainers.image.authors="Demo by Arun"
LABEL org.opencontainers.image.title="Nginx Alpine Slim Application"
LABEL org.opencontainers.image.description="A lightweight Nginx application built on Alpine."
LABEL org.opencontainers.image.version="${VERSION:-1.0}"
LABEL org.opencontainers.image.revision="${VCS_REF:-unknown}" 
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.url=" https://github.com/secopsarch/dockerlabs"
LABEL org.opencontainers.image.source=" https://github.com/secopsarch/dockerlabs/lab1/Dockerfile"
LABEL org.opencontainers.image.vendor="Arun Labs"
LABEL org.opencontainers.image.licenses="Apache-2.0"

# Using COPY to copy a local file
COPY index.html /usr/share/nginx/html
