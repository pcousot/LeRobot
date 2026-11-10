open LibRobot

(* Définition de la commande avf du robot *)

(* Avancer n fois si n est positif, reculer -n fois si
   n est négatif, ne pas bouger si n est nul. *)
let avf n =
  if n > 0 then begin
    for i = 1 to n do
      av ()
    done
  end else if n < 0 then begin
    pdt ();
    for i = 1 to - n do
      av ()
    done;
    pdt ()
  end

let () =
  avf 5; avf (-5); st ()
