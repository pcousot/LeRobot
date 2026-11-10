open LibRobot

(* Jouer "À la claire fontaine" *)

let melodie () =
  metronome adagio; (* mesure 2/4 *)
  nuance mezza_voce;
  note sol noire; note sol croche; note si croche;
  note si croche; note la croche; note si croche;
  note si croche;
  note sol noire; note sol croche; note si croche;
  note si croche; note la croche; note si noire;
  note si noire; note si croche; note la croche;
  note sol croche; note si croche;
  note (octave + re) croche;
  note si croche;
  note (octave + re) noire; note (octave + re) croche;
  note si croche;
  note sol croche; note si croche; note la noire;
  (* Refrain *)
  note sol noire; note sol croche; note si croche;
  note si croche; note la double_croche;
  note sol double_croche;
  note si croche; note sol croche;
  note si noire; note si croche; note la double_croche;
  note sol double_croche;
  note si croche; note la croche; note sol noire

let () =
  melodie ()
