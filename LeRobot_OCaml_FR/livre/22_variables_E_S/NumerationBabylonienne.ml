open LibRobot

(* Écrire un nombre en numération babylonienne *)

let x = 6.   (* Taille de la grille *)

(* Tête de clou *)
let teteDeClou () =
  lc (); pqtd (); av (); pqtg (); bc ();
  lgY (valLgY () *. 2.); vg (); avf (-2); vg ();
  lc (); pqtg (); av (); pqtg (); bc ();
  lg x

(* Clou dont la pointe est de hauteur n *)
let un n =
  lc (); pqtd (); av (); pqtg (); bc ();
  avf n; lc (); pqtg (); av (); pqtd (); teteDeClou ();
  lc (); avf (-n); bc ()

(* Chevron *)
let dix () =
  lc (); av (); pqtd (); bc ();
  lgX (x *. 2.); vd (); p3htd (); lgX x;
  lgY (x *. 2.); vd (); p3htd (); lgY x;
  lgX (x *. 2.); vd ();
  lc (); p3htg (); av (); p3htg (); bc (); lg x

(* Laisser n blancs horizontalement partant d'une et
   revenant à une orientation nord du robot *)
let espacement n =
  lc (); pqtd (); avf n; pqtg (); bc ()

let dizainesDesUnitesSexagesimales chiffreDesDizaines =
  match chiffreDesDizaines with
  | 1 -> dix ()
  | 2 -> dix (); dix ()
  | 3 -> dix (); dix (); dix ()
  | 4 ->
    lc (); pqtd (); avf 2; pqtg (); bc ();
    dix ();
    lc (); avf 2; pqtg (); avf 4; pqtd (); bc ();
    dix (); dix (); dix ();
    lc (); avf (-2); bc ()
  | 5 ->
    lc (); pqtd (); av (); pqtg (); bc ();
    dix (); dix ();
    lc (); avf 2; pqtg (); avf 5; pqtd (); bc ();
    dix (); dix (); dix ();
    lc (); avf (-2); bc ()
  | _ -> ()

let unitesDesUnitesSexagesimales chiffreDesUnites =
  match chiffreDesUnites with
  | 1 -> un 4
  | 2 -> un 4; un 4
  | 3 -> un 4; un 4; un 4
  | 4 ->
    lc (); pqtd (); av (); pqtg (); bc ();
    lg (x *. 2.); teteDeClou (); lg x;
    lc (); avf 4; pqtg (); avf 5; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf (-4); bc ()
  | 5 ->
    lc (); pqtd (); av (); pqtg (); bc ();
    un 2; un 2;
    lc (); avf 4; pqtg (); avf 5; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf (-4); bc ()
  | 6 ->
    un 2; un 2; un 2;
    lc (); avf 4; pqtg (); avf 6; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf (-4); bc ()
  | 7 ->
    lc (); pqtd (); av (); pqtg (); bc ();
    lgX (x *. 2.); teteDeClou ();
    lc (); avf 2; pqtg (); avf 5; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf 2; pqtg (); avf 6; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf (-4); bc ()
  | 8 ->
    lc (); pqtd (); av (); pqtg (); bc ();
    teteDeClou (); teteDeClou ();
    lc (); avf 2; pqtg (); avf 5; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf 2; pqtg (); avf 6; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf (-4); bc ()
  | 9 ->
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf 2; pqtg (); avf 6; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf 2; pqtg (); avf 6; pqtd (); bc ();
    teteDeClou (); teteDeClou (); teteDeClou ();
    lc (); avf (-4); bc ()
  | _ -> ()

(* En position médiale et uniquement pour marquer
   l'absence d'unités dans cette position *)
let zeroBabylonien () =
  lc (); pqtd (); avf 6; bc ();
  p3htg (); avf 3; lg (x *. 2.); vd (); avf (-1); vd ();
  lc (); pdt (); lg x; av (); bc (); lg (x *. 2.); vd ();
  avf (-1);
  vd (); lc (); lg (x *. 4.); av (); p3htg (); bc (); lg x

let unitesEnBabylonien unitesSexagesimales =
  if unitesSexagesimales = 0 then zeroBabylonien ()
  else begin
    dizainesDesUnitesSexagesimales
      (unitesSexagesimales / 10);
    espacement 1;
    unitesDesUnitesSexagesimales
      (unitesSexagesimales mod 10)
  end;
  espacement 4

let rec nombreEnBabylonien c =
  if c < 60 then unitesEnBabylonien c
  else begin
    nombreEnBabylonien (c / 60);
    unitesEnBabylonien (c mod 60)
  end

let () =
  write ["Nombre à coder n = "];
  let n = lireEntier () in
  lg x; ag ();
  nombreEnBabylonien n;
  st ()
