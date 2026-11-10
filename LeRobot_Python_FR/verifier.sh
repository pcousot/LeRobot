#!/bin/zsh
# verifier.sh -- fait defiler les programmes du livre (livre/) pour
# verifier les dessins un par un.
#
#   ./verifier.sh [REPERTOIRE] [DEPUIS]
#
#   REPERTOIRE  sous-repertoire de livre/ (defaut : tous)
#               ex. 02_interaction  ou  20_grille_polaire
#   DEPUIS      reprendre au premier programme dont le chemin contient
#               ce texte (ex. Chiffre4)
#
# Quand le dessin est fini, on repond DANS LA FENETRE DU ROBOT (consignes
# dans la barre du bas) :
#   Entree        dessin correct, programme suivant
#   r             relancer le meme programme
#   q ou Echap    arreter (la commande pour reprendre est affichee)
#   autre touche  taper une remarque (terminee par Entree), notee dans
#                 verification.txt, puis programme suivant
#
# Les programmes qui posent des questions (readln, lireEntier) les
# affichent dans la barre du bas de la fenetre du robot (et dans ce
# terminal) : repondre dans l'une ou l'autre, puis Entree.
#
# LEROBOT_MUET=1 coupe le son (chansons, bips).

cd "${0:A:h}"
export PYTHONPATH=$PWD${PYTHONPATH:+:$PYTHONPATH}
dir=livre${1:+/$1}
depuis=$2
notes=$PWD/verification.txt

liste=(${(f)"$(find $dir -name '*.py' | sort)"})
total=${#liste}
[ $total -eq 0 ] && { echo "aucun programme dans $dir"; exit 1; }

echo "Repondre dans la fenetre du robot : Entree = correct, r = relancer,"
echo "q = quitter, autre touche = remarque (notee dans verification.txt)."

demarre=${depuis:+non}
n=0
for f in $liste; do
  n=$((n + 1))
  if [ "$demarre" = non ]; then
    [[ $f == *$depuis* ]] && demarre=oui || continue
  fi
  nom=${f#livre/}
  while true; do
    print -P "%B[$n/$total] $nom%b"
    grep -qE 'lireEntier|lireReel|lireChaine|lireCaractere|readln\(\)' $f \
      && echo "  (ce programme pose des questions : repondre dans la fenetre du robot ou ici)"
    (cd ${f:h} && LEROBOT_VERIFIER=$notes LEROBOT_PROGRAMME="[$n/$total] $nom" \
       ${LEROBOT_PYTHON:-python3} ${f:t})
    code=$?
    case $code in
      0)  ;;
      10) echo "  remarque notee dans verification.txt" ;;
      11) continue ;;
      12) echo "Arret. Pour reprendre : ./verifier.sh '$1' '${f:t:r}'"
          exit 0 ;;
      *)  echo "  le programme s'est arrete (code $code)"
          print -r -- "$nom : arret anormal (code $code)" >> $notes ;;
    esac
    break
  done
done
echo "Termine ($total programmes)."
[ -s $notes ] && echo "Remarques : $notes"
exit 0
