open LibRobot

(* Définir la commande pn du robot avec des tests et
   l'essayer dans les huit directions *)

(* Faire pivoter le robot sur place vers le nord *)
let pn () =
  if tne () then phtg ()
  else if te () then pqtg ()
  else if tse () then p3htg ()
  else if ts () then pdt ()
  else if tsw () then p3htd ()
  else if tw () then pqtd ()
  else if tnw () then phtd ()

let () =
  for i = 1 to 8 do
    ce (); pn ();
    for j = 1 to i do phtd () done;
    av ()
  done;
  st ()
