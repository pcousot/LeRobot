open LibRobot

(* Carrés arborescents *)

let rec arbre l =
  if l >= 1 then begin
    p3htg (); avf l; p3htd (); arbre (l / 2); phtd ();
    avf l; phtg ();
    p3htd (); avf l; p3htg (); arbre (l / 2); phtg ();
    avf l; phtd ()
  end

let rec carres l =
  if l >= 1 then begin
    for i = 1 to 4 do
      arbre l; pqtd ()
    done;
    carres (l / 2)
  end

let () =
  lg 1.2; carres 32; st ()
