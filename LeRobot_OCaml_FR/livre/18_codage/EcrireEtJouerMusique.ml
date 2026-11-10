open LibRobot

(* Écrire les notes sur une portée en les jouant *)

(* Taille de la grille *)
let x = 4
let y = 3

let dessinerRonde () =
  pn (); vd (); vd (); vd (); vd ()

let dessinerBlanche () =
  pn (); vd (); vd (); vd (); vd ()

let dessinerNoire () =
  pn (); vd (); vd (); vd (); vd (); vd (); pqtg ();
  peindre (); pqtd (); vd (); vd ();
  pqtg ();
  peindre (); pqtd (); vd ()

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

let jouer nomNote n oc f =
  message (nomNote ^ " = " ^ string_of_int n
           ^ ", numéro d'octave = " ^ string_of_int oc
           ^ ", octave = 12, code = ((" ^ string_of_int oc
           ^ " * octave) + " ^ nomNote ^ ") = "
           ^ string_of_int (n + oc * octave));
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
  note (oc * octave + n) f

let () =
  metronome 140; nuance forte;
  portee ();
  jouer "do" d0 (-3) noire;
  jouer "re" re (-3) noire;
  jouer "mi" mi (-3) noire;
  jouer "fa" fa (-3) noire;
  jouer "sol" sol (-3) noire;
  jouer "la" la (-3) noire;
  jouer "si" si (-3) noire;
  barre ();
  jouer "do" d0 (-2) noire;
  jouer "re" re (-2) noire;
  jouer "mi" mi (-2) noire;
  jouer "fa" fa (-2) noire;
  jouer "sol" sol (-2) noire;
  jouer "la" la (-2) noire;
  jouer "si" si (-2) noire;
  barre ();
  jouer "do" d0 (-1) noire;
  jouer "re" re (-1) noire;
  jouer "mi" mi (-1) noire;
  jouer "fa" fa (-1) noire;
  jouer "sol" sol (-1) noire;
  jouer "la" la (-1) noire;
  jouer "si" si (-1) noire;
  barre (); marquerUnePause ();
  effacerMessage (); portee ();
  jouer "do" d0 0 noire;
  jouer "re" re 0 noire;
  jouer "mi" mi 0 noire;
  jouer "fa" fa 0 noire;
  jouer "sol" sol 0 noire;
  jouer "la" la 0 noire;
  jouer "si" si 0 noire;
  barre ();
  jouer "do" d0 1 noire;
  jouer "re" re 1 noire;
  jouer "mi" mi 1 noire;
  jouer "fa" fa 1 noire;
  jouer "sol" sol 1 noire;
  jouer "la" la 1 noire;
  jouer "si" si 1 noire;
  barre ();
  jouer "do" d0 2 noire;
  jouer "re" re 2 noire;
  jouer "mi" mi 2 noire;
  jouer "fa" fa 2 noire;
  jouer "sol" sol 2 noire;
  jouer "la" la 2 noire;
  jouer "si" si 2 noire;
  barre (); marquerUnePause ();
  effacerMessage (); portee ();
  jouer "do" d0 3 noire;
  jouer "re" re 3 noire;
  jouer "mi" mi 3 noire;
  jouer "fa" fa 3 noire;
  jouer "sol" sol 3 noire;
  jouer "la" la 3 noire;
  jouer "si" si 3 noire;
  barre ();
  jouer "do" d0 4 noire;
  jouer "re" re 4 noire;
  jouer "mi" mi 4 noire;
  jouer "fa" fa 4 noire;
  jouer "sol" sol 4 noire;
  jouer "la" la 4 noire;
  jouer "si" si 4 noire;
  barre (); marquerUnePause ()
