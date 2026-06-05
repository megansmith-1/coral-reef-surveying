# Coral Reef Surveying: AI Model Comparison

Comparing the efficacy of different AI models for automating underwater coral reef surveys. This project evaluates multiple state-of-the-art pipelines on standardized test videos to benchmark accuracy, speed and accessibility.

## Overview

Manual coral reef surveys are labor-intensive and difficult to scale. This project tests whether AI-powered computer vision models can automate the process by comparing different models on the same underwater video datasets.

### Input Videos

The input videos were taken with a consumer-grade camera (specifically the DJI Osmo Action Pro 5). Videos consist of a swim over a 30m, 50m and 70m transects with 60 FPS and 2688x1512 resolution.

All videos were captured at various dive sites in Zamboanguita, Negros Oriental, The Phillipines.

## Models Evaluated

- [DeepReefMap V1](https://github.com/josauder/mee-deepreefmap)
- [DeepReefMap V2](https://github.com/eceo-epfl/deepreefmap)

## Results

### Key Findings

**Strengths**

- Distinguishes branching coral genera across health states (dead, bleached, alive)
- Reliably detects fish (correctly treated as non-benthic)
- Accurately classifies seagrass and sand

**Weaknesses**

- Soft coral — frequently misclassified as branching, massive, or "other"
- Submassive coral — confused with massive coral, likely due to overlapping morphology across species; Porites submassives in particular are consistently labelled as massives

### Comparison of Models

## Getting Started

Each model has its own setup instructions and shell script (in this repository) that runs it. See below:

| Model           | Setup                                            | Notes                                                                             |
| --------------- | ------------------------------------------------ | --------------------------------------------------------------------------------- |
| MEE DeepReefMap | [Instructions](models/mee-deepreefmap/README.md) | Requires system install of FFmpeg with libx264. Run: `sh run_mee_deepreefmap.sh`. |

For both DeepReefMap models, you will need to make a couple of adjustments if you work on macOS to let the scripts utilise the GPU.
