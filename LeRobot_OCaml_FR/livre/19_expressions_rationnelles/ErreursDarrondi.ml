open LibRobot

(* Erreurs d'arrondi : en mathématiques, élever cinq fois
   au carré la racine carrée de la racine carrée de ...
   de la racine carrée de 2 redonne 2 *)

let () =
  let x =
    (((((sqrt (sqrt (sqrt (sqrt (sqrt 2.))))) ** 2.)
       ** 2.) ** 2.) ** 2.) ** 2. in
  writeln ["Au lieu de 2 on trouve ";
           Printf.sprintf "%.17g" x];
  writeln ["0.1 +. 0.2 = ";
           Printf.sprintf "%.17g" (0.1 +. 0.2)];
  writeln ["Terminer en tapant la touche Entrée"];
  readln ()
