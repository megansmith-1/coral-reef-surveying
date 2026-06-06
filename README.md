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

- Distinguishes the different table and branching coral genera
- Reliably detects fish (correctly treated as non-benthic)
- Accurately classifies patches of seagrass, sand and rubble

![Example of strengths](assets/strengths.gif)
_DeepReefMap V1 showing successful identification of branching corals (table acropora specifically), fish and patches of sand and rubble_

**Weaknesses**

- Soft coral — frequently misclassified as branching, massive, or "other"
- Submassive coral — confused with massive coral, likely due to overlapping morphology across species; Porites submassives in particular are consistently labelled as massives

![Example of weaknesses](assets/weaknesses.gif)
_DeepReefMap V2 showing misidentification of the porites submassive growth form as a massive and a large soft coral as various genera of branching_

### Comparison of Models

- DeepReefMap V2 was better at segmenting clusters of coral with different growth types and health states
- V2 also sometimes correctly identified soft corals as "other coral alive" rather than misclassifying it as a type of branching genus.

![Example of model differences](assets/model_comparison.gif)
_Comparison between DeepReefMap V1 (left) and V2 (right) showing their varing abilities to correctly identify different health states of branching coral_

## Getting Started

Each model has its own setup instructions and shell script (in this repository) that runs it. See below:

| Model           | Setup                                            | Notes                                                                             |
| --------------- | ------------------------------------------------ | --------------------------------------------------------------------------------- |
| MEE DeepReefMap | [Instructions](models/mee-deepreefmap/README.md) | Requires system install of FFmpeg with libx264. Run: `sh run_mee_deepreefmap.sh`. |

For both DeepReefMap models, you will need to make a couple of adjustments if you work on macOS to let the scripts utilise the GPU.
