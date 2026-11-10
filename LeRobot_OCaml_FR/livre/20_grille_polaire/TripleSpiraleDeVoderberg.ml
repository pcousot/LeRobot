open LibRobot

(* Pavage du plan à l'aide de trois spirales
   formées de pavés de Voderberg *)

let tailleQuadrillage = 6.
let longueur = 3  (* Nombre de tiers de couronnes
                     constituant une spirale *)
let theta = 15.

(* Dessiner un pavé de Voderberg en commençant par la
   pointe *)
let pavePointe () =
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (7. *. theta);
  av (); pdt (); rt (4. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt ()

(* Dessiner un pavé de Voderberg en commençant par la
   base *)
let paveBase () =
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt theta;
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (4. *. theta);
  av (); avf (-1); rt (-. (4. *. theta))

let segment n =
  for i = 1 to 4 do
    pavePointe ();
    for j = 1 to n do
      paveBase (); pavePointe ()
    done
  done

let virage n =
  for i = 1 to 4 do
    pavePointe ();
    for j = 1 to n - 1 do
      paveBase (); pavePointe ()
    done
  done

let spirale l =
  for i = 1 to l do
    segment i; virage i
  done

let () =
  ce (); lg tailleQuadrillage; pn ();
  spirale longueur;
  ce (); lg tailleQuadrillage; pn (); rt (8. *. theta);
  spirale longueur;
  ce (); lg tailleQuadrillage; pn (); rt (16. *. theta);
  spirale longueur;
  st ()
