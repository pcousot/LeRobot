open LibRobot

(* Définition des commandes ag, ad, eb et eh *)

(* Définition de la commande ag *)

let auBordOuest () =
  lc (); pw ();
  while not (tb ()) do
    av ()
  done

let alOuest () =
  if tn () then begin auBordOuest (); pn () end
  else if tne () then begin auBordOuest (); pne () end
  else if te () then begin auBordOuest (); pe () end
  else if tse () then begin auBordOuest (); pse () end
  else if ts () then begin auBordOuest (); ps () end
  else if tsw () then begin auBordOuest (); psw () end
  else if tw () then auBordOuest ()
  else begin auBordOuest (); pnw () end

let ag () =
  if valBc () then begin alOuest (); bc () end
  else alOuest ()

(* Définition de la commande ad *)

let auBordEst () =
  lc (); pe ();
  while not (tb ()) do
    av ()
  done

let alEst () =
  if tn () then begin auBordEst (); pn () end
  else if tne () then begin auBordEst (); pne () end
  else if te () then auBordEst ()
  else if tse () then begin auBordEst (); pse () end
  else if ts () then begin auBordEst (); ps () end
  else if tsw () then begin auBordEst (); psw () end
  else if tw () then begin auBordEst (); pw () end
  else begin auBordEst (); pnw () end

let ad () =
  if valBc () then begin alEst (); bc () end
  else alEst ()

(* Définition de la commande eb *)

let auBordSud () =
  lc (); ps ();
  while not (tb ()) do
    av ()
  done

let enBas () =
  if tn () then begin auBordSud (); pn () end
  else if tne () then begin auBordSud (); pne () end
  else if te () then begin auBordSud (); pe () end
  else if tse () then begin auBordSud (); pse () end
  else if ts () then auBordSud ()
  else if tsw () then begin auBordSud (); psw () end
  else if tw () then begin auBordSud (); pw () end
  else begin auBordSud (); pnw () end

let eb () =
  if valBc () then begin enBas (); bc () end
  else enBas ()

(* Définition de la commande eh *)

let auBordNord () =
  lc (); pn ();
  while not (tb ()) do
    av ()
  done

let enHaut () =
  if tn () then auBordNord ()
  else if tne () then begin auBordNord (); pne () end
  else if te () then begin auBordNord (); pe () end
  else if tse () then begin auBordNord (); pse () end
  else if ts () then begin auBordNord (); ps () end
  else if tsw () then begin auBordNord (); psw () end
  else if tw () then begin auBordNord (); pw () end
  else begin auBordNord (); pnw () end

let eh () =
  if valBc () then begin enHaut (); bc () end
  else enHaut ()

(* Dessiner un trait de longueur 3 puis reprendre la
   position initiale *)
let trait () =
  av (); av (); av ();
  pdt (); av (); av (); av (); pdt ()

let () =
  (* Faisceau de 5 traits au milieu du bord gauche *)
  ag (); trait (); phtd (); trait (); phtd (); trait ();
  phtd (); trait (); phtd (); trait (); pdt ();
  (* Faisceau de 5 traits au milieu du bord droit *)
  ad (); trait (); phtg (); trait (); phtg (); trait ();
  phtg (); trait (); phtg (); trait (); pdt ();
  (* Faisceau de 5 traits au milieu du bord supérieur *)
  ce (); eh (); pqtd (); trait (); phtd (); trait ();
  phtd (); trait (); phtd (); trait (); phtd ();
  trait (); pqtd ();
  (* Faisceau de 5 traits au milieu du bord inférieur *)
  eb (); pqtd (); trait (); phtg (); trait (); phtg ();
  trait (); phtg (); trait (); phtg (); trait ();
  pqtd ();
  (* Faisceau de 3 traits au coin supérieur gauche *)
  eh (); ag (); pqtd (); trait (); phtd (); trait ();
  phtd (); trait (); pdt ();
  (* Faisceau de 3 traits au coin supérieur droit *)
  ad (); pqtg (); trait (); phtg (); trait (); phtg ();
  trait (); pdt ();
  (* Faisceau de 3 traits au coin inférieur gauche *)
  eb (); ag (); trait (); phtd (); trait (); phtd ();
  trait (); pqtg ();
  (* Faisceau de 3 traits au coin inférieur droit *)
  ad (); trait (); phtg (); trait (); phtg (); trait ();
  pqtd ();
  (* Faisceau de 8 traits au centre du cadre *)
  ce (); trait (); phtd (); trait (); phtd (); trait ();
  phtd (); trait (); phtd (); trait (); phtd (); trait ();
  phtd (); trait (); phtd (); trait (); phtd (); st ()
