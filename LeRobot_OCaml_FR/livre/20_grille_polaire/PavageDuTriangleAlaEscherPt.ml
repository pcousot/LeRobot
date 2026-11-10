open LibRobot

(* Pavage à la Escher du triangle, en couleurs *)

let r = 5.  (* Taille d'une branche de l'étoile *)

(* Le robot ne revient pas dans l'hexagone ni dans
   l'étoile avant peindre (le pas de la grille polaire
   n'est pas celui du Macintosh) : on retient les sommets
   tracés et on peint depuis leur centre. *)
let sommets = ref []
let retenir () =
  sommets := (valX (), valY ()) :: !sommets

let peindreCentre () =
  let n = float_of_int (List.length !sommets) in
  let somme f =
    List.fold_left (fun s p -> s +. f p) 0. !sommets in
  let a = round (somme fst /. n)
  and b = round (somme snd /. n) in
  sommets := [];
  Principal.wait ();
  enreg (fun () ->
      Principal.draw false;
      let fond = Graphics.point_color a b in
      if fond <> Dessin.current_color () then
        Peinture.remplir fond a b;
      Principal.draw true)

let hexagone () =
  for i = 1 to 6 do
    av (); retenir (); rt 60.
  done

let etoile () =
  for i = 1 to 6 do
    av (); retenir (); rt 60.; av (); retenir (); rt 240.
  done

let triangleOndule () =
  phtd (); vd (); vg (); lgRT (valLgX (), 60.); p3htg ();
  vd (); vg (); pqtg (); vd ();
  vg ()

let motif () =
  (* Triangle *)
  lg (r *. 5.); triangleOndule ();
  (* Hexagone *)
  lc (); pqtg (); lg (r *. 5.); av (); phtg (); lg r;
  av ();
  bc (); lgRT (r *. 2., 54.);
  bc (); hexagone (); lc (); pdt (); lg r; av ();
  peindreCentre (); p3htg ();
  lg (r *. 5.);
  av (); pqtg (); bc ();
  (* Étoile *)
  lc (); lgRT (r *. 5., 60.); avf 2; lg r; pdt (); av ();
  lgRT (r, 60.); phtg (); bc ();
  etoile (); lc (); phtd (); lg r; pdt ();
  peindreCentre (); av ();
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
  peindreCentre (); p3htg ();
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
