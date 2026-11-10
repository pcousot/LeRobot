open LibRobot

(* Pavage du plan à l'aide de deux spirales
   formées de triangles isocèles *)

let n = 12
let lo = 30.
let c = 4   (* Nombre de demi-couronnes constituant une
               spirale *)
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

let spirale () =
  for i = 1 to c do
    for j = 1 to n do
      tip ();
      for k = 1 to i - 1 do
        tib (); tip ()
      done
    done
  done

let () =
  autoriserSorties (); cacherRobot (); spirale (); ce ();
  av (); pdt (); spirale (); st ()
