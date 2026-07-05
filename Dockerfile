FROM alpine:3.20

# Install curl and ca-certificates (required for HTTPS requests)
RUN apk add --no-cache curl ca-certificates

# Set up the working directory where the file will be saved
WORKDIR /app

# Copy the script into the image and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use ENTRYPOINT so arguments passed to 'docker run' are appended to our script
ENTRYPOINT ["/entrypoint.sh"]