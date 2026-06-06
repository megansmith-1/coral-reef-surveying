#!/bin/bash
# Example script to run DeepReefMap V1 model on a single video
# Run from coral-reef-surveying/ root directory

cd models/mee-deepreefmap/src

# Ensure system FFmpeg is in PATH before running uv
export PATH="/opt/homebrew/bin:$PATH"

filename="Andulay_Diseased_Table" # Change this to the name of your input video (without .MP4 extension)

# Run with uv python (uses all dependencies) but system FFmpeg
uv run python3 -u reconstruct.py \
--input_video=../../../input-videos/ready/${filename}.MP4 \
--timestamp=00:00-end \
--out_dir=../output/${filename} \
--fps=60 \
--render_video
