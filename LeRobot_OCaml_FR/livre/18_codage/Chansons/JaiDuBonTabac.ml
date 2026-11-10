open LibRobot

(* Jouer "J'ai du bon tabac" *)

let debutPremierePartie () =
  note re croche; note mi croche;
  note (fa + diese) croche;
  note re croche;
  note mi noire; note mi croche; note (fa + diese) croche;
  note sol noire

let premierePartie () =
  debutPremierePartie (); note sol noire;
  note (fa + diese) noire; note (fa + diese) noire;
  debutPremierePartie (); note la noire;
  note re blanche

let deuxiemePartie () =
  for i = 1 to 2 do
    note la noire; note la croche; note sol croche;
    note (fa + diese) noire; note mi croche;
    note (fa + diese) croche;
    note sol noire; note la noire;
    note mi blanche
  done

let melodie () =
  metronome moderato; (* mesure 2/4 *)
  nuance mezza_voce;
  premierePartie (); deuxiemePartie (); premierePartie ()

let () =
  melodie ()
