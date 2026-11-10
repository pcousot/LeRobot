(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Fleur stylisée, page 9.                             **)
(**                                                     **)
(*********************************************************)

open LibRobot

let petale () =
  begin
    phtd (); av (); av (); p3htd (); av (); av (); pqtd (); av (); av ()
  end

let feuille () =
  begin
    av (); av (); p3htg (); av (); av (); pqtg (); av (); av ()
  end

let () =
  (* Monter *)
  lc (); av (); av (); bc ();
  (* Dessiner les pétales *)
  for p = 1 to 4 do petale () done;
  pdt ();
  (* Dessiner la tige *)
  for j = 1 to 11 do av () done;
  (* Dessiner la feuille *)
  pdt (); av (); av (); av (); av (); phtd (); av (); av (); feuille ();
  st ()
