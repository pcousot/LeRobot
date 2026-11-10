open LibRobot

(* Écrire un nombre en base 8 *)

let rec decimalEnOctal n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnOctal (-n)
  end else if n >= 8 then begin
    decimalEnOctal (n / 8);
    decimalEnOctal (n mod 8)
  end else begin
    ecrire (entierEnChaine n); translater (1, 0)
  end

let () =
  lg 7.; decimalEnOctal 123456789; st ()
