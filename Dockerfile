# Use the lightweight official Nginx image
FROM nginx:alpine

# Copy your landing page into Nginx's web root directory
COPY index.html /usr/share/nginx/html/index.html

# Cloud Run requires applications to listen on port 8080.
# Nginx default is port 80, so we update the default configuration inline:
RUN sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Expose port 8080
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]