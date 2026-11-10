open LibRobot

(* Coder 123 456 789 dans diverses numérations *)

let numerationBabylonienne nombreACoder =
  let x = 6 in (* Taille de la grille *)
  (* Tête de clou *)
  let teteDeClou () =
    lc (); pqtd (); av (); pqtg (); bc ();
    lgY (valLgY () *. 2.); vg (); avf (-2); vg ();
    lc (); pqtg (); av (); pqtg (); bc ();
    lg (float_of_int x)
  in

  (* Clou dont la pointe est de hauteur n *)
  let un n =
    lc (); pqtd (); av (); pqtg (); bc ();
    avf n; lc (); pqtg (); av (); pqtd ();
    teteDeClou (); lc (); avf (- n); bc ()
  in

  (* Chevron *)
  let dix () =
    lc (); av (); pqtd (); bc ();
    lgX (float_of_int (x * 2)); vd (); p3htd ();
    lgX (float_of_int x);
    lgY (float_of_int (x * 2)); vd (); p3htd ();
    lgY (float_of_int x);
    lgX (float_of_int (x * 2)); vd ();
    lc (); p3htg (); av (); p3htg (); bc ();
    lg (float_of_int x)
  in

  (* Laisser n blancs horizontalement partant d'une et
     revenant à une orientation nord du robot *)
  let espacement n =
    lc (); pqtd (); avf n; pqtg (); bc ()
  in

  let dizainesDesUnitesSexagesimales chiffreDesDizaines =
    begin match chiffreDesDizaines with
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
    end
  in

  let unitesDesUnitesSexagesimales chiffreDesUnites =
    begin match chiffreDesUnites with
      | 1 -> un 4
      | 2 -> un 4; un 4
      | 3 -> un 4; un 4; un 4
      | 4 ->
        lc (); pqtd (); av (); pqtg (); bc ();
        lg (float_of_int (x * 2)); teteDeClou ();
        lg (float_of_int x);
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
        lgX (float_of_int (x * 2)); teteDeClou ();
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
    end
  in

  (* En position médiale et uniquement pour marquer
     l'absence d'unités dans cette position *)
  let zeroBabylonien () =
    lc (); pqtd (); avf 6; bc ();
    p3htg (); avf 3; lg (float_of_int (x * 2)); vd ();
    avf (-1); vd ();
    lc (); pdt (); lg (float_of_int x); av (); bc ();
    lg (float_of_int (x * 2)); vd ();
    avf (-1);
    vd (); lc (); lg (float_of_int (x * 4)); av ();
    p3htg (); bc (); lg (float_of_int x)
  in

  let unitesEnBabylonien unitesSexagesimales =
    if unitesSexagesimales = 0 then zeroBabylonien ()
    else begin
      begin match unitesSexagesimales / 10 with
        | 1 -> dizainesDesUnitesSexagesimales 1
        | 2 -> dizainesDesUnitesSexagesimales 2
        | 3 -> dizainesDesUnitesSexagesimales 3
        | 4 -> dizainesDesUnitesSexagesimales 4
        | 5 -> dizainesDesUnitesSexagesimales 5
        | _ -> ()
      end;
      espacement 1;
      begin match unitesSexagesimales mod 10 with
        | 1 -> unitesDesUnitesSexagesimales 1
        | 2 -> unitesDesUnitesSexagesimales 2
        | 3 -> unitesDesUnitesSexagesimales 3
        | 4 -> unitesDesUnitesSexagesimales 4
        | 5 -> unitesDesUnitesSexagesimales 5
        | 6 -> unitesDesUnitesSexagesimales 6
        | 7 -> unitesDesUnitesSexagesimales 7
        | 8 -> unitesDesUnitesSexagesimales 8
        | 9 -> unitesDesUnitesSexagesimales 9
        | _ -> ()
      end
    end;
    espacement 4
  in

  let rec nombreEnBabylonien c =
    if c < 60 then unitesEnBabylonien c
    else begin
      nombreEnBabylonien (c / 60);
      unitesEnBabylonien (c mod 60)
    end
  in

  eb (); ag (); lc (); av (); pqtd (); av (); pqtg ();
  bc ();
  lg (float_of_int x);
  nombreEnBabylonien nombreACoder

