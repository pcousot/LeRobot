open LibRobot

(* Dessiner une portée et des notes de musique *)

(* Taille de la grille *)
let x = 4
let y = 3
(* Une note n de l'octave o avec l'altération a est codée
   par o * octave + n + a. Codes des notes : *)
let ut = 0
let d0 = 0
let re = 2
let mi = 4
let fa = 5
let sol = 7
let la = 9
let si = 11
let octave = 12
(* Codes des figures de notes : *)
let ronde = 4
let blanche = 2
let blanche_pointee = 3
let noire = 1

let dessinerRonde () =
  pn (); vd (); vd (); vd (); vd ()

let dessinerBlanche () =
  pn (); vd (); vd (); vd (); vd ()

let dessinerNoire () =
  pn (); vd (); vd (); vd (); vd (); vd (); pqtg ();
  peindre (); pqtd (); vd (); vd ();
  pqtg (); peindre (); pqtd (); vd ()

let queueVersLeHaut () =
  translater (2, 0); avf 6; translater (-2, -6)

let queueVersLeBas () =
  avf (-6); translater (0, 6)

let cle () =
  ec 2; lgX (float_of_int x); lgY (float_of_int y);
  translater (2, 4); pn ();
  lg (float_of_int (2 * y));
  vd (); vd (); lgX (float_of_int (3 * y)); vd ();
  lgY (float_of_int (4 * y)); vd ();
  phtd (); lg (float_of_int (4 * y));
  av (); phtd (); lgX (float_of_int (2 * y));
  lgY (float_of_int (3 * y)); vg ();
  lgX (float_of_int y); vg (); vg ();
  lgY (float_of_int y); avf 14; lg (float_of_int (2 * y));
  vd ();
  lgX (float_of_int x /. 3.); lgY (float_of_int y /. 3.);
  vd (); vd (); vd (); vd (); pqtd ();
  lgX (float_of_int x); lgY (float_of_int y);
  translater (2, 3);
  ec 1

let portee () =
  cf blanc; lgX (float_of_int (4 * x));
  lgY (float_of_int y); cacherRobot ();
  ag (); pe ();
  for ligne = 1 to 5 do
    while not (tb ()) do av () done;
    pdt (); translater (0, -2)
  done;
  (* Placer le robot sur la ligne du do du milieu du
     clavier du piano *)
  ag (); lgX (float_of_int x); cle ()

(* Tracer un barre verticale *)
let barre () =
  translater (4, 2); pn (); avf 8; translater (-3, -10)

(* Remonter de la position courante de la note à la
   position du do du milieu du piano en traçant des lignes
   supplémentaires. *)
let remonter n =
  pe ();
  if n mod 2 = 1 then
    (* Ne pas couper la note re, fa, ... par une ligne *)
    translater (0, 1);
  for i = 1 to n / 2 + 1 do translater (-1, 0); avf 4;
  translater (-3, 2) done;
  translater (0, -2)

(* Redescendre de la position courante de la note à la
   position du do du milieu du piano en traçant des lignes
   supplémentaires. *)
let redescendre n =
  pe ();
  if n = 0 then begin
    (* do du milieu du clavier du piano *)
    translater (-1, 0); avf 4; translater (-3, 0)
  end else if n <= 11 then
    (* note sur la portee *)
    translater (0, - n)
  else begin
    if n mod 2 = 1 then
      (* Ne pas couper la note re, fa, ... par une
         ligne *)
      translater (0, -1);
    for i = 1 to n / 2 - 1 do translater (-1, 0); avf 4;
    translater (-3, -2) done;
    translater (0, -2)
  end

let jouer n oc f =
  (* Passer à la note suivante *)
  translater (5, 0);
  (* Placer le robot sur la bonne ligne *)
  if n = d0 then translater (0, oc * 7)
  else if n = re then translater (0, oc * 7 + 1)
  else if n = mi then translater (0, oc * 7 + 2)
  else if n = fa then translater (0, oc * 7 + 3)
  else if n = sol then translater (0, oc * 7 + 4)
  else if n = la then translater (0, oc * 7 + 5)
  else if n = si then translater (0, oc * 7 + 6);
  (* Dessiner la note *)
  if f = ronde then dessinerRonde ()
  else if f = blanche then dessinerBlanche ()
  else dessinerNoire ();
  (* Dessiner la queue de la note *)
  if f = blanche || f = noire then
    if oc * octave + n < si then queueVersLeHaut ()
    else queueVersLeBas ();
  (* Revenir sur la ligne du do du milieu du clavier du
     piano. *)
  if n = d0 then
    if oc >= 0 then redescendre (oc * 7)
    else remonter (- (oc * 7))
  else if n = re then
    if oc >= 0 then redescendre (oc * 7 + 1)
    else remonter (- (oc * 7 + 1))
  else if n = mi then
    if oc >= 0 then redescendre (oc * 7 + 2)
    else remonter (- (oc * 7 + 2))
  else if n = fa then
    if oc >= 0 then redescendre (oc * 7 + 3)
    else remonter (- (oc * 7 + 3))
  else if n = sol then
    if oc >= 0 then redescendre (oc * 7 + 4)
    else remonter (- (oc * 7 + 4))
  else if n = la then
    if oc >= 0 then redescendre (oc * 7 + 5)
    else remonter (- (oc * 7 + 5))
  else if n = si then
    if oc >= 0 then redescendre (oc * 7 + 6)
    else remonter (- (oc * 7 + 6));
  (* Jouer la note *)
  if f = ronde then
    note (oc * octave + n) (float_of_int ronde)
  else if f = blanche then
    note (oc * octave + n) (float_of_int blanche)
  else
    note (oc * octave + n) (float_of_int noire)

let () =
  metronome 200; nuance forte;
  portee ();
  message "do"; jouer d0 0 noire;
  message "re"; jouer re 0 noire;
  message "mi"; jouer mi 0 noire;
  message "fa"; jouer fa 0 noire;
  message "sol"; jouer sol 0 noire;
  message "la"; jouer la 0 noire;
  message "si"; jouer si 0 noire;
  barre ();
  message "do"; jouer d0 1 noire;
  message "re"; jouer re 1 noire;
  message "mi"; jouer mi 1 noire;
  message "fa"; jouer fa 1 noire;
  message "sol"; jouer sol 1 noire;
  message "la"; jouer la 1 noire;
  message "si"; jouer si 1 noire;
  barre ();
  message "do"; jouer d0 2 noire;
  message "re"; jouer re 2 noire;
  message "mi"; jouer mi 2 noire;
  marquerUnePause ()
