(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(**                                                     **)
(*********************************************************)

open LibRobot

let couleurDuFond = blanc
let couleurDesChiffres = noir

let cfr c =
  (* Dessiner le chiffre C, le robot partant en bas à gauche et terminant *)
  (* dans la même position *)
  begin
    bc (); pn ();
    begin match c with
      | 0 -> avf 2; pqtd (); av (); pqtd (); avf 2; pqtd (); av (); pqtd ()
      | 1 ->
        lc (); pqtd (); av (); pqtg (); avf 2; pdt (); bc (); avf 2; lc (); pqtd (); av ();
        pqtd ()
      | 2 ->
        lc (); avf 2; pqtd (); bc (); av (); pqtd (); av (); pqtd (); av (); pqtg (); av ();
        pqtg (); av (); pdt (); av (); pqtd ()
      | 3 ->
        lc (); avf 2; pqtd (); bc (); av (); pqtd (); av (); pqtd (); av (); pdt (); av ();
        pqtd (); av (); pqtd (); av (); pqtd ()
      | 4 ->
        lc (); avf 2; pdt (); bc (); av (); pqtg (); av (); pqtg (); av (); pdt (); avf 2; lc ();
        pqtd (); av (); pqtd ()
      | 5 ->
        pqtd (); av (); pqtg (); av (); pqtg (); av (); pqtd (); av (); pqtd (); av (); lc ();
        pqtd (); avf 2; pqtd (); av (); pqtd ()
      | 6 ->
        av (); pqtd (); av (); pqtd (); av (); pqtd (); av (); pqtd (); avf 2; pqtd (); av ();
        lc (); pqtd (); avf 2; pqtd (); av (); pqtd ()
      | 7 ->
        lc (); avf 2; pqtd (); bc (); av (); pqtd (); avf 2; pqtd (); lc (); av (); pqtd ()
      | 8 ->
        av (); pqtd (); av (); pdt (); av (); pqtd (); av (); pqtd (); av (); pqtd (); avf 2;
        pqtd (); av (); pqtd ()
      | 9 ->
        lc (); av (); bc (); pqtd (); av (); pdt (); av (); pqtd (); av (); pqtd (); av ();
        pqtd (); avf 2; pqtd (); av (); pqtd ()
      | _ -> ()
    end
  end

let esp () =
  (* Laisser un espace entre deux nombres *)
  begin
    lc (); pe (); avf 2
  end

let moins () =
  (* Dessiner un signe - *)
  begin
    pn (); lc (); av (); pqtd (); bc (); av (); lc (); pqtd (); av (); pqtd (); av (); pqtd ()
  end

let rec nbr n =
  (* Dessiner le nombre N (en supposant -32767 <= N <= 32767) *)
  if 0 <= n && n <= 9 then cfr n
  else
    if n < 0 then begin
      moins (); esp (); nbr (- n)
    end else begin
      nbr (n / 10); esp (); nbr (n mod 10)
    end

let deuxPoints () =
  begin
    lc (); dp (); pn (); av (); dp (); pdt (); av ()
  end

let ecrireDate j mo a =
  begin
    (* Ecrire le jour *)
    ce (); ag (); translater (0, 2); nbr j;
    (* Ecrire - *)
    ce (); ag (); translater (4, 2); moins ();
    (* Ecrire le mois *)
    ce (); ag (); translater (6, 2); nbr mo;
    (* Ecrire - *)
    ce (); ag (); translater (10, 2); moins ();
    (* Ecrire l'année *)
    ce (); ag (); translater (12, 2); nbr a
  end

let ecrireSeconde s =
  begin
    (* Ecrire la seconde *)
    ce (); ag (); translater (10, -2); nbr s
  end

let ecrireHeure h mi s =
  begin
    (* Ecrire l'heure *)
    ce (); ag (); translater (0, -2); nbr h;
    (* Ecrire : *)
    ce (); ag (); translater (4, -2); deuxPoints ();
    (* Ecrire la minute *)
    ce (); ag (); translater (5, -2); nbr mi;
    (* Ecrire : *)
    ce (); ag (); translater (9, -2); deuxPoints ();
    (* Ecrire la seconde *)
    ecrireSeconde s
  end

let initialisation () =
  begin
    cf couleurDuFond; cc couleurDesChiffres;
    cacherRobot ();
    message "Arrêter la montre en tapant sur l'une des touches 'esc', '§' ou '#'.";
    lg 24.; ec 6
  end

let aJ = ref 0
let aMo = ref 0
let aA = ref 0
let aH = ref 0
let aMi = ref 0
let aS = ref 0
let j = ref 0
let mo = ref 0
let a = ref 0
let h = ref 0
let mi = ref 0
let s = ref 0

let () =
  date aA aMo aJ; heure aH aMi aS;
  initialisation (); ecrireDate !aA !aMo !aJ; ecrireHeure !aH !aMi !aS;
  while true do
    while begin (* repeat ... until *)
      date a mo j; heure h mi s;
      not (!s <> !aS)
    end do () done;
    if !aMi = !mi then begin
      cc couleurDuFond; ecrireSeconde !aS; (* Effacer l'ancienne seconde *)
      cc couleurDesChiffres; ecrireSeconde !s (* Ecrire la nouvelle seconde *)
    end else begin
      (* Toutes les minutes, effacer l'écran et réécrire toute la date *)
      initialisation (); ecrireDate !a !mo !j; ecrireHeure !h !mi !s
    end;
    aA := !a; aMo := !mo; aJ := !j; aH := !h; aMi := !mi; aS := !s
  done;
  st ()