(* Numération égyptienne *)
let numerationEgyptienne nombreACoder =
  let g = 6 in (* Taille de la grille *)
  (* Trait vertical *)
  let dixPuissanceZero () =
    avf 3; avf (-3)
  in

  (* Anse *)
  let dixPuissanceUn () =
    avf 2; vd (); vd (); avf 2; pdt ()
  in

  (* Spirale *)
  let dixPuissanceDeux () =
    let x = valLgX () in
    lc (); phtd (); avf 2; pqtg (); bc ();
    lg (x /. 2.); vg (); vg (); lg x; vg (); vg ();
    lg (x /. 2. *. 3.); vg (); vg ();
    lgX (x /. 2. *. 3.); lgY x; av ();
    phtg (); lc (); lgX (x /. 2.); av (); pqtg ();
    bc (); lg x
  in

  (* Lotus *)
  let dixPuissanceTrois () =
    let x = valLgX () in
    (* Bas *)
    lg (x /. 2. *. 3.); vd (); vd (); pqtd (); avf 2;
    (* Tige *)
    lc (); avf (-1); pqtd (); av (); bc (); lg x;
    phtg (); av (); avf (-1); pqtd ();
    av (); avf (-1); phtg (); lg (x /. 2. *. 15.);
    av ();
    (* Fleur *)
    lgX x; lgY (x /. 2.); pqtd (); vg (); phtg ();
    av (); pqtd (); av (); phtg (); vg ();
    lgX (x /. 2. *. 3.); lgY x; vg (); vg ();
    (* Se plaçer à droite du dessin orienté au nord *)
    lc (); pqtd (); lg (x /. 2.); avf 18; pqtg ();
    avf 3; pqtg (); bc (); lg x
  in

  (* Index *)
  let dixPuissanceQuatre () =
    let x = valLgX () in
    avf 9; lgY (x *. 2.); phtg (); av (); avf (-1);
    phtd (); lg x; avf (-9)
  in

  (* Têtard *)
  let dixPuissanceCinq () =
    let x = valLgX () in
    (* Pattes *)
    lc (); pqtd (); avf 2; bc (); lgX (x *. 3.);
    lgY (x *. 2.); phtg ();
    vd (); lgY (x /. 2.); lgX x; pqtg (); vg ();
    phtd (); vg (); phtd ();
    lgY (x /. 3. *. 2.); vd ();
    (* Ventre *)
    lc (); p3htd (); av (); pqtd (); bc ();
    lgX (x *. 3.); lgY (x *. 2.); vd ();
    (* Tête et oeuil gauche *)
    pqtg (); lgX (x /. 4.); avf (-1); lgY (x /. 2.);
    lgX (x /. 4. *. 5.);
    vd (); phtd (); lg (x *. 2.); vd (); lc ();
    p3htd (); lg x; av (); bc (); dp ();
    (* Dos *)
    lc (); pdt (); av (); bc (); pqtd ();
    lgY (x /. 2.); lgX x; vg (); lgX (x /. 2. *. 7.);
    lgY (x *. 2.); vd ();
    (* Queue *)
    phtg (); lgX (x *. 3.); lgY (x *. 2.); vg ();
    pdt (); lgX (x *. 4.); lgY (x *. 3.);
    vd (); p3htg (); lgX (x /. 2.); lgY x; vd ();
    (* Plaçer le robot à droite du dessin orienté au
       nord *)
    lc (); pdt (); lgX (x *. 5.); av (); pqtg ();
    lg x; bc ()
  in

  (* Un Génie *)
  let tete () =
    let x = valLgX () in
    vg (); vg (); phtd (); lgX (x /. 2.); vg ();
    phtg (); lgX (x /. 2. *. 3.);
    lgY (x *. 2.); vg ();
    (* Coiffe *)
    lc (); lg x; pqtg (); av (); bc (); phtd ();
    lg (x /. 2.);
    av (); vg (); phtg (); vg (); lc (); phtg (); av ();
    bc (); pqtg (); av (); vd ();
    phtd (); vd ();
    lc (); pqtg (); lgX (x /. 2. *. 3.);
    lgY (x *. 2.); av (); bc (); lg x
  in

  let brasDroit () =
    let x = valLgX () in
    lgY (x *. 3.); av (); lg (x /. 2.); p3htg ();
    vg (); phtg (); vg ();
    lc (); pdt (); lgX (x /. 2.); lgY (x *. 3.);
    av (); bc (); lg x
  in

  let brasGauche () =
    let x = valLgX () in
    lgY (x *. 3.); av (); lg (x /. 2.); p3htd ();
    vd (); phtd (); vd ();
    lc (); pdt (); lgX (x /. 2.); lgY (x *. 3.);
    av (); bc (); lg x
  in

  (* Génie du million *)
  let dixPuissanceSix () =
    let x = valLgX () in
    (* Cuisse gauche *)
    lc (); pqtd (); lgX (x /. 2.); av (); pqtg ();
    bc (); lg (x *. 2.); vd ();
    (* Côté droit du corps *)
    phtg (); lgX (x /. 2.); vg (); phtd (); lgX x;
    lgY (x *. 4.); vg (); phtd ();
    (* Bras droit, tête, bras gauche *)
    lg x; brasDroit (); lgX (x /. 2. *. 7.);
    lgY (x *. 2.); vg (); lg x;
    brasGauche (); lc (); phtd (); av (); bc ();
    p3htd (); tete ();
    (* Côté gauche du corps *)
    p3htd (); lgY (x *. 3.); vg (); lgX (x /. 2.);
    lgY (x *. 3.); vg (); phtd ();
    lgX x; lgY (x *. 2.); vd (); lg x;
    (* Jambe gauche *)
    p3htg (); lgX (x /. 2.); av (); avf (-9);
    (* Jambe et cuisse droites *)
    lc (); lgY (x /. 2. *. 3.); lgX (x /. 2.);
    phtg (); av (); bc (); lgX (x /. 2.);
    lgY (x *. 2.); pqtg (); av (); pdt ();
    lgX (x *. 2.); lgY (x /. 2. *. 3.); av ();
    (* Placer le robot à droite du dessin orienté au
       nord *)
    lc (); lgX (x *. 7. /. 2.); lgY (x *. 2.); av ();
    lg x; p3htg (); bc ()
  in

  (* Taille des hiéroglyphes de 10 puissance p *)
  let largeur p =
    match p with
    | 6 -> 6
    | 5 -> 10
    | 3 | 2 -> 3
    | 1 -> 2
    | _ -> 0
  in

  let hauteur p =
    match p with
    | 6 | 4 | 3 -> 11
    | 5 -> 4
    | 2 | 1 | 0 -> 3
    | _ -> 0
  in

  (* Disposition des hiéroglyphes *)
  let lignes chiffre =
    match chiffre with
    | 1 | 2 | 3 -> 1
    | 4 | 5 | 6 | 7 | 8 -> 2
    | 9 -> 3
    | _ -> 0
  in

  (* Nombre de colonnes de la 1re et de la 2e ligne *)
  let colonnes1 chiffre =
    match chiffre with
    | 1 -> 1
    | 2 | 4 | 5 -> 2
    | 3 | 6 | 7 | 9 -> 3
    | 8 -> 4
    | _ -> 0
  in

  let colonnes2 chiffre =
    match chiffre with
    | 4 -> 2
    | 5 | 6 | 9 -> 3
    | 7 | 8 -> 4
    | _ -> 0
  in

  (* Espaces entre les lignes et entre les colonnes *)
  let espaceLig p chiffre =
    if chiffre = 0 then 0
    else if chiffre >= 4 && chiffre <= 8
            && (p = 3 || p = 4) then 2
    else 1
  in

  let espaceCol p chiffre =
    if chiffre < 2 || chiffre > 9 then 0
    else if p = 5 then -2
    else if p >= 0 && p <= 6 then 1
    else 0
  in

  (* Largeur d'un hiéroglyphe et de l'espace qui le
     suit *)
  let pas p chiffre =
    largeur p + espaceCol p chiffre
  in

  (* Taille de la grille dans l'écriture horizontalement
     ou verticalement *)
  let grilleH p chiffre =
    let x = valLgX () in
    if (p = 3 || p = 4)
       && chiffre >= 4 && chiffre <= 8 then x /. 11. *. 5.
    else if (p = 3 || p = 4)
            && chiffre = 9 then x /. 22. *. 7.
    else if p <= 2 && p >= 0 then
      x /. 2.
    else if p = 5 then x /. 4. *. 3.
    else x
  in

  let grilleV p =
    if p >= 3 && p <= 6 then
      valLgX () /. 4. *. 3.
    else valLgX () /. 2.
  in

  (* Largeur d'une colonne dans la représentation
     hybride *)
  let rec largeurCoefficient valeurPrecedente p nombre =
    let chiffre = nombre mod 10 in
    let v =
      if colonnes1 chiffre = colonnes2 chiffre - 1
      then colonnes1 chiffre * pas p chiffre + largeur p
      else colonnes1 chiffre * pas p chiffre in
    let maxi = max v valeurPrecedente in
    if nombre < 10 then maxi
    else largeurCoefficient maxi (p + 1) (nombre / 10)
  in

  (* Déplacer le robot crayon levé de n fois la taille
     de la grille, à droite si n >= 0, à gauche sinon *)
  let espacement n =
    let x = valLgX () in
    lc ();
    if n > 0. then begin
      pqtd (); lg (x *. n); av (); pqtg ()
    end else begin
      pqtg (); lg (-. (x *. n)); av (); pqtd ()
    end;
    bc (); lg x
  in

  (* Écrire le chiffre ch des 10 puissance p,
     horizontalement si h vaut true *)
  let ecrireChiffreEnHieroglyphes h p ch =
    let c = ref (colonnes1 ch) in
    let x = valLgX () in
    if ch <> 0 then begin
      if h then begin
        lg (grilleH p ch);
        if !c = colonnes2 ch - 1 then
          espacement (float_of_int (pas p ch) /. 2.)
      end else begin
        lg (grilleV p);
        espacement
          (-. (float_of_int (colonnes1 ch * pas p ch
                             - espaceCol p ch) /. 2.))
      end;
      for j = 1 to lignes ch do
        for i = 1 to !c do
          begin match p with
            | 6 -> dixPuissanceSix ()
            | 5 -> dixPuissanceCinq ()
            | 4 -> dixPuissanceQuatre ()
            | 3 -> dixPuissanceTrois ()
            | 2 -> dixPuissanceDeux ()
            | 1 -> dixPuissanceUn ()
            | 0 -> dixPuissanceZero ()
            | _ -> ()
          end;
          (* Colonne suivante *)
          espacement (float_of_int (espaceCol p ch))
        done;
        (* Ligne suivante *)
        lc (); avf (hauteur p + espaceLig p ch); bc ();
        espacement (float_of_int (- (!c * pas p ch)));
        if !c = colonnes2 ch - 1 then begin
          espacement (-. (float_of_int (pas p ch) /. 2.));
          c := colonnes2 ch
        end
      done;
      (* Se placer pour tracer le ch suivant *)
      if h then begin
        espacement
          (float_of_int (!c * pas p ch - espaceCol p ch));
        lc ();
        avf (- (lignes ch
                * (hauteur p + espaceLig p ch)));
        bc ();
        espacement 2.;
        if p >= 1 && p <= 4 then
          espacement 1.
      end else
        espacement
          (float_of_int (!c * pas p ch - espaceCol p ch)
           /. 2.);
      lg x
    end
  in

  let rec plusFortePuissance c =
    if c < 10 then 0
    else 1 + plusFortePuissance (c / 10)
  in

  let rec dixPuissance n =
    if n = 0 then 1
    else dixPuissance (n - 1) * 10
  in

  let rec ecrireNombreEnHieroglyphes h p c =
    if c < 10 then ecrireChiffreEnHieroglyphes h p c
    else
      if h then begin
        ecrireNombreEnHieroglyphes h (p + 1) (c / 10);
        ecrireChiffreEnHieroglyphes h p (c mod 10)
      end else begin
        ecrireChiffreEnHieroglyphes h p (c mod 10);
        ecrireNombreEnHieroglyphes h (p + 1) (c / 10)
      end
  in

  let horizontalement = true in
  if nombreACoder >= 1000000000 then
    message "Trop grand pour les hiéroglyphes égyptiens."
  else begin
    (* Initialisation *)
    cacherRobot ();
    eb (); ag (); lg 12.; lc (); av (); pqtd (); av ();
    pqtg (); bc (); lg (float_of_int g);
    espacement 2.;
    (* Représentation classique *)
    if nombreACoder < 2000000 then
      ecrireNombreEnHieroglyphes horizontalement 0
        nombreACoder;
    (* Représentation hybride et grands nombres *)
    if nombreACoder >= 2000 then begin
      eb (); ag (); lg 12.; lc (); av (); pqtd (); av ();
      pqtg (); bc (); lg (float_of_int g);
      espacement 2.;
      (* Colonne de la plus forte puissance (génie,
         têtard, index ou lotus) à multiplier *)
      let pf = plusFortePuissance nombreACoder in
      let p = if pf = 3 then pf else if pf = 4 then pf - 1
              else pf - 2 in
      let coefficient = nombreACoder / dixPuissance p in
      let l =
        largeurCoefficient (largeur p) 0 coefficient in
      espacement (float_of_int l /. 2.);
      ecrireNombreEnHieroglyphes (not horizontalement) 0
        coefficient;
      ecrireChiffreEnHieroglyphes
        (not horizontalement) p 1;
      eb (); lg 12.; lc (); pn (); av (); bc ();
      lg (float_of_int g);
      espacement (float_of_int l /. 2. +. 1.);
      (* Ligne du reste du nombre *)
      ecrireNombreEnHieroglyphes horizontalement 0
        (nombreACoder mod dixPuissance p)
    end
  end

