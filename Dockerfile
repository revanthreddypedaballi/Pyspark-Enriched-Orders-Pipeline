RUN apt-get update || apt-get update || apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-11-jdk-headless procps curl gnupg2 ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
