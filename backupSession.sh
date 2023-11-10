#!/bin/bash

# parcours toutes les sessions des utilisateurs pour sauvegader leurs données
# script executée avec crontab pour sauvegarde périodique
exec 1> /home/rapport 2>&1
utilisateurs="/home/Public/"
# nettoie d'abord chaque station des fichiers inutiles
echo "La sauvegarde va être longue, taille du répertoire avant le cycle de sauvegarde : $(du -hs /home/Backup/)"
for users in "$utilisateurs"*/*
  do
  [[ -f "/home/Backup/$users".tar.xz ]] && rm -f "/home/Backup/$users".tar.xz
  echo "Archivage en cours de l'utilisateur :  $( echo "$users" | cut -d '/' -f5 )"
  tar --xz -cf "/home/Backup/$users".tar.xz "$users"
  done
  echo "Archivage terminé ! la taille du répertoire de backup est maintenant de $(du -hs /home/Backup/)" 
  