(* Numération grecque *)
let numerationGrecque nombreACoder =
  let x = 2 in (* Taille de la grille *)
  let c = 1 in (* Taille du crayon *)
  let talent = 6000 in
  let drachme = 6 in
  let obole = 1 in
  let espacement () =
    lc (); pqtd (); avf 2; pqtg (); bc ()
  in

  let un () =
    ec (c * 2); avf 9; avf (-9); ec c
  in

  let unDrachme () =
    ec (c * 2); avf 9; avf (-4); pqtd (); avf 2; lc ();
    pqtg ();
    avf (-5); bc (); ec c
  in

  let unTalent () =
    ec (c * 2); lc (); pqtd (); avf 3; pqtg (); bc ();
    avf 9; pqtg ();
    avf 3; avf (-6); avf 3; pqtd (); avf (-9); lc ();
    pqtd ();
    avf 3; pqtg (); bc (); ec c
  in

  let cinq () =
    ec (c * 2);
    avf 9; pqtd (); avf 6; pqtd (); avf 4;
    lc (); avf 5; pdt (); bc ();
    ec c
  in

  let cinqTalents () =
    ec (c * 2);
    avf 9; pqtd (); avf 6; pqtd (); avf 3; pqtd ();
    avf 3;
    pqtg (); avf 2; avf (-2); pqtd (); avf 3; lc ();
    avf (-6);
    pqtd (); avf (-6); bc (); ec c
  in

  let dix grandeTaille =
    if grandeTaille then begin
      lg (float_of_int (x * 3)); ec (c * 2)
    end;
    lgY (valLgY () *. 3.); phtd (); av (); pqtd ();
    av (); p3htd (); avf 2;
    lc (); pdt (); avf 2; pqtg (); bc ();
    lg (float_of_int x); ec c
  in

  let dixTalents grandeTaille =
    if grandeTaille then begin
      lg (float_of_int (x * 3)); ec (c * 2)
    end;
    lc (); lgY (valLgY () /. 3. *. 2.); av (); bc ();
    lgY (valLgY () *. 7. /. 2.); phtd ();
    av ();
    pqtd (); av (); p3htd (); av (); pqtg ();
    lgY (valLgY () *. 2. /. 7.); av (); avf (-1);
    pqtd (); av (); lc (); avf (-2); pqtd (); avf (-1);
    bc (); lg (float_of_int x); ec c
  in

  let cinquante () =
    lc (); lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x); pqtd (); avf 2; pqtg ();
    bc ();
    dix false;
    lc (); pqtg (); avf 4; pqtg ();
    lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x);
    pdt (); bc ();
    cinq ()
  in

  let cinquanteTalents () =
    lc (); lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x); pqtd (); avf 2; pqtg ();
    bc ();
    dixTalents false;
    lc (); pqtg (); avf 4; pqtg ();
    lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x);
    pdt (); bc ();
    cinq ()
  in

  let cent grandeTaille =
    if grandeTaille then begin
      lg (float_of_int (x * 3)); ec (c * 2)
    end;
    avf 3; lgY (valLgY () /. 2.); avf (-3); pqtd ();
    avf 2; pqtg ();
    avf 3; avf (-6); lg (float_of_int x); ec c
  in

  let centTalents grandeTaille =
    if grandeTaille then begin
      lg (float_of_int (x * 3)); ec (c * 2)
    end;
    avf 3; lgY (valLgY () /. 2.); avf (-3); pqtd ();
    av (); pqtd ();
    lgY (valLgY () *. 4. /. 3.); av (); avf (-1);
    pqtg (); av (); pqtg ();
    lgY (valLgY () *. 3. /. 4.); avf 3; avf (-6);
    lg (float_of_int x); ec c
  in

  let cinqCents () =
    lc (); avf 5; pqtd (); avf 4; pqtg (); bc ();
    cent false;
    lc (); pqtg (); avf 6; pqtg (); avf 5; pdt ();
    bc ();
    cinq ()
  in

  let cinqCentsTalents () =
    lc (); avf 5; pqtd (); avf 4; pqtg (); bc ();
    centTalents false;
    lc (); pqtg (); avf 6; pqtg (); avf 5; pdt ();
    bc ();
    cinq ()
  in

  let mille grandeTaille =
    if grandeTaille then begin
      lg (float_of_int (x * 3)); ec (c * 2)
    end;
    lgX (valLgX () *. 2.); lgY (valLgY () *. 3.);
    phtd (); av ();
    lc (); p3htg (); av (); p3htg (); bc (); av ();
    p3htg (); lg (float_of_int x); ec c
  in

  let milleTalents grandeTaille =
    if grandeTaille then begin
      lg (float_of_int (x * 3)); ec (c * 2)
    end;
    lgY (valLgY () /. 3. *. 2.); lc (); pqtd (); av ();
    pqtg (); bc (); av (); pqtd ();
    av (); avf (-2); phtg (); lgX (valLgX () *. 2.);
    lgY (valLgY () *. 7. /. 2.);
    av (); lc (); p3htg (); av (); p3htg (); bc ();
    av (); p3htg ();
    lgY (valLgY () *. 2. /. 7.);
    lc (); avf (-1); bc (); lg (float_of_int x); ec c
  in

  let cinqMille () =
    lc (); lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x); pqtd (); avf 2; pqtg ();
    bc ();
    mille false;
    lc (); pqtg (); avf 4; pqtg ();
    lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x);
    pdt (); bc ();
    cinq ()
  in

  let cinqMilleTalents () =
    lc (); lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x); pqtd (); avf 2; pqtg ();
    bc ();
    milleTalents false;
    lc (); pqtg (); avf 4; pqtg ();
    lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x);
    pdt (); bc ();
    cinq ()
  in

  let dixMille grandeTaille =
    if grandeTaille then begin
      lg (float_of_int (x * 3)); ec (c * 2)
    end;
    avf 3; lgY (valLgY () *. 2.); p3htd (); av ();
    pqtg (); av ();
    lgY (valLgY () /. 2.); p3htd (); avf 3; pdt ();
    lg (float_of_int x); ec c
  in

  let cinquanteMille () =
    lc (); lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x); pqtd (); avf 2; pqtg ();
    bc ();
    dixMille false;
    lc (); pqtg (); avf 4; pqtg ();
    lg (float_of_int x /. 2.); avf 11;
    lg (float_of_int x);
    pdt (); bc ();
    cinq ()
  in

  let ecrireChiffre grandNombre unite puissanceDeDix
      chiffre =
    if unite = talent then begin
      for i = 1 to chiffre / 5 do
        begin match puissanceDeDix with
          | 0 -> cinqTalents ()
          | 1 -> cinquanteTalents ()
          | 2 -> cinqCentsTalents ()
          | 3 -> cinqMilleTalents ()
          | _ -> ()
        end;
        espacement ()
      done;
      for i = 1 to chiffre mod 5 do
        begin match puissanceDeDix with
          | 0 -> unTalent ()
          | 1 -> dixTalents true
          | 2 -> centTalents true
          | 3 -> milleTalents true
          | _ -> ()
        end;
        espacement ()
      done
    end
    else if unite = drachme then begin
      for i = 1 to chiffre / 5 do
        begin match puissanceDeDix with
          | 0 -> cinq ()
          | 1 -> cinquante ()
          | 2 -> cinqCents ()
          | 3 -> cinqMille ()
          | 4 -> cinquanteMille ()
          | _ -> ()
        end;
        espacement ()
      done;
      for i = 1 to chiffre mod 5 do
        begin match puissanceDeDix with
          | 0 ->
            if grandNombre then unDrachme ()
            else un ()
          | 1 -> dix true
          | 2 -> cent true
          | 3 -> mille true
          | 4 -> dixMille true
          | _ -> ()
        end;
        espacement ()
      done
    end
    else if unite = obole then begin
      for i = 1 to chiffre do
        un ();
        espacement ()
      done
    end
  in

  let rec ecrireNombre b u p c =
    if c < 10 then ecrireChiffre b u p c
    else begin
      ecrireNombre b u (p + 1) (c / 10);
      ecrireChiffre b u p (c mod 10)
    end
  in

  let ecrireNombreEnGrec c =
    let grandNombre = true in
    if c >= 100000 then begin
      ecrireNombre grandNombre talent 0 (c / 6 / 6000);
      ecrireNombre grandNombre drachme 0 (c / 6 mod 6000);
      ecrireNombre grandNombre obole 0 (c mod 6)
    end else ecrireNombre (not grandNombre) drachme 0 c
  in

  ec c; eb (); ag (); lc (); pne (); av (); pn ();
  bc (); lg (float_of_int x);
  ecrireNombreEnGrec nombreACoder

