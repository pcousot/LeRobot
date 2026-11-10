open LibRobot

(* Pavage de Al-Karagi : carrés emboîtés de côtés 1,
   1 + 2, 1 + 2 + 3, ..., 1 + 2 + ... + 10 *)

let () =
  lg 3.; eb (); ag ();
  for i = 1 to 10 do
    (* Dessiner un carré de taille de côté
       1 + 2 + ... + i *)
    for j = 1 to 4 do
      for k = 1 to i do
        for l = 1 to k do av () done
      done;
      pqtd ()
    done
  done;
  st ()
