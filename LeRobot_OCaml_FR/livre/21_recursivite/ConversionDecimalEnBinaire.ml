open LibRobot

(* Écrire un nombre en base 2 *)

let rec decimalEnBinaire n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnBinaire (-n)
  end else if n = 0 then begin
    ecrire "0"; translater (1, 0)
  end else if n = 1 then begin
    ecrire "1"; translater (1, 0)
  end else begin   (* n >= 2 *)
    decimalEnBinaire (n / 2);
    decimalEnBinaire (n mod 2)
  end

let () =
  lg 7.; decimalEnBinaire 123456789; st ()
