open LibRobot

(* Jouer "When the saints go marching in" *)

(* Chanson populaire américaine *)
let melodie () =
  metronome prestissimo; (* mesure 4/4 *)
  nuance mezza_voce;
  for i = 1 to 2 do
    note (octave + d0) noire; note (octave + mi) noire;
    note (octave + fa) noire;
    note (octave + sol) (ronde +. noire)
  done;
  for i = 1 to 2 do
    note (octave + d0) noire; note (octave + mi) noire;
    note (octave + fa) noire;
    note (octave + sol) blanche;
    note (octave + mi) blanche;
    note (octave + d0) blanche;
    note (octave + mi) blanche;
    note (octave + re) (noire +. float_of_int re);
    silence soupir; note (octave + mi) noire;
    note (octave + re) noire;
    note (octave + d0) blanche_pointee;
    note (octave + d0) noire;
    note (octave + mi) blanche; note (octave + sol) noire;
    note (octave + sol) noire;
    note (octave + sol) noire;
    note (octave + fa) (blanche_pointee +. blanche);
    note (octave + mi) noire; note (octave + fa) noire;
    note (octave + sol) blanche;
    note (octave + mi) blanche;
    note (octave + d0) blanche;
    note (octave + re) blanche;
    note (octave + d0) (ronde +. noire);
    for j = 1 to 2 do
      note (octave + d0) noire;
      note (octave + mi) croche_pointee;
      note (octave + d0) double_croche;
      note (octave + mi) croche_pointee;
      note (octave + fa) double_croche;
      note (octave + sol) noire; silence soupir;
      silence demi_pause;
      silence soupir
    done;
    note (octave + d0) noire;
    note (octave + mi) croche_pointee;
    note (octave + d0) double_croche;
    note (octave + mi) croche_pointee;
    note (octave + fa) double_croche;
    note (octave + sol) noire; note (octave + mi) blanche;
    note la noire;
    note (octave + d0) noire; note (octave + mi) blanche;
    note (octave + mi + bemol) noire;
    note (octave + re) ronde;
    silence demi_soupir_pointe;
    note (octave + re + diese) double_croche;
    note (octave + mi) croche_pointee;
    note (octave + sol) double_croche;
    note (octave + mi) noire;
    note (octave + re + becarre) noire;
    note (octave + d0) (blanche +. noire_pointee);
    note si double_croche; note (octave + d0) noire;
    note (octave + mi) blanche;
    note (octave + sol) noire_pointee;
    note (octave + la) croche;
    note (octave + sol) noire;
    note (octave + fa) blanche_pointee;
    note (2 * octave + d0) noire; silence soupir;
    note (octave + mi) noire; note (octave + fa) noire;
    note (octave + sol) blanche;
    note (octave + mi) croche_pointee;
    note (octave + re + diese) double_croche;
    note (octave + d0) blanche;
    note (octave + re) blanche;
    note (octave + d0) (ronde +. noire); silence soupir;
    silence demi_pause
  done

let () =
  melodie ()
