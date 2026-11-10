open LibRobot

(* Pentagones étoilés imbriqués *)

let alpha = 36.  (* 0 < alpha < ((5 - 2) * 180) / 5 *)

(* Étoile à 5 branches, n >= 5 *)
let etoile n =
  for i = 1 to n do
    av (); pdt ();
    rt (2. *. 4. *. 180. /. 5. -. alpha);
    av (); pdt (); rt alpha
  done

let rec pentagoneEtoile l =
  if l > 2. then begin
    (* Initialisation *)
    lc (); pe (); lgRT (l, alpha); avf 1;
    lgRT (2. *. valLgX (), alpha); avf 2;
    bc ();
    (* Pentagone étoilé *)
    lgRT (l, alpha);
    rt (180. -. alpha); etoile 5;
    for i = 0 to 3 do
      rt (float_of_int (i / 2) *. alpha);
      lgRT (valLgX () *. 2., 36.);
      rt ((-2. -. float_of_int (i / 2)) *. alpha);
      etoile 8;
      pe (); lgRT (l, alpha);
      rt (180. -. alpha +. float_of_int i *. 72.);
      etoile 9
    done;
    rt (-. alpha);
    lgRT (valLgX () *. 2., 36.);
    rt (-. alpha);
    etoile 7;
    (* Prochain pentagone étoilé *)
    pe (); lgRT (l, alpha);
    lgRT (valLgX () *. 2., 36.); avf (-1);
    pentagoneEtoile
      (l *. (2. /. (1. +. 4. *. cos (36. /. 180. *. pi))))
  end

let l = 31

let () =
  eb (); pentagoneEtoile (float_of_int l);
  st ()
