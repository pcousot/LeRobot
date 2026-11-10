open LibRobot

(* Construire un carré magique d'ordre impair *)

(* Lire au clavier l'ordre n (impair) du carré *)
let rec lireOrdre () =
  write ["Ordre du carré magique (impair), n = "];
  let n = lireEntier () in
  if n > 0 && n mod 2 = 1 then n else lireOrdre ()

(* Placer le robot au coin inférieur gauche du carré : un
   pas au-dessus et à droite du coin de la fenêtre *)
let origine () =
  eb (); ag (); translater (1, 1)

(* Écrire le texte s centré sur la position du robot
   (procédure technique qui utilise directement la
   bibliothèque graphique) *)
let ecrireCentre s =
  Principal.wait ();
  enreg (fun () ->
      let (w, h) = Graphics.text_size s in
      let x = Robot.pixel (valX ())
      and y = Robot.pixel (valY ()) in
      Principal.draw false;
      let (cx, cy) = Graphics.current_point () in
      Graphics.moveto (x - w / 2) (y - h / 2 + 1);
      Graphics.draw_string s;
      Graphics.moveto cx cy;
      Principal.draw true)

(* Afficher l'élément c au centre de la case (i, j) *)
let afficher i j c =
  origine (); translater (2 * i - 1, 2 * j - 1);
  ecrireCentre (string_of_int c)

let () =
  let n = lireOrdre () in
  (* Dessiner la matrice dans la fenêtre du robot *)
  lg 20.; cacherRobot ();
  for k = 0 to n do
    origine (); translater (2 * k, 0); pn (); avf (2 * n);
    origine (); translater (0, 2 * k); pe (); avf (2 * n)
  done;
  (* Remplir le carré magique *)
  (* Ligne i et colonne j de la case à remplir *)
  let i = ref ((n + 1) / 2) in
  let j = ref n in
  afficher !i !j 1;
  for c = 2 to n * n do
    if c mod n <> 1 then begin
      i := !i mod n + 1;
      j := !j mod n + 1
    end else
      j := !j - 1;
    afficher !i !j c
  done;
  st ()
