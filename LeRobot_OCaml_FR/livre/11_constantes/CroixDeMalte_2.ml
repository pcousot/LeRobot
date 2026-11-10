open LibRobot

(* Dessiner six croix de Malte de largeurs et de
   longueurs différentes *)

let espacement = 10  (* Pixels entre deux croix *)

let brancheVerticale longueur largeur =
  lgX (float_of_int largeur); lgY (float_of_int longueur);
  vg (); pdt (); av (); av (); pdt (); vg (); pqtg ()

let brancheHorizontale longueur largeur =
  lgX (float_of_int longueur); lgY (float_of_int largeur);
  vg (); pdt (); av (); av (); pdt (); vg (); pqtg ()

let croixDeMalte largeur longueur =
  (* Partant du bord ouest de la croix, décaler le
     robot à droite au centre de la croix *)
  lg 1.; lc (); pqtd (); avf longueur; pqtg (); bc ();
  (* Dessiner la croix de Malte à quatre branches *)
  for i = 1 to 2 do
    brancheVerticale longueur largeur;
    brancheHorizontale longueur largeur
  done;
  (* Décaler le robot à droite à l'est de la croix *)
  lg 1.; lc (); pqtd (); avf (longueur + espacement);
  pqtg (); bc ()

let () =
  ag ();
  croixDeMalte 10 15; croixDeMalte 15 20;
  croixDeMalte 20 25; croixDeMalte 25 30;
  croixDeMalte 10 35; croixDeMalte 35 35;
  st ()
