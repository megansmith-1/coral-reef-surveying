#!/bin/bash
# Example script to run MEE DeepReefMap model on a single video
# Run from coral-reef-surveying/ root directory

cd models/deepreefmap

# Ensure system FFmpeg is in PATH before running uv
export PATH="/opt/homebrew/bin:$PATH"

input_filename="Andulay_S-M1_50M_trimmed"
output_filename="${input_filename}_coralscapes"

# Run with uv python (uses all dependencies) but system FFmpeg
uv run deepreefmap reconstruct \
  --videos=../../input-videos/ready/${input_filename}.MP4 \
  --camera-profile gopro_hero_10 \
  --mapping scsfmlearner \
  --segmentation coralscapes-vit-b-dpt \
  --out output/${output_filename} \

# Models we're using are segformer-b2 or coralscapes-vit-b-dpt

# Render video from reconstruction results
uv run deepreefmap render-video --run-dir output/${output_filename}
