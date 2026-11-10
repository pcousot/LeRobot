open LibRobot

(* Jouer "Aloha 'Oe" *)

(* Chant traditionel Hawaïen *)
let melodie () =
  metronome prestissimo; (* mesure 4/4 *)
  nuance mezza_voce;
  message "See"; note sol noire;
  message "the"; note (octave + d0) noire;
  for i = 1 to 2 do
    message "dark"; note (octave + mi) noire;
    message "clouds"; note (octave + mi) blanche;
    message "are"; note (octave + re) noire;
    message "low";
    note (octave + d0) (noire +. croche_pointee);
    message " up-"; note si double_croche;
    message "-on"; note (octave + d0) noire;
    message "wau-"; note la noire;
    message "-kia"; note sol (ronde +. noire);
    silence soupir;
    message "A"; note (octave + mi) blanche;
    message "sign"; note (octave + re) noire;
    message "that"; note (octave + re) blanche;
    message "we"; note (octave + d0 + diese) noire;
    message "two"; note (octave + re) blanche;
    message "must"; note (octave + fa) noire;
    message "be"; note (octave + mi) noire;
    message "parted"; note (octave + re) ronde;
    silence demi_pause;
    message "I"; note sol noire;
    message "can't"; note (octave + d0) noire;
    message "hi-"; note (octave + mi) noire;
    message "-de"; note (octave + mi) blanche;
    message "thee"; note (octave + re) noire;
    message "in";
    note (octave + d0) (noire +. croche_pointee);
    message "my"; note si double_croche;
    message "arms"; note (octave + d0) noire;
    message "and"; note la noire;
    message "keep thee"; note sol (ronde +. noire);
    silence soupir;
    message "I"; note (octave + d0) noire;
    message "can"; note si noire;
    message "only"; note la blanche;
    message "hide"; note (octave + re) noire;
    message "that"; note (octave + d0) noire;
    message "I'm"; note si blanche;
    message "bro-"; note (octave + mi) noire;
    message "-ken"; note (octave + re) noire;
    message "heart'ed"; note (octave + d0) ronde; (*  *)
    silence demi_pause; silence soupir;
    message "fare-"; note sol noire;
    message "-well"; note la blanche;
    message "to"; note (octave + d0) blanche;
    message "thee,"; note (octave + fa) blanche_pointee;
    message "fare-"; note la noire;
    message "-well"; note sol blanche;
    message "to"; note (octave + d0) blanche;
    message "thee,"; note (octave + mi) blanche_pointee;
    message "I shall"; note (octave + d0) noire;
    message "al-"; note si (noire +. croche_pointee);
    message "-ways"; note la double_croche;
    message "wait"; note si noire;
    message "for"; note (octave + d0) noire;
    message "thee"; note (octave + re) noire;
    message "a-"; note (octave + re) noire;
    message "-mong"; note (octave + fa) noire;
    message "the"; note (octave + fa) noire;
    message "flo-"; note (octave + mi) ronde;
    message "-wers"; note (octave + d0) blanche_pointee;
    message "one"; note sol noire;
    message "fond"; note la blanche;
    message "em-"; note (octave + d0) blanche;
    message " -brace,";
    note (octave + fa) blanche_pointee;
    message "One"; note la noire;
    message "kiss"; note sol blanche;
    message "and"; note (octave + d0) blanche;
    message "then,"; note (octave + mi) blanche_pointee;
    message "fare-"; note (octave + d0) noire;
    message "-well"; note si (noire +. croche_pointee);
    message "un-"; note la double_croche;
    message "-til"; note si noire;
    message "we"; note (octave + d0) noire;
    message "me-"; note (octave + mi) noire;
    message "-et"; note (octave + re) blanche;
    message "a-"; note si noire;
    message "-gain"; note (octave + d0) (ronde +. noire);
    if i = 1 then begin
      silence soupir;
      message "See"; note sol noire;
      message "the"; note (octave + d0) noire
    end else begin
      message ""; silence soupir_pointe
    end
  done

let () =
  melodie ()
