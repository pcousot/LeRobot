open LibRobot

(* Dessiner un rapporteur gradué en degrés *)

let longueur = 16

let () =
  eb (); pe (); lc ();
  for i = 0 to 180 do
    if i = 0 || i = 90 || i = 180 then begin
      bc (); avf (longueur - 7); lc (); avf 2;
      ecrire (entierEnChaine i); av (); bc (); avf 4;
      lc ()
    end else if i mod 10 = 5 then begin
      avf (longueur - 2); bc (); avf 2; lc ()
    end else if i mod 10 = 0 then begin
      avf (longueur - 5); ecrire (entierEnChaine i);
      avf 2; bc (); avf 3; lc ()
    end else begin
      avf (longueur - 1); bc (); av (); lc ()
    end;
    pdt (); avf longueur; pdt (); rt 1.
  done;
  st ()
