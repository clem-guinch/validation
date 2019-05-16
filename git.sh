
#!/bin/bash

read -p "Veuillez renseigner l'URL de votre remote: " link

git init
git status
git add --all
read -p "Quel message de commit entrez-vous ? " message 
git branch
echo -p "Sur quelle branche souhaitez vous push? " branch
git commit -m $message
git remote add origin $link
git push origin $branch