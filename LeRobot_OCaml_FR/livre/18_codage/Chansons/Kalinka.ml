open LibRobot

(* Jouer "Kalinka" *)

let melodie () =
  (* russe *)
  begin
    metronome 120;
    note la blanche; (* Ka- *)
    note sol noire; (* -lin- *)
    note mi croche; (* -ka, *)
    note fa croche; (* ka- *)
    note sol noire; (* -lin *)
    note mi croche; (* -ka, *)
    note fa croche; (* Ka- *)
    note sol noire; (* -lin- *)
    note fa croche; (* -ka *)
    note mi croche; (* ma- *)
    note re noire; (* -ya *)
    note la croche; (* fsa- *)
    note la croche; (* -dou *)
    note sol noire_pointee; (* ya- *)
    note fa double_croche; (* -ga- *)
    note mi croche; (* da *)
    note fa croche; (* Ma- *)
    note sol noire; (* -lin- *)
    note mi croche; (* -ka, *)
    note fa croche; (* ma- *)
    note sol noire; (* -lin- *)
    note fa croche; (* -ka *)
    note mi croche; (* ma- *)
    note re noire; (* -ya *)
    note (octave + re) noire; (* Ah *)
    note (octave + d0) ronde; (* -a ! *)
    for i = 1 to 2 do
      note la noire; (* Kra- / Dou- *)
      note (octave + d0) noire; (* -a- / cha *)
      note (si + bemol) noire; (* -ça / dié- *)
      note la croche; (* -a-/-é- *)
      note sol croche; (* -a-/-é- *)
      note fa blanche; (* -vit-/vi- *)
      note d0 blanche (* -sa/-tsa *)
    done;
    note re blanche; (* Pa- *)
    note re noire; (* -a- *)
    note mi noire; (* -liou- *)
    note sol noire; (* -bi- *)
    note fa noire; (* -i *)
    note mi noire; (* jé *)
    note re noire; (* -é *)
    note (octave + d0) blanche; (* ty *)
    note (si + bemol) noire_en_triolet; (* mi- *)
    note (octave + d0) noire_en_triolet; (* -i- *)
    note (si + bemol) noire_en_triolet; (* -i *)
    note la blanche (* nia ! *)
  end

let () =
  melodie ()
