open LibRobot

(* Dessiner le nombre 888 comme sur les
   montres digitales. *)

(* Dessiner le chiffre 8, en partant en bas à gauche du
   8 avec le robot orienté au nord et en arrivant en bas
   à gauche du 8 avec le robot orienté à l'ouest. *)
let huit () =
  av (); pqtd (); av (); pqtg (); av (); pqtg (); av ();
  pqtg (); av (); pqtg (); av (); pqtd (); av (); pqtd ();
  av () ;;

(* Partant avec le robot orienté à l'ouest en bas à
   gauche du 8, reculer en bas à droite du 8 puis d'un
   espace et réorienter le robot au nord. *)
let espace () =
  lc (); pqtd (); pqtd (); av (); av (); pqtg (); bc () ;;

let () =
  huit (); espace ();  (* le 8 des centaines *)
  huit (); espace ();  (* le 8 des dizaines *)
  huit ();             (* le 8 des unités *)
  st () ;;
