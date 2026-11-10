open LibRobot

(* Dessiner une frise en forme de double peigne *)

let nombreDeDents = 30

let () =
  ag (); pe ();
  for i = 1 to nombreDeDents do
    (* Trait horizontal *)
    av ();
    if i mod 2 = 1 then begin
      (* Dent vers le bas *)
      pqtd (); av (); pdt (); av (); pqtd ()
    end else begin
      (* Dent vers le haut *)
      pqtg (); av (); pdt (); av (); pqtg ()
    end
  done;
  st ()
