open LibRobot

(* Dessiner des serpentines *)

(* Construire une serpentine de hauteur n en partant de
   son coin inférieur ouest *)
let rec serpentineE n =
  if n > 0 then begin
    (* Construire la base de largeur n, d'ouest en est *)
    pe (); avf n; pn (); av ();
    (* Construire la serpentine supérieure de hauteur
       n - 1 en partant de son coin inférieur est *)
    serpentineW (n - 1)
  end

(* Construire une serpentine de hauteur n en partant de
   son coin inférieur est *)
and serpentineW n =
  if n > 0 then begin
    (* Construire la base de largeur n, d'est en ouest *)
    pw (); avf n; pn (); av ();
    (* Construire la serpentine supérieure de hauteur
       n - 1 en partant de son coin inférieur ouest *)
    serpentineE (n - 1)
  end

let () =
  lg 6.; eb (); ad (); serpentineW 18; eb (); ag ();
  serpentineE 18; st ()
