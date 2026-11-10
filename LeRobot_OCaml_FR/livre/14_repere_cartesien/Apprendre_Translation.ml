open LibRobot

(* Didacticiel : apprendre à translater des
   rectangles repérés par des coordonnées
   cartésiennes. Le programme demande de translater
   un rectangle de (x, y) : on déplace le robot avec
   la souris et on clique (ou on tape sur la touche
   Entrée). *)

let nbrMaxEssais = 5
let tailleQuadrillage = 10.
let xRect = 9  (* Côté horizontal du rectangle *)
let yRect = 3  (* Côté vertical du rectangle *)

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

(* Dessiner un rectangle dont les côtés horizontaux
   ont la longueur xRect, dont les côtés verticaux
   ont la longueur yRect et dont le coin inférieur
   gauche est situé au point où se trouve le robot. *)
let dessinerRectangle () =
  pn ();
  for i = 1 to 2 do
    avf yRect;  (* Dessiner un côté vertical *)
    pqtd ();
    avf xRect;  (* Dessiner un côté horizontal *)
    pqtd ()
  done

(* Écrire le texte t dans le rectangle et repérer son
   coin inférieur gauche par une croix *)
let ecrireDansLeRectangle t =
  lc (); av (); pqtd (); av (); ecrire t;
  pdt (); av (); pqtg (); av (); pdt (); bc ();
  croix ()

(* Dessiner un rectangle et écrire n à l'intérieur *)
let rectangle n =
  dessinerRectangle ();
  ecrireDansLeRectangle (entierEnChaine n)

(* Dessiner un rectangle et écrire n:(x,y) à
   l'intérieur *)
let rectangleEtTranslation n x y =
  dessinerRectangle ();
  ecrireDansLeRectangle (concat [entierEnChaine n;
    ":("; entierEnChaine x; ","; entierEnChaine y; ")"])

let () =
  lg tailleQuadrillage; tracerAxes ();
  styleTexte gras;
  let nbrReussis = ref 0 in
  let xsouris = ref 0 and ysouris = ref 0 in
  let c = ref ' ' in
  for essai = 1 to nbrMaxEssais do
    (* Tirer au sort les coordonnées (x, y) du coin
       inférieur gauche du rectangle à translater et
       celles (xt, yt) du rectangle translaté, de
       sorte que les rectangles tiennent dans le
       cadre *)
    let x = auHasard !xmin (!xmax - xRect) in
    let y = auHasard !ymin (!ymax - yRect) in
    let xt = auHasard !xmin (!xmax - xRect) in
    let yt = auHasard !ymin (!ymax - yRect) in
    (* Dessiner le rectangle à translater *)
    ce (); translater (x, y); cc violet;
    rectangleEtTranslation essai (xt - x) (yt - y);
    (* Demander à l'utilisateur de le translater *)
    message (concat ["Translater le coin inférieur ";
      "gauche du rectangle "; entierEnChaine essai;
      " de ("; entierEnChaine (xt - x); ", ";
      entierEnChaine (yt - y); ");"]);
    interactionTP xsouris ysouris c
      true false false true false;
    if xt - x = !xsouris && yt - y = !ysouris then begin
      (* Bonne translation : dessiner le rectangle
         translaté *)
      cc vert; rectangle essai;
      nbrReussis := !nbrReussis + 1
    end else begin
      (* Signaler l'erreur, marquer le point désigné
         d'un petit cercle numéroté et dessiner le
         rectangle translaté *)
      bip (); bip (); bip ();
      cc rouge; petitCercle ();
      lc ();
      if x + !xsouris + 3 > !xmax then begin
        pw (); av (); av ()  (* Écrire à gauche *)
      end else begin
        pe (); av ()  (* Écrire à droite *)
      end;
      bc (); ecrire (entierEnChaine essai);
      ce (); translater (xt, yt); cc bleu;
      rectangle essai
    end
  done;
  (* Indiquer les résultats *)
  ce (); translater (2, !ymin); cc noir;
  let essais = entierEnChaine nbrMaxEssais in
  if !nbrReussis = 0 then
    ecrire (concat ["Aucune réussite sur "; essais;
      " essais !"])
  else if !nbrReussis = 1 then
    ecrire (concat ["Une seule réussite sur "; essais;
      " essais !"])
  else
    ecrire (concat [entierEnChaine !nbrReussis;
      " réussites sur "; essais; " essais"]);
  ce (); st ()
