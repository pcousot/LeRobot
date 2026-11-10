open LibRobot

(* Étoile fractale de Sedgewick *)

let aucun = 0
let nW = 1
let nE = 2
let sE = 3
let sW = 4

(* Dessiner un carré centré en (x, y) de longueur de
   côté 2 * l et auquel il manque le coin cM *)
let carre x y l cM =
  deplacer (x - l, y);
  for i = nW to sW do
    if i = cM then lc ();
    avf l; pqtd (); avf l;
    bc ()
  done

let rec etoile x y l cM =
  if l > 0 then begin
    if cM <> nW then etoile (x - l) (y + l) (l / 2) sE;
    if cM <> nE then etoile (x + l) (y + l) (l / 2) sW;
    if cM <> sW then etoile (x - l) (y - l) (l / 2) nE;
    if cM <> sE then etoile (x + l) (y - l) (l / 2) nW;
    carre x y l cM
  end

let () =
  lg 3.; etoile 0 0 16 aucun; st ()
