open LibRobot

(* Pavage à la Escher du triangle *)

let r = 5.  (* Taille d'une branche de l'étoile *)

let hexagone () =
  for i = 1 to 6 do
    av (); rt 60.
  done

let etoile () =
  for i = 1 to 6 do
    av (); rt 60.; av (); rt 240.
  done

let triangleOndule () =
  ec 2; phtd (); vd (); vg (); lgRT (valLgX (), 60.);
  p3htg (); vd (); vg (); pqtg ();
  vd (); vg ();
  ec 1

let motif () =
  (* Triangle *)
  lg (r *. 5.); triangleOndule ();
  (* Hexagone *)
  lc (); pqtg (); lg (r *. 5.); av (); phtg (); lg r;
  av ();
  bc (); lgRT (r *. 2., 54.);
  bc (); hexagone (); lc (); pdt (); lg r; av ();
  p3htg ();
  lg (r *. 5.);
  av (); pqtg (); bc ();
  (* Étoile *)
  lc (); lgRT (r *. 5., 60.); avf 2; lg r; pdt (); av ();
  lgRT (r, 60.); phtg (); bc ();
  etoile (); lc (); phtd (); lg r; pdt (); av ();
  lgRT (r *. 5., 60.); avf (-2);
  bc ()

let motifSansEtoile () =
  (* Triangle *)
  lg (r *. 5.); triangleOndule ();
  (* Hexagone *)
  lc (); pqtg (); lg (r *. 5.); av (); phtg (); lg r;
  av ();
  bc (); lgRT (r *. 2., 54.);
  bc (); hexagone (); lc (); pdt (); lg r; av ();
  p3htg ();
  lg (r *. 5.);
  av (); pqtg (); bc ()

let () =
  for j = 1 to 3 do
    for i = 1 to j - 1 do
      motif ()
    done;
    motifSansEtoile ();
    lc (); lg (r *. 5.); pqtg (); avf (j * 2 + 1);
    pqtg ();
    lgRT (r *. 5., 60.);
    avf 2; pdt (); bc ()
  done;
  st ()
