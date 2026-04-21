gco() {
    # Vérifie que le message est fourni
    if [ $# -eq 0 ]; then
        echo "Usage : gco 'message du commit'"
        return 1
    fi

    # Vérifie que c'est un dépôt Git
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : vous n'êtes pas dans un dépôt Git."
        return 1
    fi

    # Récupère le nom de la branche
    branche=$(git branch --show-current)

    # Formate le message
    message="[$branche] $*"

    # Commit
    git commit -m "$message"
}
