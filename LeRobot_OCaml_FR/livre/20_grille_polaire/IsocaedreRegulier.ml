open LibRobot

(* Dessiner le développement d'un isocaèdre régulier *)

let cote = 25.

(* Dessiner un triangle équilatéral en partant du coin
   gauche de la base et ramener le robot au coin droit
   de la base. Le robot est orienté au nord dans les
   deux cas. *)
let triangleEquilateral () =
  lgRT (cote, 60.); phtd (); av (); pqtd (); av ();
  p3htd (); avf 2; pdt ();
  avf 2; pqtg ()

(* Dessiner une double rangée de 5 triangles
   équilatéraux, les triangles des deux rangées ayant
   même bases. *)
let doubleRangeeDeTriangles () =
  for i = 1 to 2 do
    for j = 1 to 5 do
      triangleEquilateral ()
    done;
    pdt ()
  done

let isocaedre () =
  doubleRangeeDeTriangles ();
  (* Descendre au départ de la deuxième double rangée
     de triangles *)
  lc (); pdt (); av (); pqtd (); av (); pqtd (); bc ();
  doubleRangeeDeTriangles ()

let () =
  isocaedre ();
  st ()
