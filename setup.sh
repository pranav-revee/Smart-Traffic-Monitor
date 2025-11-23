#!/bin/bash
# Smart Traffic Monitor - Setup Script
# This script sets up the development environment

set -e  # Exit on error

echo "=========================================="
echo "Smart Traffic Monitor - Setup"
echo "=========================================="

# Check Python version
echo "Checking Python version..."
PYTHON_VERSION=$(python3 --version 2>&1 | grep -oP '\d+\.\d+')
REQUIRED_VERSION="3.8"

if (( $(echo "$PYTHON_VERSION < $REQUIRED_VERSION" | bc -l) )); then
    echo "Error: Python $REQUIRED_VERSION or higher is required (found $PYTHON_VERSION)"
    exit 1
fi
echo "✓ Python $PYTHON_VERSION detected"

# Create virtual environment
echo ""
echo "Creating virtual environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "✓ Virtual environment created"
else
    echo "✓ Virtual environment already exists"
fi

# Activate virtual environment
echo ""
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo ""
echo "Upgrading pip..."
pip install --upgrade pip
echo "✓ pip upgraded"

# Install dependencies
echo ""
echo "Installing dependencies..."
pip install -r requirements.txt
echo "✓ Dependencies installed"

# Create necessary directories
echo ""
echo "Creating project directories..."
mkdir -p data/sample_videos
mkdir -p models
mkdir -p outputs
mkdir -p logs
mkdir -p docs/demo_screenshots
echo "✓ Directories created"

# Download YOLOv8 weights (optional - will auto-download on first run)
echo ""
read -p "Download YOLOv8 nano model now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Downloading YOLOv8 nano model..."
    python3 -c "from ultralytics import YOLO; model = YOLO('yolov8n.pt')"
    echo "✓ YOLOv8 model downloaded"
fi

# Check GPU availability
echo ""
echo "Checking GPU availability..."
python3 -c "import torch; print('✓ GPU available:', torch.cuda.is_available())" || echo "⚠ No GPU detected (CPU mode will be used)"

# Create .env file if it doesn't exist
echo ""
if [ ! -f ".env" ]; then
    echo "Creating .env file..."
    cat > .env << EOF
# Smart Traffic Monitor - Environment Variables

# Flask Configuration
FLASK_ENV=development
FLASK_DEBUG=True
SECRET_KEY=$(python3 -c 'import secrets; print(secrets.token_hex(16))')

# API Configuration
API_HOST=0.0.0.0
API_PORT=5000

# Database
DB_PATH=data/traffic.db

# Model Configuration
YOLO_MODEL=yolov8n.pt
CONFIDENCE_THRESHOLD=0.5

# Logging
LOG_LEVEL=INFO
LOG_FILE=logs/traffic_monitor.log

# Performance
MAX_FPS=30
FRAME_SKIP=1
EOF
    echo "✓ .env file created"
else
    echo "✓ .env file already exists"
fi

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Activate the virtual environment:"
echo "   source venv/bin/activate"
echo ""
echo "2. Download sample traffic videos to data/sample_videos/"
echo ""
echo "3. Run the detector test:"
echo "   python src/detector.py --source data/sample_videos/your_video.mp4"
echo ""
echo "4. See TASKS.md for detailed development roadmap"
echo ""
echo "Happy coding! 🚀"
