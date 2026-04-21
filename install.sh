#!/bin/bash
set -e # Arrête le script en cas d'erreur [cite: 62]

REPO_URL='https://github.com/billykalankofa-gif/fancy_tools.git' 
SRC_DIR="$HOME/src/fancy_tools" 

# Fonction utilitaire pour éviter les doublons dans .bashrc 
add_if_missing() {
    grep -qF "$1" ~/.bashrc || echo "$1" >> ~/.bashrc 
}

echo "Début de l'installation..."

# 1. Sauvegarder .bashrc avec horodatage 
cp ~/.bashrc ~/.bashrc.bak_$(date +%Y%m%d_%H%M%S)

# 2. Cloner le dépôt dans ~/src si absent
if [ ! -d "$SRC_DIR" ]; then
    mkdir -p ~/src
    git clone -b dev "$REPO_URL" "$SRC_DIR"
fi

# 3. Ajouter les configurations dans .bashrc 
add_if_missing "source $SRC_DIR/.aliases"
add_if_missing "source $SRC_DIR/fancy_functions.sh"
add_if_missing "export PATH=\$PATH:\$HOME/bin"

# Créer le dossier bin s'il n'existe pas
mkdir -p ~/bin

echo "Installation terminée. Relancez votre terminal ou tapez 'source ~/.bashrc'."
