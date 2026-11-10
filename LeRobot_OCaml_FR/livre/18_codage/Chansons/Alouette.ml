open LibRobot

(* Jouer "Alouette" *)

let melodie () =
  metronome moderato; (* mesure 4/4 *)
  nuance mezza_voce;
  (* Refrain *)
  note sol noire_pointee; note la croche; note si noire;
  note si noire;
  note la croche; note sol croche; note la croche;
  note si croche; note sol noire; note re noire;
  note sol noire_pointee; note la croche; note si noire;
  note si noire;
  note la croche; note sol croche; note la croche;
  note si croche; note sol noire; silence soupir;
  (* Couplet *)
  note sol croche; note sol croche; note sol croche;
  note sol croche; note sol croche; note si croche;
  note (octave + re) noire;
  note (octave + re) croche; note (octave + mi) croche;
  note (octave + re) croche; note (octave + d0) croche;
  note si croche; note la croche; note sol noire;
  for i = 1 to 2 do
    note (octave + re) croche; note (octave + re) croche;
    note (octave + re) noire; note re croche;
    note re croche; note re noire
  done;
  note (octave + re) ronde

let () =
  melodie ()
