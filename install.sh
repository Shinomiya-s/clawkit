#!/bin/bash

set -e

INSTALL_DIR="${HOME}/.local/bin"
CLAWKIT_DIR="${HOME}/.clawkit"
REPO_URL="https://github.com/Shinomiya-s/clawkit.git"

echo "Installing clawkit..."

# Check dependencies
if ! command -v git &> /dev/null; then
    echo "Error: git is required but not installed"
    exit 1
fi

if ! command -v openclaw &> /dev/null; then
    echo "Warning: openclaw not found. Install it first, then run clawkit."
fi

# Create directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$CLAWKIT_DIR"

# Clone or update
if [ -d "$CLAWKIT_DIR/.git" ]; then
    echo "Updating existing installation..."
    cd "$CLAWKIT_DIR" && git pull --depth 1
else
    echo "Cloning clawkit..."
    rm -rf "$CLAWKIT_DIR"
    git clone --depth 1 "$REPO_URL" "$CLAWKIT_DIR"
fi

# Link binary
ln -sf "$CLAWKIT_DIR/clawkit" "$INSTALL_DIR/clawkit"

# Add to PATH if needed
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo ""
    echo "Adding $INSTALL_DIR to PATH..."
    
    if [ -f "$HOME/.bashrc" ]; then
        echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.bashrc"
        echo "Updated ~/.bashrc"
    fi
    
    if [ -f "$HOME/.zshrc" ]; then
        echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.zshrc"
        echo "Updated ~/.zshrc"
    fi
    
    echo ""
    echo "Note: Run 'source ~/.bashrc' (or ~/.zshrc) to update your current shell"
fi

echo ""
echo "clawkit installed to $INSTALL_DIR/clawkit"
echo ""
echo "Get started:"
echo "  clawkit install essential    # Install core skills"
echo "  clawkit list                 # See available packs"
echo "  clawkit help                 # Show help"
