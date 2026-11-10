open LibRobot

(* Dessiner le tableau d'un tournoi de tennis *)

let l = 5   (* Longueur d'un trait horizontal *)

(* Dessiner un tableau pour un tournoi de n joueurs *)
let rec tableau n =
  (* Pointe de l'accolade, pour le vainqueur *)
  avf l;
  if n > 1 then begin
    (* Branche supérieure de l'accolade *)
    pqtg (); avf n; pqtd ();
    (* Sous-tableau supérieur, contenant la
       moitié des joueurs *)
    tableau (n / 2);
    (* Revenir au centre de l'accolade *)
    lc (); pqtg (); avf (-n); pqtd (); bc ();
    (* Branche inférieure de l'accolade *)
    pqtd (); avf n; pqtg ();
    (* Sous-tableau inférieur, contenant le
       reste des joueurs *)
    tableau (n - n / 2);
    (* Revenir au centre de l'accolade *)
    lc (); pqtd (); avf (-n); pqtg (); bc ()
  end;
  (* Revenir à l'extrémité de la pointe *)
  avf (-l)

let () =
  lg 3.; pe (); tableau 16; st ()
