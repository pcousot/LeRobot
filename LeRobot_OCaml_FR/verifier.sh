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
# Chaque programme s'ouvre dans la fenetre du robot (XQuartz, au premier
# plan). Quand le dessin est fini, on repond DANS LA FENETRE DU ROBOT
# (consignes dans la barre du bas) :
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
export DISPLAY=:0
dir=livre${1:+/$1}
depuis=$2
notes=$PWD/verification.txt

# XQuartz : /tmp/.X11-unix doit appartenir a root, puis le serveur doit
# repondre (voir aussi make xquartz)
if [ ! -d /tmp/.X11-unix ] || [ "$(stat -f %Su /tmp/.X11-unix)" != root ]; then
  echo "/tmp/.X11-unix absent ou pas a root : mot de passe demande (sudo)"
  sudo mkdir -p /tmp/.X11-unix && sudo chown root:wheel /tmp/.X11-unix \
    && sudo chmod 1777 /tmp/.X11-unix
fi
# attendre que XQuartz reponde (le lancer s'il le faut)
attendre_xquartz() {
  /opt/X11/bin/xdpyinfo >/dev/null 2>&1 && return 0
  echo "Demarrage de XQuartz..."
  open -a XQuartz
  for i in {1..30}; do
    /opt/X11/bin/xdpyinfo >/dev/null 2>&1 && { sleep 1; return 0; }
    sleep 1
  done
  echo "XQuartz ne repond pas"; return 1
}
attendre_xquartz || exit 1

eval $(opam env)
dune build 2>&1 | head -20

liste=()
for f in ${(f)"$(find $dir -name '*.ml' | sort)"}; do
  # seuls les programmes cites dans un fichier dune sont compiles
  [ -x _build/default/${f%.ml}.exe ] && liste+=$f
done
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
  exe=_build/default/${f%.ml}.exe
  nom=${f#livre/}
  while true; do
    print -P "%B[$n/$total] $nom%b"
    grep -qE 'lireEntier|lireReel|lireChaine|lireCaractere|readln \(\)' $f \
      && echo "  (ce programme pose des questions : repondre dans la fenetre du robot ou ici)"
    # XQuartz pret et au premier plan pour que la fenetre du robot soit
    # visible
    attendre_xquartz || exit 1
    open -a XQuartz
    LEROBOT_VERIFIER=$notes LEROBOT_PROGRAMME="[$n/$total] $nom" $exe
    code=$?
    case $code in
      0)  ;;
      10) echo "  remarque notee dans verification.txt" ;;
      11) continue ;;
      12) echo "Arret. Pour reprendre : make verifier DIR='$1' DEPUIS='${f:t:r}'"
          exit 0 ;;
      *)  # XQuartz a ete quitte pendant le programme : le relancer et
          # recommencer ce programme (ce n'est pas une erreur du programme)
          if ! /opt/X11/bin/xdpyinfo >/dev/null 2>&1; then
            echo "  XQuartz a ete quitte : on le relance (q dans la fenetre"
            echo "  du robot pour arreter la verification)"
            attendre_xquartz || exit 1
            continue
          fi
          echo "  le programme s'est arrete (code $code)"
          print -r -- "$nom : arret anormal (code $code)" >> $notes ;;
    esac
    break
  done
done
echo "Termine ($total programmes)."
[ -s $notes ] && echo "Remarques : $notes"
exit 0
