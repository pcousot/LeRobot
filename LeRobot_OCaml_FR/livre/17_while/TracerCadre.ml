open LibRobot

(* Tracer un cadre autour du dessin *)

(* Rejoindre le bord en avançant tout droit *)
let auBord () =
  while not (tb ()) do
    av ()
  done

let cadre () =
  (* Rejoindre le bord supérieur sans rien tracer *)
  lc (); auBord ();
  (* Tracer la moitié droite du bord supérieur *)
  pqtd (); bc (); auBord ();
  (* Tracer le bord droit *)
  pqtd (); auBord ();
  (* Tracer le bord inférieur *)
  pqtd (); auBord ();
  (* Tracer le bord gauche *)
  pqtd (); auBord ();
  (* Tracer le bord supérieur *)
  pqtd (); auBord ();
  (* Placer le robot au centre, orienté au nord *)
  ce (); pn ()

let () =
  cadre (); st ()
