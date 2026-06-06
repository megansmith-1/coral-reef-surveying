#!/bin/bash
# Example script to run calibration for DeepReefMap V2
# Run from coral-reef-surveying/ root directory

cd models/deepreefmap

# Ensure system FFmpeg is in PATH before running uv
export PATH="/opt/homebrew/bin:$PATH"

# Run with uv python (uses all dependencies) but system FFmpeg
uv run deepreefmap calibrate ../../input-videos/calibration/Salag_trimmed_10fps.MP4 \
  --name dji_osmo_action_5_pro \
  --n-frames 100 \
  --fps 10 \
