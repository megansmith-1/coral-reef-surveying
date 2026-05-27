#!/bin/bash
# Example script to run MEE DeepReefMap model on a single video
# Run from coral-reef-surveying/ root directory

cd models/mee-deepreefmap/src

# Ensure system FFmpeg is in PATH before running uv
export PATH="/opt/homebrew/bin:$PATH"

# Run with uv python (uses all dependencies) but system FFmpeg
uv run python3 -u reconstruct.py \
--input_video=../../../input-videos/2-cameras/Andulay_S-M1_50M_Left.MP4 \
--timestamp=00:25-00:49 \
--out_dir=../output/test_run \
--fps=60 \
--render_video
