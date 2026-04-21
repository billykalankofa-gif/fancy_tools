#!/bin/bash

set -e

REPO_URL="https://github.com/billykalankofa-gif/fancy_tools.git"
SRC_DIR="$HOME/src/fancy_tools"
BASHRC="$HOME/.bashrc"

# Fonction utilitaire : ajoute une ligne si absente
add_if_missing() {
    grep -qxF "$1" "$BASHRC" || echo "$1" >> "$BASHRC"
}

echo "Installation Fancy Tools..."

# 1. Sauvegarde de ~/.bashrc avec horodatage
BACKUP="$HOME/.bashrc.bak.$(date +%Y%m%d_%H%M%S)"
cp "$BASHRC" "$BACKUP"
echo "Backup créé : $BACKUP"

# 2. Créer ~/src si besoin
mkdir -p "$HOME/src"

# 3. Cloner le dépôt si absent
if [ ! -d "$SRC_DIR" ]; then
    git clone "$REPO_URL" "$SRC_DIR"
    echo "Dépôt cloné"
else
    echo "Dépôt déjà présent"
fi

# 4. Ajouter ~/bin au PATH (sans doublon)
add_if_missing 'export PATH="$HOME/bin:$PATH"'

# 5. Sourcer .aliases (sans doublon)
add_if_missing 'if [ -f "$HOME/src/fancy_tools/.aliases" ]; then'
add_if_missing '    source "$HOME/src/fancy_tools/.aliases"'
add_if_missing 'fi'

# 6. Sourcer fancy_functions.sh (sans doublon)
add_if_missing 'if [ -f "$HOME/src/fancy_tools/fancy_functions.sh" ]; then'
add_if_missing '    source "$HOME/src/fancy_tools/fancy_functions.sh"'
add_if_missing 'fi'

echo "Installation terminée ✔"
echo "Recharge ton terminal avec : source ~/.bashrc"
