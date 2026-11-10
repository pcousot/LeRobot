open LibRobot

(* Pavage de Golomb : 1 carré de côté 1, 2 carrés de
   côté 2, ..., 10 carrés de côté 10, bord gradué *)

(* Dessiner un carré de côté n et avancer de n *)
let carre n =
  for i = 1 to 4 do avf n; pqtg () done;
  avf n

(* Dessiner un quart de couronne de carrés de côté n
   pair *)
let quartDeCouronnePaire n =
  for i = 1 to n / 2 do carre n done;
  avf (n / 2); pqtg (); avf (n / 2);
  for i = 1 to n / 2 do carre n done;
  pqtg (); avf (n / 2 * (n + 1));
  pqtg (); avf (n / 2 * (n + 1))

(* Dessiner un quart de couronne de carrés de côté n
   impair *)
let quartDeCouronneImpaire n =
  for i = 1 to n / 2 do carre n done;
  avf n; pqtg (); avf n;
  for i = 1 to n / 2 do carre n done;
  pqtg (); avf ((n + 1) / 2 * n);
  pqtg (); avf ((n + 1) / 2 * n)

(* Dessiner les n quarts de couronnes du pavage *)
let pavage n =
  pe ();
  for i = 1 to n do
    if i mod 2 = 1 then quartDeCouronneImpaire i
    else quartDeCouronnePaire i;
    if i <> n then begin
      avf (i + 1); pqtg ()
    end
  done

(* Graduer les quatre côtés du grand carré *)
let marquerLeBord n =
  let l = valLgX () in
  let m =
    if n mod 2 = 1 then (n + 1) / 2 * n
    else (n + 1) * (n / 2) in
  for i = 1 to 4 do
    for j = 1 to m do
      lg 2.; pqtd (); av (); pdt (); av (); pqtd ();
      lg l; av ()
    done;
    lg 2.; pqtd (); av (); pdt (); av (); pqtd ();
    lg l; pqtg ()
  done

let () =
  eh (); ag (); lc (); pdt (); av (); pdt (); bc ();
  lg 3.; pavage 10; pqtg (); marquerLeBord 10; st ()
