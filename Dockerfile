# Use an official base image
FROM ubuntu:20.04

# Set non-interactive mode for apt-get to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && apt-get install -y \
    g++ \
    libgsl-dev \
    git

# Set the default command for the container
CMD ["/bin/bash"]

# Install NERDSS
RUN git clone https://github.com/mjohn218/NERDSS.git \
    && cd NERDSS \
    && make

# Set up your working directory
WORKDIR /NERDSS
