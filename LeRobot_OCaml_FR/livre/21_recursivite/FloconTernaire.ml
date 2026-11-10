open LibRobot

(* Flocon ternaire *)

let rec arbre l =
  if l > 1 then begin
    tl (float_of_int (l / 3)); rt 45.;
    arbre (l / 3);
    rt (-45.);
    arbre (l / 3);
    rt (-45.);
    arbre (l / 3);
    rt 45.; tl (-. float_of_int (l / 3))
  end

let flocon l =
  arbre l; rt 45.;
  arbre l; rt 45.;
  arbre l; rt 45.;
  arbre l; rt 45.;
  arbre l; rt 45.;
  arbre l; rt 45.;
  arbre l; rt 45.;
  arbre l; rt 45.

let () =
  flocon 162; flocon 54; st ()
