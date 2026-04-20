FROM ubuntu:26.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    vim \
    git \
    poppler-utils \
    build-essential \
    gcc-riscv64-linux-gnu \
    binutils-riscv64-linux-gnu \
    qemu-user \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user (UID 1000 for host compatibility)
# RUN useradd -m -u 1000 -s /bin/bash vscode
RUN if getent passwd 1000 >/dev/null; then \
        existing_user=$(getent passwd 1000 | cut -d: -f1); \
        if [ "$existing_user" != "vscode" ]; then \
            usermod -l vscode "$existing_user"; \
            usermod -d /home/vscode -m vscode; \
        fi; \
    else \
        useradd -m -u 1000 -s /bin/bash vscode; \
    fi

# Set working directory
WORKDIR /workspace

# Set HOME explicitly
ENV HOME=/home/vscode

# Switch to non-root user
USER vscode
