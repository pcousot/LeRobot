open LibRobot

(* Écrire un nombre en numération acrophonique grecque *)

let x = 2.  (* Taille de la grille *)
let c = 1  (* Taille du crayon *)
let talent = 6000
let drachme = 6
let obole = 1

let espacement () =
  lc (); pqtd (); avf 2; pqtg (); bc ()

let un () =
  ec (c * 2); avf 9; avf (-9); ec c

let unDrachme () =
  ec (c * 2); avf 9; avf (-4); pqtd (); avf 2; lc ();
  pqtg ();
  avf (-5); bc (); ec c

let unTalent () =
  ec (c * 2); lc (); pqtd (); avf 3; pqtg (); bc ();
  avf 9; pqtg ();
  avf 3; avf (-6); avf 3; pqtd (); avf (-9); lc ();
  pqtd ();
  avf 3; pqtg (); bc (); ec c

let cinq () =
  ec (c * 2);
  avf 9; pqtd (); avf 6; pqtd (); avf 4;
  lc (); avf 5; pdt (); bc ();
  ec c

let cinqTalents () =
  ec (c * 2);
  avf 9; pqtd (); avf 6; pqtd (); avf 3; pqtd (); avf 3;
  pqtg (); avf 2; avf (-2); pqtd (); avf 3; lc ();
  avf (-6);
  pqtd (); avf (-6); bc (); ec c

let dix grandeTaille =
  if grandeTaille then begin
    lg (x *. 3.); ec (c * 2)
  end;
  lgY (valLgY () *. 3.); phtd (); av (); pqtd (); av ();
  p3htd (); avf 2;
  lc (); pdt (); avf 2; pqtg (); bc (); lg x; ec c

let dixTalents grandeTaille =
  if grandeTaille then begin
    lg (x *. 3.); ec (c * 2)
  end;
  lc (); lgY (valLgY () /. 3. *. 2.); av (); bc ();
  lgY (valLgY () *. 7. /. 2.); phtd ();
  av ();
  pqtd (); av (); p3htd (); av (); pqtg ();
  lgY (valLgY () *. 2. /. 7.); av (); avf (-1);
  pqtd (); av (); lc (); avf (-2); pqtd (); avf (-1);
  bc (); lg x; ec c

let cinquante () =
  lc (); lg (x /. 2.); avf 11; lg x; pqtd (); avf 2;
  pqtg ();
  bc ();
  dix false;
  lc (); pqtg (); avf 4; pqtg (); lg (x /. 2.); avf 11;
  lg x;
  pdt (); bc ();
  cinq ()

let cinquanteTalents () =
  lc (); lg (x /. 2.); avf 11; lg x; pqtd (); avf 2;
  pqtg ();
  bc ();
  dixTalents false;
  lc (); pqtg (); avf 4; pqtg (); lg (x /. 2.); avf 11;
  lg x;
  pdt (); bc ();
  cinq ()

let cent grandeTaille =
  if grandeTaille then begin
    lg (x *. 3.); ec (c * 2)
  end;
  avf 3; lgY (valLgY () /. 2.); avf (-3); pqtd (); avf 2;
  pqtg ();
  avf 3; avf (-6); lg x; ec c

let centTalents grandeTaille =
  if grandeTaille then begin
    lg (x *. 3.); ec (c * 2)
  end;
  avf 3; lgY (valLgY () /. 2.); avf (-3); pqtd (); av ();
  pqtd ();
  lgY (valLgY () *. 4. /. 3.); av (); avf (-1); pqtg ();
  av (); pqtg ();
  lgY (valLgY () *. 3. /. 4.); avf 3; avf (-6); lg x; ec c

let cinqCents () =
  lc (); avf 5; pqtd (); avf 4; pqtg (); bc ();
  cent false;
  lc (); pqtg (); avf 6; pqtg (); avf 5; pdt (); bc ();
  cinq ()

let cinqCentsTalents () =
  lc (); avf 5; pqtd (); avf 4; pqtg (); bc ();
  centTalents false;
  lc (); pqtg (); avf 6; pqtg (); avf 5; pdt (); bc ();
  cinq ()

let mille grandeTaille =
  if grandeTaille then begin
    lg (x *. 3.); ec (c * 2)
  end;
  lgX (valLgX () *. 2.); lgY (valLgY () *. 3.); phtd ();
  av ();
  lc (); p3htg (); av (); p3htg (); bc (); av ();
  p3htg (); lg x; ec c

let milleTalents grandeTaille =
  if grandeTaille then begin
    lg (x *. 3.); ec (c * 2)
  end;
  lgY (valLgY () /. 3. *. 2.); lc (); pqtd (); av ();
  pqtg (); bc (); av (); pqtd ();
  av (); avf (-2); phtg (); lgX (valLgX () *. 2.);
  lgY (valLgY () *. 7. /. 2.);
  av (); lc (); p3htg (); av (); p3htg (); bc (); av ();
  p3htg ();
  lgY (valLgY () *. 2. /. 7.);
  lc (); avf (-1); bc (); lg x; ec c

let cinqMille () =
  lc (); lg (x /. 2.); avf 11; lg x; pqtd (); avf 2;
  pqtg ();
  bc ();
  mille false;
  lc (); pqtg (); avf 4; pqtg (); lg (x /. 2.); avf 11;
  lg x;
  pdt (); bc ();
  cinq ()

let cinqMilleTalents () =
  lc (); lg (x /. 2.); avf 11; lg x; pqtd (); avf 2;
  pqtg ();
  bc ();
  milleTalents false;
  lc (); pqtg (); avf 4; pqtg (); lg (x /. 2.); avf 11;
  lg x;
  pdt (); bc ();
  cinq ()

let dixMille grandeTaille =
  if grandeTaille then begin
    lg (x *. 3.); ec (c * 2)
  end;
  avf 3; lgY (valLgY () *. 2.); p3htd (); av (); pqtg ();
  av ();
  lgY (valLgY () /. 2.); p3htd (); avf 3; pdt ();
  lg x; ec c

let cinquanteMille () =
  lc (); lg (x /. 2.); avf 11; lg x; pqtd (); avf 2;
  pqtg ();
  bc ();
  dixMille false;
  lc (); pqtg (); avf 4; pqtg (); lg (x /. 2.); avf 11;
  lg x;
  pdt (); bc ();
  cinq ()

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
  end else if unite = drachme then begin
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
  end else if unite = obole then begin
    for i = 1 to chiffre do
      un ();
      espacement ()
    done
  end

let rec ecrireNombre b u p c =
  if c < 10 then ecrireChiffre b u p c
  else begin
    ecrireNombre b u (p + 1) (c / 10);
    ecrireChiffre b u p (c mod 10)
  end

let ecrireNombreEnGrec c =
  let grandNombre = true in
  if c >= 100000 then begin
    ecrireNombre grandNombre talent 0 (c / 6 / 6000);
    ecrireNombre grandNombre drachme 0 (c / 6 mod 6000);
    ecrireNombre grandNombre obole 0 (c mod 6)
  end else ecrireNombre (not grandNombre) drachme 0 c

let () =
  write ["Nombre à coder n = "];
  let n = lireEntier () in
  ec c; lg x; ag ();
  ecrireNombreEnGrec n;
  st ()
