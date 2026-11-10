open LibRobot

(* Pavage du disque avec des triangles isocèles *)

(* Les triangles isocèles sont disposés en couronnes
   circulaires *)
let n = 12
let lo = 30.
let c = 4   (* Nombre de couronnes *)
let angleBase = (180. -. 180. /. float_of_int n) /. 2.

(* Dessiner un triangle isocèle en commençant par la
   pointe *)
let tip () =
  tl lo;
  rt (180. -. angleBase);
  tl (2. *. lo *. cos (angleBase /. 180. *. pi));
  rt (180. -. angleBase);
  tl lo; pdt ()

(* Dessiner un triangle isocèle en commençant par la
   base *)
let tib () =
  tl lo;
  rt (180. -. 180. /. float_of_int n); tl lo;
  rt (180. -. angleBase);
  tl (2. *. lo *. cos (angleBase /. 180. *. pi));
  lc (); avf (-1); bc ();
  rt angleBase

let pavage () =
  for i = 1 to c do
    for j = 1 to 2 * n do
      tip ();
      for k = 1 to i - 1 do
        tib (); tip ()
      done
    done;
    av ()
  done

let () =
  pavage (); st ()
