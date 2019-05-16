#!/bin/bash
# Créer le vagrantfile
# Demander infos 1.Choisir l'adresseIp / 2.Nom du dossier partagé à créer
# Remplir le vagrantfile
# Vagrant up
# Vagrant ssh
echo "Création du fichier vagrant"
touch Vagrantfile
echo "Choisssez la fin de votre adresse ip :"
read -p "192.168.33." ip
echo "Choisissez votre nom de dossier partagé"
read -p "./" dir

cat > vagrantfile << eof
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
config.vm.box = "ubuntu/xenial64"
config.vm.network "private_network", ip: "192.168.33.$ip"
config.vm.synced_folder "./$dir", "/var/www/html"
config.vm.provision "shell", inline: <<-SHELL
sudo apt update
SHELL
end
eof

mkdir $dir


vagrant up
vagrant ssh