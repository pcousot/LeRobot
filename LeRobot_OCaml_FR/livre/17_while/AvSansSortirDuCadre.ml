open LibRobot

(* Avancer sans jamais sortir du cadre *)

(* Avancer si cela ne fait pas sortir le robot du cadre *)
let avSansSortir () =
  if not (tb ()) then
    av ()

let () =
  for i = 1 to 1025 do
    avSansSortir ()
  done;
  st ()
