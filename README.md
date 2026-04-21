# fancy_
# Fancy Tools 
**Auteur : Billy**

## 1. Description du projet
[cite_start]Ce projet consiste en la création d'un outil d'installation automatisé en Shell nommé **Fancy Tools**[cite: 1, 3]. [cite_start]Il permet de mettre en place un environnement de travail optimisé avec des alias Git, des fonctions personnalisées et un script de mise à jour automatique[cite: 12, 14, 71].

## 2. Prérequis
Pour utiliser cet outil, les éléments suivants sont nécessaires :
* [cite_start]**Système d'exploitation :** Environnement de niveau L1 (Linux/Unix).
* [cite_start]**Outils :** Bases du Shell et Git installés.
* [cite_start]**Compte :** Un compte GitHub pour héberger le dépôt.

## 3. Installation (Étape par étape)
[cite_start]Suivez cette procédure pour installer l'environnement sur une nouvelle machine:

Exécution du script :
Lancez le script d'installation qui configure automatiquement votre environnement:Bashbash install.sh
Finalisation :
Ouvrez un nouveau terminal pour activer les alias et les fonctions.4. UtilisationAlias Git disponiblesgss : Affiche le statut du dépôt (git status).gpl : Récupère les modifications distantes (git pull).gpu : Envoie les modifications (git push).gap : Ajoute tous les fichiers modifiés (git add .).Fonction Shell gcoLa fonction gco simplifie les commits en ajoutant automatiquement le nom de la branche actuelle en préfixe du message.Exemple : gco 'mon message' → Résultat : [dev] mon message.Mise à jourUtilisez la commande updateFancyTools pour récupérer la dernière version stable depuis la branche main de GitHub vers votre dossier ~/bin.5. Structure du projetVoici l'arborescence commentée du dépôt:.aliases : Définition des raccourcis Git.fancy_functions.sh : Contient la logique de la fonction gco.install.sh : Script d'installation robuste et idempotent.bin/updateFancyTools : Script de mise à jour des outils.README.md : Documentation technique (ce fichier).6. Retour d'expérienceLa partie la plus difficile de ce TP a été la phase de vérification et de test. J'ai rencontré des erreurs lors de l'installation car certains fichiers ou dossiers existaient déjà. Pour réussir la validation, j'ai dû apprendre à supprimer manuellement le répertoire ~/src/fancy_tools et à nettoyer les lignes ajoutées dans mon ~/.bashrc afin de repartir d'un environnement vierge. Cela m'a permis de comprendre l'importance de rendre un script idempotent.
