#!/usr/bin/env bash
set -euo pipefail

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Ensure uv on PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/vscode/.zshrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/vscode/.bashrc

# Project bootstrap
cd /workspaces/"$(basename "$PWD")" || true
~/.local/bin/uv venv
~/.local/bin/uv pip install -U pip
~/.local/bin/uv pip install ruff black
