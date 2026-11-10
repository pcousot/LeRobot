open LibRobot

(* Dessiner une frise de triangles d'un bord à l'autre *)

(* Rejoindre le bord en avançant tout droit *)
let auBord () =
  lc ();
  while not (tb ()) do
    av ()
  done;
  bc ()

let motif () =
  if not (tb ()) then begin
    av (); p3htg (); av (); p3htg (); av ();
    if not (tb ()) then begin
      av (); p3htd (); av (); p3htd (); av ()
    end
  end

let frise () =
  pne ();
  while not (tb ()) do
    motif ()
  done

let () =
  pw (); auBord (); frise (); st ()
