#!/bin/bash
echo "***************************************************************************"
echo "****************Bienvenue sur le script de mise a jour !*******************"
echo "***************************************************************************"
echo ""
#on mets tous les packets a jour avec ce qui suit
sudo apt update
for file in $(apt list --upgradable | cut -d '/' -f1)
  do 
sudo apt install -y $file 2> /dev/null
done
sudo apt dist-upgrade
sudo apt autoremove --purge -y
sudo apt autoclean
sudo apt clean
[[ -d /var/lib/flatpak ]] && flatpak update -y
[[ -d /snap ]] && sudo snap refresh
#permet de retirer les anciennes dépendances devenue inutile de snap
LANG=C snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision ; do sudo snap remove "$snapname" --revision="$revision" ; done
sudo apt purge ~c
echo ""
echo "******************************************"
echo "*****Fin du script de mise a jour !*******"  
echo "******************************************"  


