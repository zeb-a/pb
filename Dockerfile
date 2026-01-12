# Use a lightweight Linux base
FROM alpine:latest

# Install curl
RUN apk add --no-cache curl bash

# Set working directory
WORKDIR /app

# Download PocketBase binary directly
RUN curl -L -o pocketbase https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_0.35.0_linux_amd64 \
    && chmod +x pocketbase

# Expose the default port
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8090"]
