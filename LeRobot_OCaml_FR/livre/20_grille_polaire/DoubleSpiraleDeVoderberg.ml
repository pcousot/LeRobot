open LibRobot

(* Pavage du plan à l'aide de deux spirales
   formées de pavés de Voderberg *)

let tailleQuadrillage = 6.
let n = 12  (* n pavés contigus forment un demi-cercle *)
let theta = 15.
let c = 4   (* Nombre de demi-couronnes constituant une
               spirale *)

(* Dessiner un pavé de Voderberg en commençant par la
   pointe. *)
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
   base. *)
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

let spirale () =
  for i = 1 to c do
    for j = 1 to n do
      pavePointe ();
      for k = 1 to i - 1 do
        paveBase (); pavePointe ()
      done
    done
  done

(* Dessiner un pavé de Voderberg miroir en commençant
   par la pointe. *)
let pavePointeMiroir () =
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (4. *. theta);
  av (); pdt (); rt (7. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt ()

(* Dessiner un pavé de Voderberg miroir en commençant
   par la base. *)
let paveBaseMiroir () =
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt theta;
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (7. *. theta);
  av (); avf (-1); rt (-. (7. *. theta))

let spiraleMiroir () =
  for i = 1 to c do
    for j = 1 to n do
      pavePointeMiroir ();
      for k = 1 to i - 1 do
        paveBaseMiroir (); pavePointeMiroir ()
      done
    done
  done

let () =
  lg tailleQuadrillage; spirale ();
  ce (); lg tailleQuadrillage; pn (); lc ();
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt ();
  bc ();
  spiraleMiroir (); st ()
