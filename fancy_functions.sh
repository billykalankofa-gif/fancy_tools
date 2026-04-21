#!/bin/bash

# Fonction gco : simplifie le commit avec le nom de la branche [cite: 42]
gco() {
    # Vérifier que l'utilisateur a fourni un message [cite: 50]
    if [ -z "$1" ]; then
        echo "Usage: gco 'votre message de commit'"
        return 1
    fi

    # Vérifier que le répertoire est un dépôt Git [cite: 45]
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "Erreur : Ce répertoire n'est pas un dépôt Git."
        return 1
    fi

    # Récupérer le nom de la branche courante [cite: 46]
    local branch_name=$(git branch --show-current)

    # Formater le message et effectuer le commit [cite: 46, 49]
    local full_message="[$branch_name] $1"
    git commit -m "$full_message"
}