(* Numération romaine *)
let numerationRomaine nombreACoder =
  let x = 3 in (* Taille de la grille *)
  let espacement n =
    lc (); pqtd (); avf n; pqtg (); bc ()
  in

  let un () =
    avf 6; avf (-6);
    espacement 2
  in

  let cinq () =
    lc (); avf 6; bc (); p3htd ();
    lgX (float_of_int (x * 2));
    lgY (float_of_int (x * 6));
    av ();
    pqtg (); av (); lc (); p3htd (); av (); pdt ();
    bc (); lg (float_of_int x);
    espacement 2
  in

  let dix () =
    lgX (float_of_int (x * 4));
    lgY (float_of_int (x * 6)); phtd (); av (); lc ();
    p3htg ();
    av (); bc ();
    p3htg (); av (); lc (); p3htg (); bc ();
    lg (float_of_int x);
    espacement 2
  in

  let cinquante () =
    avf 6; avf (-6); pqtd (); avf 4;
    pqtg ();
    espacement 2
  in

  let cent () =
    lc (); lgX (float_of_int (x * 4));
    lgY (float_of_int (x * 2)); phtd (); av (); bc ();
    lgX (float_of_int (x * 2));
    p3htd (); vd (); lgY (float_of_int (x * 3)); vd ();
    vd (); lgY (float_of_int (x * 2));
    vd (); lc ();
    avf 2; pdt (); bc (); lg (float_of_int x);
    espacement 2
  in

  let cinqCents () =
    avf 6; pqtd (); avf 1; lg (float_of_int (x * 3));
    vd (); vd (); lg (float_of_int x);
    av ();
    lc (); avf (-4); pqtd (); bc ();
    espacement 2
  in

  let mille () =
    avf 6; lgX (float_of_int (x * 2));
    lgY (float_of_int (x * 5)); p3htd (); av ();
    pqtg ();
    av ();
    lg (float_of_int x); p3htd (); avf 6; pdt ();
    espacement 2
  in

  let surligner n =
    lc (); avf 8; pqtg (); avf 2; bc (); avf (n - 2);
    avf (- (n - 2));
    lc (); avf (-2); pqtd (); avf (-8); bc ()
  in

  let debutFacteurCentMille () =
    avf 8; pqtd (); avf 2; avf (-2); pqtg (); avf (-8);
    espacement 2
  in

  let finFacteurCentMille () =
    avf 8; pqtg (); avf 2; avf (-2); pqtd (); avf (-8);
    espacement 4
  in

  let rec ecrireNombreEnRomain n =
    if n >= 1000 then begin
      mille (); ecrireNombreEnRomain (n - 1000)
    end else if n >= 950 then begin
      cinquante (); mille ();
      ecrireNombreEnRomain (n - 950)
    end else if n >= 900 then begin
      cent (); mille (); ecrireNombreEnRomain (n - 900)
    end else if n >= 500 then begin
      cinqCents (); ecrireNombreEnRomain (n - 500)
    end else if n >= 400 then begin
      cent (); cinqCents ();
      ecrireNombreEnRomain (n - 400)
    end else if n >= 100 then begin
      cent (); ecrireNombreEnRomain (n - 100)
    end else if n >= 90 then begin
      dix (); cent (); ecrireNombreEnRomain (n - 90)
    end else if n >= 50 then begin
      cinquante (); ecrireNombreEnRomain (n - 50)
    end else if n >= 40 then begin
      dix (); cinquante (); ecrireNombreEnRomain (n - 40)
    end else if n >= 10 then begin
      dix (); ecrireNombreEnRomain (n - 10)
    end else if n >= 9 then begin
      un (); dix ()
    end else if n >= 5 then begin
      cinq (); ecrireNombreEnRomain (n - 5)
    end else if n >= 4 then begin
      un (); cinq ()
    end else if n >= 1 then begin
      un (); ecrireNombreEnRomain (n - 1)
    end else if n = 0 then ()
  in

  let rec largeur n =
    if n >= 1000 then 6 + largeur (n - 1000)
    else if n >= 950 then 2 * 6 + largeur (n - 950)
    else if n >= 900 then 2 * 6 + largeur (n - 900)
    else if n >= 500 then 6 + largeur (n - 500)
    else if n >= 400 then 2 * 6 + largeur (n - 400)
    else if n >= 100 then 6 + largeur (n - 100)
    else if n >= 90 then 2 * 6 + largeur (n - 90)
    else if n >= 50 then 6 + largeur (n - 50)
    else if n >= 40 then 2 * 6 + largeur (n - 40)
    else if n >= 10 then 6 + largeur (n - 10)
    else if n >= 9 then 2 + 6
    else if n >= 5 then 6 + largeur (n - 5)
    else if n >= 4 then 2 + 6
    else if n >= 1 then 2 + largeur (n - 1)
    else 0
  in

  let rec nombreEnRomain n =
    if n >= 500000000 then
      message "Trop grand pour les chiffres romains."
    else if n >= 100000 then begin
      debutFacteurCentMille ();
      ecrireNombreEnRomain (n / 100000);
      surligner (largeur (n / 100000));
      finFacteurCentMille ();
      nombreEnRomain (n mod 100000)
    end else if n < 5000 then ecrireNombreEnRomain n
    else begin
      ecrireNombreEnRomain (n / 1000);
      surligner (largeur (n / 1000));
      espacement 2;
      ecrireNombreEnRomain (n mod 1000)
    end
  in

  ag (); eb (); lc (); av (); pqtd (); av (); pqtg ();
  bc (); lg (float_of_int x);
  espacement 2;
  nombreEnRomain nombreACoder

