# Coral Reef Surveying: AI Model Comparison

Comparing the efficacy of different AI models for automating underwater coral reef surveys. This project evaluates multiple state-of-the-art pipelines on standardized test videos to benchmark accuracy, speed and accessibility.

## Overview

Manual coral reef surveys are labor-intensive and difficult to scale. This project tests whether AI-powered computer vision models can automate the process by comparing different models on the same underwater video datasets.

### Input Videos

The input videos were taken with a consumer-grade camera (specifically the DJI Osmo Action Pro 5). Videos consist of a swim over a 50m transect with the following settings:

- FPS:
- Resolution:
- Speed:

All videos were captured at various dive sites in Zamboanguita, Negros Oriental, The Phillipines.

## Models Evaluated

| Model                                         | Status      | Output                                    |
| --------------------------------------------- | ----------- | ----------------------------------------- |
| [MEE DeepReefMap V1](models/mee-deepreefmap/) | ✅ Complete | [Results](models/mee-deepreefmap/output/) |
| Model 2                                       | ⏳ Planned  | —                                         |
| Model 3                                       | ⏳ Planned  | —                                         |

## Results

### Key Findings

- _Add results as models are tested_

### Comparison of Models

- _Add results as models are tested_

## Methodology

All models are evaluated using:

- **Standardized Inputs**: Test videos in `input-videos/` (single camera and dual camera setups)

## Getting Started

Each model has its own setup instructions. See the specific model's `README.md`:

- [MEE DeepReefMap Setup](models/mee-deepreefmap/README.md)

To add a new model, create a directory in `models/` and follow the same structure.
