open LibRobot

(* Jouer "En passant par la Lorraine" *)

let melodie () =
  metronome 168; (* mesure 6/8 *)
  nuance mezza_voce;
  for i = 1 to 2 do
    note fa noire; note la croche;
    note (octave + d0) noire; note (octave + d0) croche;
    note (octave + d0) noire; note (octave + d0) croche;
    note (octave + re) noire; note (si + bemol) croche;
    note (octave + d0) noire; note (octave + d0) croche;
    note (octave + re) noire; note (octave + re) croche;
    note (octave + d0) (noire_pointee +. noire);
    silence demi_soupir
  done;
  note (octave + d0) noire; note (octave + d0) croche;
  note (octave + fa) noire; note (octave + d0) croche;
  note (octave + d0) noire; note (si + bemol) croche;
  note la noire; note sol croche; note la noire;
  note la croche;
  note la noire; note (octave + d0) croche;
  note (octave + d0) noire; note (si + bemol) croche;
  note la noire; note sol croche; note fa noire;
  note la croche;
  note (octave + d0) (noire_pointee +. noire);
  silence demi_soupir;
  note (octave + re) noire; note (si + bemol) croche;
  note sol noire; note mi croche;
  note fa (blanche_pointee +. noire); silence demi_soupir

let () =
  melodie ()