(* Numération hexadécimale *)
let rec decimalEnHexadecimal n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnHexadecimal (- n)
  end else if n >= 16 then begin
    decimalEnHexadecimal (n / 16);
    decimalEnHexadecimal (n mod 16)
  end else if n = 15 then begin
    ecrire "F"; translater (1, 0)
  end else if n = 14 then begin
    ecrire "E"; translater (1, 0)
  end else if n = 13 then begin
    ecrire "D"; translater (1, 0)
  end else if n = 12 then begin
    ecrire "C"; translater (1, 0)
  end else if n = 11 then begin
    ecrire "B"; translater (1, 0)
  end else if n = 10 then begin
    ecrire "A"; translater (1, 0)
  end else begin
    ecrire (string_of_int n); translater (1, 0)
  end

(* Numération décimale *)
let rec decimalEnDecimal n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnDecimal (- n)
  end else if n >= 10 then begin
    decimalEnDecimal (n / 10);
    decimalEnDecimal (n mod 10)
  end else begin
    ecrire (string_of_int n); translater (1, 0)
  end

(* Numération octale *)
let rec decimalEnOctal n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnOctal (- n)
  end else if n >= 8 then begin
    decimalEnOctal (n / 8);
    decimalEnOctal (n mod 8)
  end else begin
    ecrire (string_of_int n); translater (1, 0)
  end

