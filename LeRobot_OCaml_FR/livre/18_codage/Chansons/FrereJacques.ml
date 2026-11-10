open LibRobot

(* Jouer "Frère Jacques" *)

let melodie () =
  metronome andante; (* mesure 4/4 *)
  nuance mezza_voce;
  for i = 1 to 2 do
    note fa noire;
    note sol noire;
    note la noire;
    note fa noire
  done;
  for i = 1 to 2 do
    note la noire;
    note (si + bemol) noire;
    note (octave + d0) blanche
  done;
  for i = 1 to 2 do
    note (octave + d0) croche_pointee;
    note (octave + re) double_croche;
    note (octave + d0) croche;
    note (si + bemol) croche;
    note la noire;
    note fa noire
  done;
  for i = 1 to 2 do
    note fa noire;
    note d0 noire;
    note fa blanche
  done

let () =
  melodie ()
