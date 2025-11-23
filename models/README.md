# Models Directory

This directory contains pre-trained model weights for YOLOv8 and DeepSORT.

## YOLOv8 Weights

YOLOv8 weights will be automatically downloaded by Ultralytics on first run.

Available models (trade-off between speed and accuracy):

| Model | Size | mAP | Speed (GPU) | Use Case |
|-------|------|-----|-------------|----------|
| yolov8n.pt | 6.2 MB | 37.3 | ~80 FPS | Edge devices, real-time |
| yolov8s.pt | 21.5 MB | 44.9 | ~60 FPS | Balanced |
| yolov8m.pt | 49.7 MB | 50.2 | ~45 FPS | Higher accuracy |
| yolov8l.pt | 83.7 MB | 52.9 | ~30 FPS | Best accuracy |
| yolov8x.pt | 130.5 MB | 53.9 | ~20 FPS | Maximum accuracy |

**Recommendation:** Start with `yolov8n.pt` for development, use `yolov8m.pt` for production.

### Manual Download (Optional)

```bash
# Download YOLOv8 nano model
wget https://github.com/ultralytics/assets/releases/download/v0.0.0/yolov8n.pt

# Or use Ultralytics CLI
yolo task=detect mode=predict model=yolov8n.pt
```

## DeepSORT Weights

DeepSORT requires appearance feature extractor weights.

### Download Instructions

1. **deep_sort_pytorch** implementation:

```bash
# Clone the repository
git clone https://github.com/ZQPei/deep_sort_pytorch.git
cd deep_sort_pytorch

# Download weights
# Follow their instructions to download ckpt.t7
```

2. **deep_sort_realtime** (recommended - simpler):

```bash
pip install deep-sort-realtime
# Weights auto-download on first run
```

### Expected Files

After setup, this directory should contain:

```
models/
├── yolov8n.pt (or yolov8m.pt)
├── deepsort/ (if using deep_sort_pytorch)
│   └── ckpt.t7
└── README.md
```

## Custom Fine-tuned Models

If you train custom models, place them here with descriptive names:

```
models/
├── yolov8_traffic_finetuned.pt
└── yolov8_nighttime_optimized.pt
```

Document custom models:

| Model File | Description | Training Data | mAP | Notes |
|------------|-------------|---------------|-----|-------|
| yolov8_traffic_finetuned.pt | Fine-tuned on local traffic | 5000 frames | 55.2 | Better for our cameras |

## Model Configuration

Model selection can be configured in `config/model_config.yaml` (to be created).
