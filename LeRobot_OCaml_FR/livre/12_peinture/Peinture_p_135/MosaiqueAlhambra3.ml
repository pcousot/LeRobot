open LibRobot

(* Mosaïque de l'Alhambra *)

let tailleGrille = 3.   (* pixels *)
let largeurMotif = 4    (* fois la taille de la grille *)
let hauteurMotif = 6    (* fois la taille de la grille *)
let tailleLigne = 7     (* motifs d'une ligne impaire *)
let nombreDeLignes = 12 (* pair *)

(* Dessiner un motif en forme de 8, en partant et en
   arrivant à l'extrémité de la pointe inférieure
   gauche, avec le robot orienté vers le nord. *)
let motif () =
  for i = 1 to 2 do
    (* Côté gauche/droit (au dessus/dessous de la
       pointe inférieure). *)
    phtd (); av (); phtg (); avf (hauteurMotif - 4);
    phtg (); av (); pqtd (); av ();
    (* Dessus/dessous *)
    phtd (); avf (largeurMotif - 2); phtd ();
    (* Haut/bas du côté droit/gauche (en dessus/dessous
       de la pointe supérieure/inférieure). *)
    av (); phtd ()
  done;
  (* Colorier et tourner le robot dans l'orientation
     initiale. *)
  pqtg (); peindre (); pqtd ()

(* Passer de la pointe inférieure gauche d'un motif à
   celle du motif suivant sur la même ligne
   horizontale à droite. *)
let motifSuivant () =
  lc (); pqtd (); avf (2 * largeurMotif); pqtg (); bc ()

(* Dessiner une ligne horizontale comportant
   tailleLigne motifs. *)
let ligneImpaire () =
  for i = 1 to tailleLigne do
    motif (); motifSuivant ()
  done

(* Dessiner une ligne comportant (tailleLigne - 1)
   motifs. *)
let lignePaire () =
  for i = 1 to tailleLigne - 1 do
    motif (); motifSuivant ()
  done

(* Revenir sur la pointe inférieure gauche du premier
   motif d'une ligne. *)
let retourDebutDeLigne () =
  lc (); pqtg ();
  avf (2 * largeurMotif * tailleLigne - largeurMotif);
  pqtd (); bc ()

(* Passer de la pointe inférieure gauche d'un motif à
   celle du motif à la verticale sur la ligne
   suivante. *)
let ligneSuivante () =
  lc (); avf (- (hauteurMotif - 2)); bc ()

(* Paver avec un nombre de lignes égal à
   nombreDeLignes. *)
let pavage () =
  for i = 1 to nombreDeLignes / 2 do
    ligneImpaire (); retourDebutDeLigne ();
    ligneSuivante ();
    lignePaire (); retourDebutDeLigne ();
    ligneSuivante ()
  done

let () =
  (* Placer le robot à la pointe inférieure gauche du
     motif gauche de la première ligne. *)
  lc (); lg tailleGrille; ag (); eh (); pdt ();
  avf hauteurMotif; pqtg (); av (); pqtg (); bc ();
  pavage (); st ()
