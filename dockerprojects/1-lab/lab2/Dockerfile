# Use nginx:alpine as base image for lightweight container
FROM nginx:alpine-slim

# Add metadata using labels
LABEL maintainer="TechCorp DevOps Team"
LABEL version="1.0"
LABEL description="TechCorp Website Demo"

# Copy all HTML files to nginx html directory
COPY *.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Command to run nginx in foreground
CMD ["nginx", "-g", "daemon off;"] 