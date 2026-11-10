open LibRobot

(* Pavage de triangles et d'étoiles *)

let longueurCote = 15.
let nbLignes = 5
let nbColonnes = 6

let croix () =
  lgRT (longueurCote, 60.);
  pne (); av (); p3htg (); avf 2; p3htg (); avf 2;
  p3htd (); avf 2; p3htd (); av ();
  lgRT (longueurCote, 30.);
  pne (); av (); p3htd (); avf 2; p3htd (); avf 2;
  p3htg (); avf 2; p3htg (); av ()

let pavage () =
  for j = 1 to nbColonnes do
    for i = 1 to nbLignes do
      lgRT (longueurCote, 60.); eh ();
      translater (0, - (2 * i));
      lgRT (longueurCote, 30.); ag ();
      translater (2 * j, 0);
      croix ()
    done
  done

let coloriage () =
  cc bleu;
  for j = 1 to nbColonnes - 1 do
    for i = 1 to nbLignes - 1 do
      lgRT (longueurCote, 60.); eh ();
      translater (0, - (2 * i + 1));
      lgRT (longueurCote, 30.); ag ();
      translater (2 * j + 1, 0);
      peindre ()
    done
  done

let () =
  pavage (); coloriage (); st ()
