open LibRobot

(* Un morceau du pavage du plan par le « chapeau » de David Smith (2022),
   la tuile unique apériodique (voir Chapeau.ml) : 181 chapeaux, dont 23
   retournés (en bleu), recouvrent toute la fenêtre sans trou ni
   chevauchement. Le pavage peut être continué indéfiniment, mais jamais
   de façon périodique.

   Chaque chapeau est donné par sa position dans la grille hexagonale de
   cerfs-volants : (o, i, j) où o est son orientation (rotation de o * 60
   degrés pour o < 6 ; retourné, puis tourné de (o - 6) * 60 degrés pour
   o >= 6) et (i, j) l'hexagone de la grille où est amené son coin (0, 0).
   Ces positions ont été trouvées par un programme qui pose les chapeaux
   l'un après l'autre, en revenant en arrière quand aucun ne convient. *)

let unite = 16.          (* longueur 1 (le petit côté d'un cerf-volant), en points *)
let r3 = sqrt 3.

(* coins du chapeau, dans les coordonnées de la grille de cerfs-volants *)
let contour = [ (0., 0.); (-1.5, -. r3 /. 2.); (-1., -. r3); (1., -. r3);
                (1.5, -. r3 /. 2.); (3., -. r3); (4.5, -. r3 /. 2.); (4., 0.);
                (3., 0.); (3., r3); (1.5, 3. *. r3 /. 2.); (1., r3); (0., r3) ]

(* centres des 8 cerfs-volants du chapeau (points intérieurs au chapeau) *)
let cerfsVolants = [ (1.25, 0.0); (0.625, 1.083); (-0.625, -1.083);
                     (0.625, -1.083); (3.625, -0.65); (2.375, -0.65);
                     (1.75, 1.732); (2.375, 0.65) ]

let tuiles = [
  (0, 0, 0); (1, (-1), 0); (4, 0, (-1)); (10, 1, (-1)); (0, 0, 1);
  (2, (-1), 1); (6, (-1), 2); (2, 2, (-1)); (2, (-2), 1); (0, 1, (-2));
  (1, 1, 1); (0, (-2), 0); (1, 2, (-2)); (5, 0, (-2)); (2, 0, 2);
  (1, 2, 0); (6, (-3), 1); (2, (-1), (-2)); (3, (-2), (-1));
  (4, (-2), 3); (3, (-3), 2); (5, 3, (-1)); (2, 1, 2); (3, (-1), 3);
  (0, 1, (-3)); (2, (-3), 0); (11, 3, 0); (4, 3, (-3)); (3, (-3), 3);
  (0, 4, (-2)); (3, (-2), (-2)); (4, (-4), 2); (2, 2, 2);
  (1, (-1), (-3)); (3, 4, (-3)); (3, 3, 1); (3, 1, (-4)); (0, (-1), 4);
  (1, 4, (-1)); (1, (-3), 4); (4, 0, (-4)); (2, 4, 0); (2, (-4), 0);
  (7, (-4), 4); (6, 4, (-4)); (7, (-2), (-3)); (2, 2, (-5));
  (2, 3, (-5)); (5, (-2), 5); (2, (-3), 5); (6, 2, 3); (4, (-3), (-2));
  (0, 3, 2); (4, (-5), 3); (1, 5, (-2)); (3, (-1), (-4)); (4, 1, 4);
  (2, 4, (-5)); (6, 1, (-5)); (0, (-1), 5); (3, (-4), 5);
  (1, (-4), (-1)); (2, 5, (-4)); (5, (-5), 4); (1, 0, 5); (0, 5, (-5));
  (4, (-5), 5); (5, 5, 0); (10, (-5), 0); (1, 3, (-6)); (2, 3, 3);
  (8, (-6), 3); (5, (-3), (-3)); (1, 6, (-3)); (3, 2, 4); (0, (-6), 2);
  (1, 4, 2); (2, 6, (-4)); (2, (-6), 4); (3, (-4), 6); (4, (-2), 6);
  (0, 2, (-6)); (2, 1, (-6)); (10, (-1), 6); (3, 5, (-6)); (4, 5, 1);
  (0, (-6), 1); (0, (-5), (-1)); (3, (-1), (-5)); (1, 6, (-5));
  (2, 0, (-6)); (1, (-6), 6); (4, (-6), 0); (7, 6, 0); (2, 0, 6);
  (0, (-4), 7); (1, (-3), 7); (5, (-7), 3); (1, 4, (-7)); (4, (-7), 4);
  (5, 7, (-4)); (2, 4, 3); (11, 7, (-3)); (5, (-4), (-3));
  (0, (-5), (-2)); (3, (-7), 5); (3, 2, 5); (3, 7, (-2)); (0, (-2), 7);
  (0, 2, (-7)); (2, (-5), 7); (11, 5, (-7)); (1, (-7), 1); (2, 6, (-7));
  (0, (-7), 6); (3, 7, (-1)); (3, 6, 1); (1, 1, (-7)); (2, (-6), 7);
  (5, (-6), (-1)); (4, 7, (-6)); (3, (-1), (-6)); (2, 4, (-8));
  (1, 8, (-4)); (9, (-4), (-4)); (2, (-4), 8); (4, 3, 5);
  (1, (-3), (-5)); (5, 7, (-7)); (5, 5, (-8)); (6, (-5), 8);
  (0, 8, (-5)); (2, 8, (-3)); (1, 7, 0); (2, (-8), 3); (3, (-5), (-3));
  (2, (-7), 7); (4, (-8), 5); (2, 5, 3); (3, 8, (-6)); (1, 6, (-8));
  (1, (-8), 2); (3, 6, 2); (2, (-8), 6); (4, 8, (-1)); (0, (-8), 1);
  (6, (-8), 7); (2, (-7), (-1)); (2, 7, 1); (5, 8, (-7)); (1, 4, (-9));
  (3, (-5), 9); (6, 5, 4); (4, (-6), 9); (0, 6, (-9)); (11, (-9), 3);
  (4, (-6), (-3)); (2, 9, (-3)); (0, 6, 3); (3, (-8), 0); (3, (-8), 8);
  (1, 7, (-9)); (1, (-7), (-2)); (5, (-9), 2); (9, 9, (-7));
  (0, (-8), 9); (3, 9, (-1)); (3, (-8), (-1)); (2, 8, 1);
  (3, (-7), (-3)); (1, (-7), 10); (1, 7, 3); (3, 9, (-9)); (3, 9, 0);
  (0, (-8), 10); (1, 8, (-10)); (7, (-8), (-2)); (1, 8, 2);
  (5, (-9), 10); (2, 8, (-11)); (6, (-9), 11) ]

(* Position (en unités) d'un point du chapeau placé en (o, i, j) *)
let placer (x, y) (o, i, j) =
  let y = if o >= 6 then -. y else y in          (* retourné *)
  let a = float_of_int (o mod 6) *. pi /. 3. in
  let x' = x *. cos a -. y *. sin a and y' = x *. sin a +. y *. cos a in
  (* centre de l'hexagone (i, j) de la grille de cerfs-volants *)
  (x' +. 3. *. float_of_int i, y' +. r3 *. float_of_int (i + 2 * j))

let tracerChapeau t =
  lc (); deplacerReel (placer (List.hd contour) t); bc ();
  List.iter (fun p -> tracerReel (placer p t)) (List.tl contour @ [List.hd contour])

(* les chapeaux retournés en bleu, les autres selon leur orientation *)
let couleurDe o =
  if o >= 6 then bleu else [| jaune; vert; rouge |].(o mod 3)

(* peindre le chapeau depuis le centre d'un de ses cerfs-volants ; un
   chapeau coupé par le bord de la fenêtre est peint depuis chacun de ses
   cerfs-volants qui sont dans la fenêtre *)
let peindreChapeau ((o, _, _) as t) =
  let points = List.map (fun k -> placer k t) cerfsVolants in
  let visibles = List.filter (fun (x, y) ->
      abs_float (x *. unite) < 397. && abs_float (y *. unite) < 335.) points in
  let visibles =
    if List.length visibles = List.length points then [List.hd visibles]
    else visibles in
  cc (couleurDe o);
  List.iter (fun p -> lc (); deplacerReel p; pn (); peindre ()) visibles

let () =
  cacherRobot (); autoriserSorties ();
  lg unite; ec 1; cc noir;
  List.iter tracerChapeau tuiles;
  List.iter peindreChapeau tuiles;
  cc noir;
  message "Un pavage par le chapeau de David Smith : 181 chapeaux, 23 retournés (en bleu)";
  st ()
