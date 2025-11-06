#!/usr/bin/env bash
# Guessing Game - Devinez le nombre de fichiers dans le répertoire courant

# Fonction pour compter les fichiers dans le répertoire courant
function count_files {
    local count=$(ls -1 | wc -l)
    echo $count
}

# Fonction principale du jeu
function play_game {
    local correct_answer=$(count_files)
    local user_guess=-1
    
    echo "Bienvenue au jeu de devinettes!"
    echo "Combien de fichiers se trouvent dans le répertoire courant?"
    
    # Boucle jusqu'à ce que l'utilisateur devine correctement
    while [[ $user_guess -ne $correct_answer ]]
    do
        echo -n "Entrez votre estimation: "
        read user_guess
        
        # Vérifier si l'entrée est un nombre
        if ! [[ "$user_guess" =~ ^[0-9]+$ ]]; then
            echo "Veuillez entrer un nombre valide."
            continue
        fi
        
        # Comparer la réponse de l'utilisateur avec le nombre correct
        if [[ $user_guess -lt $correct_answer ]]; then
            echo "Votre estimation est trop basse. Essayez encore!"
        elif [[ $user_guess -gt $correct_answer ]]; then
            echo "Votre estimation est trop haute. Essayez encore!"
        else
            echo "Félicitations! Vous avez deviné correctement!"
            echo "Il y a exactement $correct_answer fichier(s) dans le répertoire courant."
        fi
    done
}

# Lancer le jeu
play_game
