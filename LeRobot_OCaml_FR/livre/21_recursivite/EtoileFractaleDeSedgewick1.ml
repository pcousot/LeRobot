open LibRobot

(* Étoile fractale de Sedgewick *)

(* Dessiner un carré centré en (x, y) de longueur de
   côté 2 * l *)
let carre x y l =
  deplacer (x - l, y - l);
  for i = 1 to 4 do
    avf (2 * l); pqtd ()
  done

let rec etoile x y l =
  if l > 0 then begin
    etoile (x - l) (y + l) (l / 2);
    etoile (x + l) (y + l) (l / 2);
    etoile (x - l) (y - l) (l / 2);
    etoile (x + l) (y - l) (l / 2);
    carre x y l
  end

let () =
  lg 3.; etoile 0 0 16;
  st ()
