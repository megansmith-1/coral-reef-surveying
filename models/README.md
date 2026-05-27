# Model Directories

This directory contains the model repositories used for comparison. Each model is a separate Git repository and is **not committed** to this project.

## Structure

```
models/
├── mee-deepreefmap/        # External repo
├── model-2/                # External repo (to be added)
├── model-3/                # External repo (to be added)
└── README.md               # This file
```

## Adding a Model

1. Clone or copy the model repository into this directory:

   ```bash
   git clone <model-repo-url> models/<model-name>
   # or
   cp -r /path/to/model-repo models/<model-name>
   ```

2. Each model should have its own Python environment (venv or conda)
