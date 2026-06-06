#!/bin/bash
# Example script to run DeepReefMap V2 model on a single video
# Run from coral-reef-surveying/ root directory

cd models/deepreefmap

# Ensure system FFmpeg is in PATH before running uv
export PATH="/opt/homebrew/bin:$PATH"

input_filename="Andulay_Diseased_Table" # Change this to the name of your input video (without .MP4 extension)
output_filename="${input_filename}_coralscapes"

# Run with uv python (uses all dependencies) but system FFmpeg
uv run deepreefmap reconstruct \
  --videos=../../input-videos/ready/${input_filename}.MP4 \
  --camera-profile dji_osmo_action_5_pro \
  --mapping scsfmlearner \
  --segmentation coralscapes-vit-b-dpt \
  --out output/${output_filename} \

# Options used for --segmentation models are segformer-b2 or coralscapes-vit-b-dpt

# Render video from reconstruction results
uv run deepreefmap render-video --run-dir output/${output_filename}
