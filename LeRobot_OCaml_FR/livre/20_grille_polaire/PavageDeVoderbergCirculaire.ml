open LibRobot

(* Pavage du disque avec des pavés de Voderberg *)

(* Les pavés de Voderberg sont disposés en couronnes
   circulaires *)
let tailleQuadrillage = 8.
let n = 12  (* 2 * n pavés forment un cercle *)
let c = 3  (* Nombre de couronnes *)
let theta = 15.

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

let pavage () =
  for i = 1 to c do
    for j = 1 to 2 * n do
      pavePointe ();
      for k = 1 to i - 1 do
        paveBase (); pavePointe ()
      done
    done;
    (* Passer à la couronne extérieure suivante. *)
    lc ();
    av (); pdt (); rt (11. *. theta);
    av (); pdt (); rt (11. *. theta);
    av (); pdt (); rt (11. *. theta);
    av (); pdt (); rt (-. (9. *. theta));
    bc ()
  done

let () =
  lg tailleQuadrillage; pavage (); st ()
