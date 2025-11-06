#!/bin/bash

function ask {
  echo "combien de fichiers t'ils ici ?"
}

files=$(ls -A | wc -l)
# echo "kayen hna $files"

guess=-1

while [ "$guess" -ne "$files" ]; do
  ask
  read guess
  if [ "$guess" -lt "$files" ]; then
    echo "Trop bas."
  elif [ "$guess" -gt "$files" ]; then
    echo "Trop haut."
  else
    echo "Félicitations ! Vous avez deviné correctement !"
    echo "Il y a $files fichiers dans le répertoire courant."
  fi
done
