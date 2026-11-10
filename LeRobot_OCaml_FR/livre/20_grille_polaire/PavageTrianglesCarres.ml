open LibRobot

(* Pavage de triangles et de carrés *)

let longueurCote = 15.
let nbLignes = 6
let nbColonnes = 4

let trianglesNS () =
  lgRT (longueurCote, 60.);
  pn (); phtd (); av (); pqtd (); av (); p3htd (); avf 2;
  p3htg (); av (); pqtg (); av ()

let trianglesWE () =
  lgRT (longueurCote, 30.);
  pne (); av (); pqtd (); av (); pqtd (); av (); pqtd ();
  av (); pqtd (); av (); p3htd ();
  avf 2; p3htg (); av ()

let pavage () =
  ce (); lg 12.; eh ();
  for i = 1 to nbLignes do
    lgRT (longueurCote, 60.); lc (); ag ();
    if i mod 2 = 1 then begin
      lgRT (longueurCote, 30.); ps (); av ();
      lgRT (longueurCote, 60.); av ()
    end else begin
      lgRT (longueurCote, 30.); pe (); av (); ps ();
      av ();
      lgRT (longueurCote, 60.); psw (); av ()
    end;
    bc ();
    for j = 1 to nbColonnes do
      if i mod 2 = 1 then begin
        trianglesWE (); trianglesNS ()
      end else begin
        trianglesNS (); trianglesWE ()
      end
    done
  done

let coloriage () =
  ce (); lg 12.; eh (); lc ();
  for i = 1 to nbLignes - 1 do
    lgRT (longueurCote, 60.); lc (); ag ();
    if i mod 2 = 1 then begin
      lgRT (longueurCote, 30.); ps (); av ();
      lgRT (longueurCote, 60.); av ()
    end else begin
      lgRT (longueurCote, 30.); pe (); av (); ps ();
      av ();
      lgRT (longueurCote, 60.); psw (); av ()
    end;
    for j = 1 to nbColonnes do
      if i mod 2 = 1 then begin
        lgRT (longueurCote, 30.); pe (); avf 2; pn ();
        cc jaune; peindre ();
        if j <> nbColonnes then begin
          lgRT (longueurCote, 60.); pe (); avf 2; pn ();
          cc noir; peindre ()
        end
      end else begin
        lgRT (longueurCote, 60.); pe (); avf 2; pn ();
        cc noir; peindre ();
        if j <> nbColonnes then begin
          lgRT (longueurCote, 30.); pe (); avf 2; pn ();
          cc jaune; peindre ()
        end
      end
    done
  done

let () =
  pavage (); coloriage (); st ()
