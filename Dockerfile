# Use an official base image
FROM ubuntu:20.04

# Set non-interactive mode for apt-get to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libgsl-dev \
    git \
    python3 \
    python3-pip \
    python3-tk

# Clone NERDSS and compile it
RUN git clone https://github.com/mjohn218/NERDSS.git /NERDSS \
    && cd /NERDSS \
    && make serial \
    && mv bin/nerdss /usr/local/bin/ \
    && rm -rf /NERDSS

# Install Jupyter
RUN pip3 install jupyter

# Add entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Set the default command for the container
CMD ["/bin/bash"]

# Set up your working directory
WORKDIR /SIMULATION
