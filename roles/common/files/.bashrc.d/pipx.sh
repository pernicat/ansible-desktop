# Enable pipx for the user

# No need for this is using default pipx installation

# export PIPX_BIN_DIR="$HOME/.local/bin"
# export PIPX_HOME="$HOME/.local/pipx"

# Ensure ~/.local/bin is in PATH for pipx-installed apps
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Initialize pipx completions if available
# if command -v pipx &>/dev/null; then
#     eval "$(register-python-argcomplete pipx 2>/dev/null || true)"
# fi