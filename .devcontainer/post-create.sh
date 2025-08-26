#!/bin/bash
set -e

echo "=== Running post-create setup ==="

# Create and activate Python virtual environment
echo "Setting up Python virtual environment..."
python -m venv /home/node/algo-env
source /home/node/algo-env/bin/activate

# Add virtual environment activation to shell configs
echo "Configuring shell initialization files..."
echo "source /home/node/algo-env/bin/activate" >> /home/node/.bashrc
echo "source /home/node/algo-env/bin/activate" >> /home/node/.zshrc

# Run custom git configuration if available
if [ -f .devcontainer/git-config-custom.sh ]; then
    echo "Running custom git configuration..."
    bash .devcontainer/git-config-custom.sh
else
    echo "No executable .devcontainer/git-config-custom.sh found."
fi

echo "=== Post-create setup complete ==="