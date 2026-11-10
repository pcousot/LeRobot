open LibRobot

(* Jouer "Chevaliers de la Table ronde" *)

let melodie () =
  metronome moderato; (* mesure 3/4 *)
  nuance forte;
  for i = 1 to 2 do
    note re croche; note sol croche;
    note sol noire; note sol croche; note si croche;
    note si croche; note (octave + re) croche;
    note (octave + re) noire; note si noire;
    note si croche;
    note si croche;
    note la noire; note re croche; note la croche;
    note la croche; note la croche;
    note sol noire; silence soupir
  done;
  for i = 1 to 2 do
    note (octave + re) croche; note (octave + re) croche;
    note (octave + mi) noire; note (octave + d0) croche;
    note (octave + d0) croche;
    note (octave + d0) noire; note (octave + mi) croche;
    note (octave + mi) croche;
    note (octave + re) noire; note si croche;
    note si croche;
    note si noire; note (octave + re) croche;
    note (octave + re) croche;
    note (octave + d0) noire; note la croche;
    note (octave + re) croche; note (octave + re) croche;
    note (octave + re) croche;
    if i = 1 then note si noire
    else note sol noire;
    silence soupir
  done

let () =
  melodie ()
