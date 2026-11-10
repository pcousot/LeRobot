open LibRobot

(* Écrire un nombre en base 3 *)

let rec decimalEnTernaire n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnTernaire (-n)
  end else if n = 0 then begin
    ecrire "0"; translater (1, 0)
  end else if n = 1 then begin
    ecrire "1"; translater (1, 0)
  end else if n = 2 then begin
    ecrire "2"; translater (1, 0)
  end else begin
    decimalEnTernaire (n / 3);
    decimalEnTernaire (n mod 3)
  end

let () =
  lg 7.; decimalEnTernaire 123456789; st ()