(* Numération ternaire *)
let rec decimalEnTernaire n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnTernaire (- n)
  end else if n = 0 then begin
    ecrire "0"; translater (1, 0)
  end else if n = 1 then begin
    ecrire "1"; translater (1, 0)
  end else if n = 2 then begin
    ecrire "2"; translater (1, 0)
  end else begin
    decimalEnTernaire (n / 3);
    decimalEnTernaire (n mod 3)
  end

(* Numération binaire *)
let rec decimalEnBinaire n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnBinaire (- n)
  end else if n = 0 then begin
    ecrire "0"; translater (1, 0)
  end else if n = 1 then begin
    ecrire "1"; translater (1, 0)
  end else begin
    decimalEnBinaire (n / 2);
    decimalEnBinaire (n mod 2)
  end

(* Nombre à coder *)
let nombreACoder = 123456789

(* Annoncer le codage dans la numération nom *)
let annoncer nom =
  message ("Codage de " ^ string_of_int nombreACoder
           ^ " en numération " ^ nom ^ ".")

(* Attendre avant de passer à la numération suivante *)
let suivant () =
  bip (); bip (); marquerUnePause (); cf blanc

(* Écrire en grands chiffres en bas à gauche *)
let enChiffres () =
  lg 16.; policeTexte courier; styleTexte gras;
  tailleTexte 24; eb (); ag ()

let () =
  annoncer "babylonienne";
  numerationBabylonienne nombreACoder; suivant ();
  annoncer "égyptienne";
  numerationEgyptienne nombreACoder; suivant ();
  annoncer "grecque";
  numerationGrecque nombreACoder; suivant ();
  annoncer "romaine";
  numerationRomaine nombreACoder; suivant ();
  enChiffres (); annoncer "hexadécimale";
  decimalEnHexadecimal nombreACoder; suivant ();
  enChiffres (); annoncer "décimale";
  decimalEnDecimal nombreACoder; suivant ();
  enChiffres (); annoncer "octale";
  decimalEnOctal nombreACoder; suivant ();
  enChiffres (); annoncer "ternaire";
  decimalEnTernaire nombreACoder; suivant ();
  enChiffres (); annoncer "binaire";
  decimalEnBinaire nombreACoder; suivant ()
