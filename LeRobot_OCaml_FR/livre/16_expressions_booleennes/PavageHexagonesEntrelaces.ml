open LibRobot

(* Dessiner un pavage d'hexagones entrelacés *)

let uniteTailleGrille = 2
let nombreDeLignes = 8
let nombreDeColonnes = 6

(* Carreaux de 4 x 8 unités et orientation nord pour
   l'hexagone vertical, carreaux de 8 x 4 unités et
   orientation ouest pour l'hexagone horizontal. *)
let hexagone () =
  for i = 1 to 2 do
    for j = 1 to 3 do
      phtd (); av ()
    done;
    phtd ()
  done

(* Carreaux de largeur x et de hauteur y unités *)
let carreaux x y =
  lgX (float_of_int (x * uniteTailleGrille));
  lgY (float_of_int (y * uniteTailleGrille))

let pavageHexagonesVerticaux () =
  lg (float_of_int uniteTailleGrille); ag (); eh ();
  carreaux 4 8;
  lc (); pdt (); av (); pdt (); bc ();
  for l = 1 to nombreDeLignes do
    for c = 1 to nombreDeColonnes - 1 do
      hexagone ();
      (* Aller à l'hexagone suivant *)
      lc (); pqtd (); avf 4; pqtg (); bc ()
    done;
    if l mod 2 = 1 then
      hexagone ();
    (* Aller à la ligne suivante *)
    lc (); lg (float_of_int uniteTailleGrille); ag ();
    carreaux 4 8;
    if l mod 2 = 1 then begin
      pdt (); av (); pqtg (); avf 2; pqtg ()
    end else begin
      pdt (); av (); pdt ()
    end;
    bc ()
  done

let pavageHexagonesHorizontaux () =
  lg (float_of_int uniteTailleGrille); ag (); eh ();
  lc (); p3htd ();
  lg (float_of_int (14 * uniteTailleGrille));
  av (); p3htd (); bc ();
  carreaux 8 4;
  for l = 1 to nombreDeLignes do
    for c = 1 to nombreDeColonnes - 2 do
      hexagone ();
      (* Aller à l'hexagone suivant *)
      lc (); pdt (); avf 2; pdt (); bc ()
    done;
    if l mod 2 = 1 then
      hexagone ();
    (* Aller à la ligne suivante *)
    lc (); lg (float_of_int uniteTailleGrille); ag ();
    pdt (); lgX (float_of_int (6 * uniteTailleGrille));
    av (); pdt ();
    carreaux 8 4;
    if l mod 2 = 1 then begin
      pqtg (); avf 2; pqtg (); avf 2; pdt ()
    end else begin
      pqtg (); avf 2; pqtg (); av (); pdt ()
    end;
    bc ()
  done

let () =
  pavageHexagonesVerticaux ();
  pavageHexagonesHorizontaux ();
  st ()
