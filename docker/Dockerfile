# Smart Traffic Monitor - Dockerfile
# Multi-stage build for optimized image size

# ===========================
# Stage 1: Base
# ===========================
FROM python:3.10-slim as base

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    wget \
    && rm -rf /var/lib/apt/lists/*

# ===========================
# Stage 2: Dependencies
# ===========================
FROM base as dependencies

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# ===========================
# Stage 3: Application
# ===========================
FROM dependencies as application

# Copy application code
COPY src/ ./src/
COPY config/ ./config/
COPY models/ ./models/

# Create necessary directories
RUN mkdir -p /app/data /app/logs /app/outputs

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# Expose API port
EXPOSE 5000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:5000/health')"

# Default command (run API server)
CMD ["python", "src/api.py"]

# ===========================
# GPU Support (Optional)
# ===========================
# To build with GPU support:
# docker build -t smart-traffic-monitor:gpu --target gpu-application .

# FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04 as gpu-base
# ... (configure CUDA support)
