(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(**                                                     **)
(*********************************************************)

open LibRobot

let r = ref 0

let () =
  for i = 1 to 1000 do
    (* Tirer au sort un nombre R compris entre 0 et 7 *)
    r := abs (random ()) mod 8;
    (* Pivoter sur place de R quarts de tour à droite *)
    pivoter !r;
    (* Tirer au sort un nombre R compris entre 1 et 5 *)
    r := abs (random ()) mod 5 + 1;
    (* Avancer R fois dans la direction courante, sauf si le robot touche le bord *)
    while !r <> 0 && not (tb ()) do
      av ();
      r := !r - 1
    done
  done;
  st ()
