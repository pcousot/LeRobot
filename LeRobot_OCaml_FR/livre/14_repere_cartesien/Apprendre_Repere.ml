open LibRobot

(* Didacticiel : apprendre à repérer les points du
   plan par leurs coordonnées cartésiennes.
   Le programme demande de désigner un point (x, y) :
   on déplace le robot avec la souris et on clique
   (ou on tape sur la touche Entrée). *)

let nbrMaxEssais = 5
let tailleQuadrillage = 10.

(* Coordonnées extrêmes des points du cadre, trouvées
   en traçant les axes *)
let xmin = ref 0
let xmax = ref 0
let ymin = ref 0
let ymax = ref 0

(* Écrire le nombre n à côté de l'axe que le robot
   est en train de tracer *)
let numeroter n =
  lc ();
  if te () then begin
    pqtd (); av (); ecrire (entierEnChaine n);
    pdt (); av (); pqtd ()
  end else if tn () then begin
    pqtg (); avf 2; ecrire (entierEnChaine n);
    pdt (); avf 2; pqtg ()
  end else if tw () then begin
    pqtg (); av (); ecrire (entierEnChaine n);
    pdt (); av (); pqtg ()
  end else if ts () then begin
    pqtd (); avf 2; ecrire (entierEnChaine n);
    pdt (); avf 2; pqtd ()
  end;
  bc ()

(* Tracer un axe gradué depuis l'origine jusqu'au
   bord du cadre ; borne reçoit la coordonnée du
   dernier point de l'axe *)
let tracerUnAxe borne increment =
  borne := 0;
  while not (tb ()) do
    if !borne <> 0 && !borne mod 5 = 0 then begin
      numeroter !borne; cc indigo
    end else cc rouge;
    dc (); cc noir; av (); borne := !borne + increment
  done

let tracerAxes () =
  ce (); pe (); lg 3.; av (); lg tailleQuadrillage;
  numeroter 0;
  (* Axe des x *)
  ce (); pe (); tracerUnAxe xmax 1;
  translater (-1, 1); ecrire "X";
  ce (); pw (); tracerUnAxe xmin (-1);
  (* Axe des y *)
  ce (); pn (); tracerUnAxe ymax 1;
  translater (1, -1); ecrire "Y";
  ce (); ps (); tracerUnAxe ymin (-1);
  pn (); cc rouge; dg (); cc noir;
  autoriserSorties ()

let petitCercle () =
  lg 2.; vg (); vg (); vg (); vg (); lg tailleQuadrillage

let croix () =
  ec 3; dc (); ec 1

(* Tirer au sort un nombre entre a et b *)
let auHasard a b =
  a + Random.int (b - a + 1)

let () =
  lg tailleQuadrillage; tracerAxes ();
  styleTexte gras;
  let nbrReussis = ref 0 in
  let xsouris = ref 0 and ysouris = ref 0 in
  let c = ref ' ' in
  for essai = 1 to nbrMaxEssais do
    (* Tirer au sort les coordonnées du point (x, y)
       à désigner *)
    let x = auHasard !xmin !xmax in
    let y = auHasard !ymin !ymax in
    (* Demander à l'utilisateur de désigner le point *)
    ce ();
    message (concat ["Repérer le point (";
      entierEnChaine x; ", "; entierEnChaine y; ");"]);
    interactionTP xsouris ysouris c
      true false false true false;
    if x = !xsouris && y = !ysouris then begin
      (* Le point demandé a bien été désigné : le
         marquer d'une croix *)
      cc vert; croix ();
      nbrReussis := !nbrReussis + 1
    end else begin
      (* Signaler l'erreur, marquer le point désigné
         d'un petit cercle et le point demandé d'une
         croix *)
      bip (); bip (); bip ();
      cc rouge; petitCercle ();
      ce (); translater (x, y); cc bleu; croix ()
    end
  done;
  cc noir;
  (* Indiquer les résultats *)
  ce (); translater (2, !ymin);
  let essais = entierEnChaine nbrMaxEssais in
  if !nbrReussis = 0 then
    message (concat ["Aucune réussite sur "; essais;
      " essais !"])
  else if !nbrReussis = 1 then
    message (concat ["Une seule réussite sur "; essais;
      " essais !"])
  else
    message (concat [entierEnChaine !nbrReussis;
      " réussites sur "; essais; " essais"]);
  ce (); marquerUnePause ()
