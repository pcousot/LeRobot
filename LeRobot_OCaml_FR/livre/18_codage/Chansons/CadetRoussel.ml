open LibRobot

(* Jouer "Cadet Rousselle" *)

let melodie () =
  for i = 1 to 2 do
    metronome allegro; (* mesure 6 / 8 *)
    nuance mezza_voce;
    note mi croche; note (fa + diese) croche;
    note (sol + diese) croche;
    note la noire; note la croche; note la noire;
    note (d0 + octave + diese) croche;
    note la noire_pointee; note si croche;
    note si croche; note si croche;
    note si noire; note la croche;
    note (sol + diese) noire;
    note (fa + diese) croche;
    note mi noire_pointee
  done;
  for i = 1 to 2 do
    note si croche; note si croche; note si croche;
    note si noire; note (octave + d0 + diese) croche;
    note (octave + re) noire; note (mi + octave) croche;
    note (octave + re) noire;
    note (octave + d0 + diese) croche
  done;
  (* Refrain *)
  for i = 1 to 2 do
    note la noire_pointee;
    note la noire_pointee; note la croche;
    note (sol + diese) croche; note (fa + diese) croche;
    note mi noire_pointee; note la croche;
    note (sol + diese) croche;
    note la croche;
    note si noire; note si croche; note la croche;
    note (sol + diese) croche;
    note la noire; silence demi_soupir
  done

let () =
  melodie ()
