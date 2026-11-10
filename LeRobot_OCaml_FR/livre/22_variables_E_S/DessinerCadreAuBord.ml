open LibRobot

(* Dessiner un cadre autour de la fenêtre *)

(* Gagner rapidement le bord de la fenêtre *)
let auBord () =
  let i = ref 4096 in
  while !i >= 1 do
    lg (float_of_int !i);
    while not (tb ()) do
      av ()
    done;
    i := !i / 2
  done

let rejoindreCoinNE () =
  lc (); pn (); auBord (); pe (); auBord (); bc ()

let dessinerCadre () =
  for i = 1 to 4 do
    pqtd (); auBord ()
  done

let () =
  rejoindreCoinNE (); dessinerCadre (); ce (); st ()
