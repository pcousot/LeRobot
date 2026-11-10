open LibRobot

(* Jouer "Sur le pont d'Avignon" *)

let refrain () =
  note sol croche; note sol croche;
  note sol noire; note la croche; note la croche;
  note la noire; note si croche;
  note (octave + ut) croche;
  note (octave + re) croche; note sol croche;
  note (fa + diese) croche; note sol croche;
  note la croche; note re croche; note sol croche;
  note sol croche;
  note sol noire; note la croche; note la croche;
  note la noire; note si croche;
  note (octave + ut) croche;
  note (octave + re) croche; note sol croche;
  note la croche;
  note (fa + diese) croche;
  note sol noire; silence soupir

let couplet () =
  note sol double_croche; note sol double_croche;
  note sol double_croche; note sol double_croche;
  note la blanche;
  note sol croche; silence demi_soupir;
  note sol double_croche;
  note sol double_croche; note sol double_croche;
  note sol double_croche;
  note la blanche;
  note sol noire; silence soupir

let melodie () =
  metronome 76; (* mesure 2/4 *)
  nuance mezza_voce;
  for i = 1 to 4 do refrain (); couplet () done;
  refrain ()

let () =
  melodie ()
