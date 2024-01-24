#!/bin/bash
read -p "Entrez le nom de l'utilisateur: " nomUser
echo -e "\n\n"
read -p "Entrez le groupe de l'utilisateur(si il n'existe pas il sera créer !) : " nomGroup
[[ -z $(grep -w $nomGroup /etc/group) ]] && sudo groupadd $nomGroup
[[ ! -d "/home/Public/$nomGroup" ]] && mkdir "/home/Public/$nomGroup"
sudo useradd -m -g "$nomGroup" -s /bin/bash -d "/home/Public/$nomGroup/$nomUser" "$nomUser"
echo -e "Il faut définir le mot de passe de la session, jusqu'a ce que le propriétaire de la session le fasse ! \n"
sudo passwd $nomUser
[[ -d "/home/Public/$nomGroup" ]] && echo "L'utilisateur $nomUser a été ajouté avec succés !"
