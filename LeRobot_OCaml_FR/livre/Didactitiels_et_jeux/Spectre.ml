open LibRobot

(* Le « Spectre », découvert par David Smith, Joseph Samuel Myers, Craig S.
   Kaplan et Chaim Goodman-Strauss (« A chiral aperiodic monotile », 2023),
   quelques mois après le chapeau (voir Chapeau.ml) : une seule tuile qui
   recouvre tout le plan, jamais de façon périodique, SANS jamais être
   retournée. À gauche, le polygone Tile(1,1) : les 14 côtés du chapeau,
   tous de longueur 1 (les côtés gardent leurs directions, multiples de 30
   degrés). Des polygones Tile(1,1) peuvent encore être retournés dans
   certains pavages ; remplacer chaque côté par la même courbe en S (à
   droite) l'interdit : un S s'emboîte dans un S, mais pas un S retourné.
   C'est le Spectre. *)

let unite = 48.                 (* longueur d'un côté, en points *)

(* le contour, côté après côté : rotation (degrés, sens direct) avant le
   côté ; tous les côtés ont pour longueur 1 *)
let rotations = [ -60.; 90.; 60.; 0.; 60.; -90.; 60.; 90.; 60.; -90.;
                  60.; 90.; -60.; 90. ]

(* un point bien à l'intérieur de la tuile, vu du coin de départ (le robot
   tourné vers le nord, x vers la droite, y vers le haut) *)
let interieurX = 1.1
let interieurY = -0.1

(* coins de la tuile, en unités, depuis le coin de départ *)
let coins = [| (0., 0.); (-0.866, -0.5); (-0.366, -1.366); (0.634, -1.366);
               (1.634, -1.366); (2.134, -0.5); (3., -1.); (3.866, -0.5);
               (3.366, 0.366); (2.366, 0.366); (2.366, 1.366); (1.5, 1.866);
               (1., 1.); (0., 1.) |]
let courbure = 0.15             (* écart des côtés en S à la ligne droite *)
let pas = 12                    (* segments droits pour dessiner un S *)

(* Dessiner le polygone Tile(1,1) de côtés de longueur u, en partant et en
   revenant au même coin, tourné vers le nord *)
let polygone u =
  rt 180.;                      (* direction qui précède le premier côté *)
  List.iter (fun rotation -> rt rotation; tl u) rotations;
  rt (-180.)                    (* de nouveau tourné vers le nord *)

(* Peindre l'intérieur de la tuile dessinée depuis le coin du robot *)
let peindreTuile u =
  let angle = atan2 interieurY interieurX *. 180. /. pi -. 90. in
  let distance = sqrt (interieurX ** 2. +. interieurY ** 2.) *. u in
  lc ();
  rt angle; tl distance;
  peindre ();
  pdt (); tl distance; pdt (); rt (-. angle);
  bc ()

(* Tracer de (ax, ay) à (bx, by) une courbe en S : elle s'écarte vers la
   gauche dans sa première moitié et vers la droite dans la seconde, si bien
   que c'est la même courbe dans un sens ou dans l'autre *)
let coteCourbe (ax, ay) (bx, by) =
  for k = 1 to pas do
    let t = float_of_int k /. float_of_int pas in
    let s = courbure *. sin (2. *. pi *. t) in
    tracerReel (ax +. t *. (bx -. ax) -. s *. (by -. ay),
                ay +. t *. (by -. ay) +. s *. (bx -. ax))
  done

(* Dessiner le Spectre, son coin de départ en (x, y) (en unités) *)
let spectre x y =
  let n = Array.length coins in
  lc (); deplacerReel (x, y); bc ();
  for k = 0 to n - 1 do
    let (ax, ay) = coins.(k) and (bx, by) = coins.((k + 1) mod n) in
    coteCourbe (x +. ax, y +. ay) (x +. bx, y +. by)
  done

let () =
  cacherRobot ();
  lg unite; ec 3;
  cc rouge; spectre 3. 0.75;
  lc (); deplacerReel (3. +. interieurX, 0.75 +. interieurY); pn (); peindre ();
  lc (); deplacerReel (-6., 0.75); pn (); bc ();
  cc bleu; polygone unite; peindreTuile unite;
  message "Tile(1,1) (en bleu) et le Spectre (en rouge), qu'il n'est jamais nécessaire de retourner";
  st ()
