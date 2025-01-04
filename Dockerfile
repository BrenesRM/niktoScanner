# Base image
FROM debian:bullseye

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    git \
    perl \
    libwww-perl \
    libssl-dev \
    openssl \
    python3 \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone Nikto repository
RUN git clone https://github.com/sullo/nikto.git /usr/local/nikto

# Make Nikto globally executable
RUN chmod +x /usr/local/nikto/program/nikto.pl && \
    ln -s /usr/local/nikto/program/nikto.pl /usr/bin/nikto

# Set working directory
WORKDIR /usr/src/app

# Copy Python script into container
COPY run_scan.py /usr/src/app/run_scan.py

# Create an output directory for results
RUN mkdir -p /output

# Command to run the Python script
CMD ["python3", "run_scan.py"]
