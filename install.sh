touch ~/.emacs.custom.el

git config --global user.email "dickson.alvin@gmail.com"
git config --global user.name "Alvin Dickson"

git config --global core.excludesFile '~/.gitignore'
# install fonts

FONT_NAME="Iosevka Nerd Font"
FONT_DIR="$HOME/.local/share/fonts"
FONT_CHECK="Iosevka Nerd Font"

# Check if font is already installed
if fc-list | grep -qi "$FONT_CHECK"; then
    echo "✓ $FONT_NAME already installed"
else
    echo "→ Installing $FONT_NAME..."

    mkdir -p "$FONT_DIR"
    cd "$FONT_DIR"

    TMP_ZIP="$(mktemp)"
    curl -fLo "$TMP_ZIP" \
	 https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.zip

    unzip -o "$TMP_ZIP"
    rm "$TMP_ZIP"

    fc-cache -fv

    echo "✓ $FONT_NAME installed successfully"
fi
