open LibRobot

(* Pavage de Al-Karagi expliqué : les équerres paires
   sont peintes et le bord est gradué (figure du livre) *)

let nmax = 10

(* Graduer les quatre côtés du grand carré *)
let marquerLeBord n =
  let l = valLgX () in
  let m =
    if n mod 2 = 1 then (n + 1) / 2 * n
    else (n + 1) * (n / 2) in
  for i = 1 to 4 do
    for j = 1 to m do
      lg 2.; pqtd (); av (); pdt (); av (); pqtd ();
      lg l; av ()
    done;
    lg 2.; pqtd (); av (); pdt (); av (); pqtd ();
    lg l; pqtg ()
  done

(* Numéroter les équerres de 1 à n *)
let numeroter n =
  policeTexte courier; tailleTexte 9;
  for k = 1 to n do
    for l = 1 to k / 2 do av () done;
    translater (0, -4); ecrire (entierEnChaine k);
    translater (0, 4);
    for l = 1 to k - k / 2 do av () done
  done

let () =
  eb (); ag (); lc (); av (); pqtd (); av (); pqtg ();
  bc (); lg 3.;
  for i = 1 to nmax do
    (* Dessiner un carré de taille de côté
       1 + 2 + ... + i *)
    for j = 1 to 4 do
      for k = 1 to i do
        for l = 1 to k do av () done
      done;
      pqtd ()
    done
  done;
  (* Peindre *)
  translater (1, 1);
  for i = 2 to nmax do
    avf i; pqtd (); avf i; pqtd ();
    avf i; pqtd (); avf i; pqtd ();
    if i mod 2 = 0 then begin
      phtg (); cc jaune; peindre (); pdt (); peindre ();
      cc violet; pqtd (); peindre (); p3htd (); cc noir
    end;
    translater (i, i)
  done;
  (* Retour en bas à gauche *)
  for i = 1 to nmax do translater (-i, -i) done;
  pqtd (); marquerLeBord nmax; numeroter nmax; st ()
