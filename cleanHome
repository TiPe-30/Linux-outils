#!/bin/bash

#enlever tous les fichiers indésirables de l'ordinateur
rm -rf ~/.cache/*
[[ -d ~/snap ]] && for dossier in $(find ~/snap | grep -i cache)
  do
[[ -d $dossier ]] && rm -rf "$dossier"/*
   done
[[ -d ~/flatpak ]] && for dossier in $(find ~/flatpak | grep -i cache)
     do
[[ -d $dossier ]] && rm -rf "$dossier"/*
   done   
for dossier in $(find ~/.config | grep -i cache)
  do
[[ -d $dossier ]] && rm -rf "$dossier"/*
   done
[[ -d ~/.var ]] && for dossier in $(find ~/.var | grep -i cache)
     do
[[ -d $dossier ]] && rm -rf "$dossier"/*
   done   
echo "Nettoyage terminé !"   
