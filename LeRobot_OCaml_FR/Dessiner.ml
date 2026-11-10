open Interaction
(* (coordonnees, pivotements, dessin, finsouris, sauver)
   finsouris = false : un clic souris ne termine plus le dessin (il le
   terminait dans la version de 1998) ; seule la touche Entree termine. *)
let () =
begin
interaction (false,true,true,false,true)
end
