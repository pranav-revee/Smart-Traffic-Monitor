# Data Directory

This directory contains sample traffic videos and datasets for development and testing.

## Sample Videos

Place your traffic video files in the `sample_videos/` subdirectory.

### Recommended Video Sources

1. **Pexels** - https://www.pexels.com/search/videos/traffic/
2. **Pixabay** - https://pixabay.com/videos/search/traffic/
3. **YouTube Creative Commons** - Search for traffic camera footage
4. **Public Datasets**:
   - UA-DETRAC: http://detrac-db.rit.albany.edu/
   - KITTI: http://www.cvlibs.net/datasets/kitti/
   - Waymo Open Dataset: https://waymo.com/open/

### Video Requirements

- **Format**: MP4, AVI, MOV
- **Resolution**: 720p or higher (1080p recommended)
- **FPS**: 25-30 FPS
- **Duration**: 1-5 minutes for testing
- **Content**: Clear view of roadway with multiple vehicles

### Organizing Videos

Create subdirectories for different scenarios:

```
sample_videos/
├── daylight/
├── night/
├── highway/
├── intersection/
└── low_traffic/
```

## RTSP Streams

If using RTSP camera streams, document URLs in a `streams.txt` file (do not commit credentials).

Example:
```
# Highway Camera 1
rtsp://username:password@192.168.1.100:554/stream1

# Intersection Camera
rtsp://username:password@192.168.1.101:554/stream1
```

## License and Attribution

Ensure all video sources comply with licenses. Document sources here:

| Video File | Source | License | Attribution |
|------------|--------|---------|-------------|
| traffic1.mp4 | Pexels | Free to use | John Doe |
| traffic2.mp4 | Pixabay | CC0 | Jane Smith |
