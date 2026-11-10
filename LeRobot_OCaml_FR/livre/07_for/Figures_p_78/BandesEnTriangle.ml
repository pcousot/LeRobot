open LibRobot

(* Dessiner des bandes en triangle *)

let () =
  (* Dessiner 10 rectangles de tailles 1, 2,..., 10
     empilés horizontalement *)
  pdt ();
  for i = 1 to 10 do
    av (); pqtd ();
    for j = 1 to i do av () done;
    pqtd (); av (); pqtd ();
    for j = 1 to i do av () done;
    lc (); pqtg (); av (); pdt (); bc ()
  done;
  st ()
