open LibRobot

(* Dessiner la grille de tous les points d'arrêt
   possibles du robot *)

(* Avancer tout droit jusqu'au bord du cadre de
   déplacement du robot *)
let auBord () =
  while not (tb ()) do
    av ()
  done

(* Le robot étant au bord nord orienté vers le sud,
   marquer les points d'arrêt sur la verticale, puis
   l'avancer vers l'est et le réorienter au nord, si
   possible. *)
let verticaleNordSud () =
  dp ();
  while not (tb ()) do
    av (); dp ()
  done;
  pqtd ();
  if not (tb ()) then begin
    av (); pqtd ()
  end

(* Le robot étant au bord sud orienté vers le nord,
   marquer les points d'arrêt sur la verticale, puis
   l'avancer vers l'est et le réorienter au sud, si
   possible. *)
let verticaleSudNord () =
  dp ();
  while not (tb ()) do
    av (); dp ()
  done;
  pqtg ();
  if not (tb ()) then begin
    av (); pqtg ()
  end

let dg () =
  (* Rejoindre le bord nord *)
  lc (); auBord ();
  (* Rejoindre le coin nord-est *)
  pqtd (); auBord ();
  (* Orienter le robot au sud *)
  pqtd ();
  (* Marquer les verticales, d'est en ouest *)
  while not (tb ()) do
    verticaleNordSud ();
    verticaleSudNord ()
  done;
  (* Remettre le robot au centre orienté vers le nord *)
  ce (); pn ()

let () =
  dg (); st ()
