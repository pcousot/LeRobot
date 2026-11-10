open LibRobot

(* Dessiner un grillage en superposant deux quadrillages
   dont l'un est tourné d'un huitième de tour *)

(* Rejoindre le bord, tout droit *)
let auBord () =
  while not (tb ()) do
    av ()
  done

let rejoindreCoinNordEst () =
  (* Rejoindre le bord nord *)
  lc (); pn (); auBord ();
  (* Rejoindre le coin nord-est *)
  pe (); auBord ()

(* Le robot étant au bord nord, descendre en traçant la
   verticale puis remonter. *)
let verticale () =
  (* Orienter le robot vers le sud *)
  ps ();
  (* Descendre en traçant la verticale *)
  bc (); auBord ();
  (* Remonter du sud au nord *)
  lc (); pn (); auBord ()

(* Partant d'un robot au bord nord, tracer les verticales
   d'est en ouest et terminer avec le robot au coin
   nord-ouest. *)
let tracerVerticales () =
  rejoindreCoinNordEst ();
  (* Tracer la première verticale à l'est *)
  verticale ();
  (* Tracer les verticales suivantes, d'est en ouest *)
  pw ();
  while not (tb ()) do
    (* Avancer à l'ouest *)
    av ();
    (* Tracer la verticale *)
    verticale ();
    pw ()
  done

let rejoindreCoinNordOuest () =
  (* Rejoindre le bord nord *)
  lc (); pn (); auBord ();
  (* Rejoindre le coin nord-ouest *)
  pw (); auBord ()

(* Le robot étant au bord ouest, traverser en traçant
   l'horizontale puis retraverser pour rejoindre le bord
   ouest. *)
let horizontale () =
  (* Orienter le robot vers l'est *)
  pe ();
  (* Traverser en traçant l'horizontale *)
  bc (); auBord (); lc ();
  (* Retraverser d'est en ouest *)
  pw (); auBord ()

(* Partant d'un robot au bord ouest, tracer les
   horizontales du nord au sud et terminer avec le robot
   au coin sud-ouest. *)
let tracerHorizontales () =
  rejoindreCoinNordOuest ();
  (* Tracer la première horizontale au nord *)
  horizontale ();
  (* Tracer les horizontales suivantes, du nord au sud *)
  ps ();
  while not (tb ()) do
    (* Avancer au sud *)
    av ();
    (* Tracer l'horizontale *)
    horizontale ();
    ps ()
  done

let rejoindreCoinSudOuest () =
  (* Rejoindre le bord sud *)
  lc (); ps (); auBord ();
  (* Rejoindre le coin sud-ouest *)
  pw (); auBord ()

(* Partant du bord ouest ou nord, tracer l'oblique du
   nord-ouest vers le sud-est et revenir au bord
   d'origine. *)
let obliqueNOSE () =
  (* Tracer l'oblique *)
  pse (); bc (); auBord ();
  (* Revenir *)
  pnw (); lc (); auBord ()

let tracerObliquesNOSE () =
  rejoindreCoinSudOuest ();
  (* Tracer les obliques NO-SE partant du bord ouest *)
  pn ();
  while not (tb ()) do
    av ();
    obliqueNOSE ();
    pn ()
  done;
  (* Tracer les obliques NO-SE partant du bord nord *)
  pe ();
  while not (tb ()) do
    av ();
    obliqueNOSE ();
    pe ()
  done

let rejoindreCoinSudEst () =
  (* Rejoindre le bord sud *)
  lc (); ps (); auBord ();
  (* Rejoindre le coin sud-est *)
  pe (); auBord ()

(* Partant du bord sud ou ouest, tracer l'oblique du
   sud-ouest vers le nord-est et revenir au bord
   d'origine. *)
let obliqueSONE () =
  (* Tracer l'oblique *)
  pne (); bc (); auBord ();
  (* Revenir *)
  psw (); lc (); auBord ()

let tracerObliquesSONE () =
  rejoindreCoinSudEst ();
  (* Tracer les obliques SO-NE partant du bord sud *)
  pw ();
  while not (tb ()) do
    av ();
    obliqueSONE ();
    pw ()
  done;
  (* Tracer les obliques SO-NE partant du bord ouest *)
  pn ();
  while not (tb ()) do
    av ();
    obliqueSONE ();
    pn ()
  done

let () =
  tracerVerticales ();
  tracerHorizontales ();
  tracerObliquesNOSE ();
  tracerObliquesSONE ();
  st ()
