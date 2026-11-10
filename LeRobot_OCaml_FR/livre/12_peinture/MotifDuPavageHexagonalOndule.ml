open LibRobot

(* Motif du pavage hexagonal ondulé dessiné sur un
   hexagone de triangles équilatéraux *)

let l = 50.  (* Côté d'un triangle *)

(* Dessiner une rangée de n triangles équilatéraux *)
let rangeeDeTrianglesEquilateraux n =
  lgRT (l, 60.);
  for i = 1 to n do
    phtg (); av (); pqtd (); av (); phtg ()
  done;
  pdt (); avf (2 * n); pdt ()

let hexagoneDeTrianglesEquilateraux () =
  for i = 1 to 2 do
    rangeeDeTrianglesEquilateraux 4;
    phtg (); av (); phtd ();
    rangeeDeTrianglesEquilateraux 3;
    phtg (); av (); phtd ();
    lg l; avf 2; phtd ();
    lgRT (l, 60.); avf 2; p3htd ()
  done;
  phtd (); avf 2; phtg ()

let tourDuMotif () =
  lg l; phtg (); vd (); vg ();
  lgRT (l, 60.); phtg (); vd (); vg ();
  pqtg (); vd (); vg ();
  lg l; phtg (); vd (); vg ();
  lgRT (l, 60.); phtg (); vd (); vg ();
  pqtg (); vd (); vg ()

let interieurDuMotif () =
  lg l; phtg (); vd ();
  lgRT (l, 60.); phtg (); vg (); vd ();
  lg l; phtd (); vg ();
  lgRT (l, 60.); p3htg (); vd ();
  lg l; phtg (); vg (); vd ();
  lgRT (l, 60.); phtd (); vg ();
  pqtg (); vd ();
  pqtg (); vg (); vd ();
  pqtd (); vg ()

let () =
  pqtd (); hexagoneDeTrianglesEquilateraux ();
  ec 2; tourDuMotif ();
  ec 4; interieurDuMotif ();
  st ()
