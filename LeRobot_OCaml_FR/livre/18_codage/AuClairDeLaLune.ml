open LibRobot

(* Au clair de la lune (chanson attribuée à
   Jean-Baptiste Lulli) *)

let strophe () =
  metronome moderato; (* mesure 4 / 4 *)
  nuance piano;
  for i = 1 to 2 do
    note sol noire; note sol noire; (* Au clair/Prê-te *)
    note sol noire; note la noire; (* de la/moi ta *)
    note si blanche; note la blanche; (* lu-ne/plu-me *)
    note sol noire; note si noire; (* Mon a-/Pour é- *)
    note la noire;
    note la noire; (* -mi Pier-/-crire un *)
    note sol ronde (* -rot./mot. *)
  done;
  note la noire; note la noire; (* Ma chan- *)
  note la noire; note la noire; (* -delle est *)
  note mi blanche; note mi blanche; (* mor-te. *)
  note la noire; note sol noire; (* Je n'ai *)
  note (fa + diese) noire; note mi noire; (* plus de *)
  note re ronde; (* feu. *)
  note sol noire; note sol noire; (* Ou-vre *)
  note sol noire; note la noire; (* moi ta *)
  note si blanche; note la blanche; (* por-te, *)
  note sol noire; note si noire; (* Pour l'a- *)
  note la noire; note la noire; (* -mour de *)
  note sol ronde; (* Dieu. *)
  silence pause

let chanson () =
  for j = 1 to 3 do
    strophe ()
  done

let () =
  chanson ()
