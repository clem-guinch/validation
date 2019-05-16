#!/bin/bash
morning(){
    echo "Cela vous fera 59 euros"
}
afternoon(){
    echo "cela vous fera 75 euros"
}
accepted(){
    echo "souhaitez vous un aller simple 1) ou un aller retour 2)"
    read answer
    if [ $answer = 1 ]
        then
        echo "Départ a 1) 11h ou 2) 15h"
        read h
        case $h in
            1) morning;;
            2) afternoon;;
        esac
    elif [ $answer = 2 ]
        then
        echo "votre train partira de lyon a 9h et le retour sera a 20h"
    fi
}
rejected(){
    echo "Vous n'êtes pas éligible à cette offre"
    toParis
}
toParis(){
    echo "quel ticket souhaitez vous ? 1) -26 ans/retraité/précarité 2) normal"
    read situation
    if [ $situation = 1 ]
        then
        echo "Présentez moi votre carte d'identité svp 1) Oui 2) Non"
        read answer
        case $answer in
            1) accepted;;
            2) rejected;;
        esac
    elif [ $situation = 2 ]
        then   
        accepted
    fi
}

echo -e "\033[37;45mB \033[37;45mi \033[37;45me \033[37;45mn \033[37;41mv \033[37;41me \033[37;41mn \033[37;41mu \033[37;41me \033[0m"
echo "Quel est votre destination ? 1) Paris 2) Marseille"
read destination
case $destination in
    1) toParis;;
    2) toParis;;
esac
echo "Bon voyage"

read -p "Etes vous satisfait ? " happy
while [ $happy != "oui" ]
do
    read -p "Etes vous satisfait ? " happy
done

if [ $destination = 2 ]
    then
    echo "A TOUT LES VOYAGEURS PREPARER VOUS A L'IMPACT, DES VEHICULES BLOQUENT LA VOIE, ...AMEN !"
fi