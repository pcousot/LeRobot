open LibRobot

(* Dessiner une frise de triangles et de carrés *)

(* Dessiner un triangle, pointe à droite. Le robot part
   du coin SW, orienté au nord et arrive au même niveau
   sous la pointe orienté N. *)
let triangle_D () =
  av (); av (); p3htd (); av (); pqtd (); av (); p3htg ();
  lc (); av (); pqtg (); bc ()

(* Dessiner un carré en partant du coin SW (robot
   orienté N) et placer le robot au coin SE orienté N. *)
let carre () =
  (* Dessiner un carré en partant du coin SW (robot
     orienté N) *)
  for i = 1 to 4 do av (); av (); pqtd () done;
  (* Placer le robot au coin SE, orienté N *)
  pqtd (); av (); av (); pqtg ()

(* Dessiner un triangle, pointe à gauche. Le robot part
   de la pointe orienté au nord et arrive au même
   niveau, au milieu du grand côté est, orienté N. *)
let triangle_G () =
  phtd (); av (); p3htd (); av (); av (); p3htd (); av ();
  lc (); p3htd (); av (); pqtg (); bc ()

let () =
  ag ();
  for j = 1 to 4 do
    (* Dessiner 3 triangles, pointes à droite *)
    for i = 1 to 3 do triangle_D () done;
    (* Dessiner un carré *)
    carre ();
    (* Dessiner 3 triangles, pointes à gauche *)
    av ();
    for i = 1 to 3 do triangle_G () done;
    (* Dessiner un carré, collé au dernier triangle *)
    (* Descendre au coin SW du carré *)
    pdt (); av ();
    (* Orienter le robot au nord *)
    pdt (); carre ()
  done;
  st ()
