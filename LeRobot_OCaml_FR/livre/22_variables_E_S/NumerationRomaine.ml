open LibRobot

(* Écrire un nombre en chiffres romains *)

let x = 3.  (* Taille de la grille *)

let espacement n =
  lc (); pqtd (); avf n; pqtg (); bc ()

let un () =
  avf 6; avf (-6);
  espacement 2

let cinq () =
  lc (); avf 6; bc (); p3htd (); lgX (x *. 2.);
  lgY (x *. 6.);
  av ();
  pqtg (); av (); lc (); p3htd (); av (); pdt (); bc ();
  lg x;
  espacement 2

let dix () =
  lgX (x *. 4.); lgY (x *. 6.); phtd (); av (); lc ();
  p3htg ();
  av (); bc ();
  p3htg (); av (); lc (); p3htg (); bc (); lg x;
  espacement 2

let cinquante () =
  avf 6; avf (-6); pqtd (); avf 4;
  pqtg ();
  espacement 2

let cent () =
  lc (); lgX (x *. 4.); lgY (x *. 2.); phtd (); av ();
  bc ();
  lgX (x *. 2.);
  p3htd (); vd (); lgY (x *. 3.); vd (); vd ();
  lgY (x *. 2.);
  vd (); lc ();
  avf 2; pdt (); bc (); lg x;
  espacement 2

let cinqCents () =
  avf 6; pqtd (); avf 1; lg (x *. 3.); vd (); vd (); lg x;
  av ();
  lc (); avf (-4); pqtd (); bc ();
  espacement 2

let mille () =
  avf 6; lgX (x *. 2.); lgY (x *. 5.); p3htd (); av ();
  pqtg ();
  av ();
  lg x; p3htd (); avf 6; pdt ();
  espacement 2

let surligner n =
  lc (); avf 8; pqtg (); avf 2; bc (); avf (n - 2);
  avf (2 - n);
  lc (); avf (-2); pqtd (); avf (-8); bc ()

let debutFacteurCentMille () =
  avf 8; pqtd (); avf 2; avf (-2); pqtg (); avf (-8);
  espacement 2

let finFacteurCentMille () =
  avf 8; pqtg (); avf 2; avf (-2); pqtd (); avf (-8);
  espacement 4

let rec ecrireNombreEnRomain n =
  if n >= 1000 then begin
    mille (); ecrireNombreEnRomain (n - 1000)
  end else if n >= 950 then begin
    cinquante (); mille (); ecrireNombreEnRomain (n - 950)
  end else if n >= 900 then begin
    cent (); mille (); ecrireNombreEnRomain (n - 900)
  end else if n >= 500 then begin
    cinqCents (); ecrireNombreEnRomain (n - 500)
  end else if n >= 400 then begin
    cent (); cinqCents (); ecrireNombreEnRomain (n - 400)
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
  end

(* Largeur du nombre n écrit en chiffres romains *)
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

let rec nombreEnRomain n =
  if n >= 500000000 then
    writeln ["Trop grand pour les chiffres romains."]
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

let () =
  write ["Nombre à coder n = "];
  let n = lireEntier () in
  lg x; ag (); espacement 2;
  nombreEnRomain n;
  st ()
