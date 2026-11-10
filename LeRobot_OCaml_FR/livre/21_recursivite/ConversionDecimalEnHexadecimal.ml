open LibRobot

(* Écrire un nombre en base 16 *)

let rec decimalEnHexadecimal n =
  if n < 0 then begin
    ecrire "-"; translater (1, 0);
    decimalEnHexadecimal (-n)
  end else if n >= 16 then begin
    decimalEnHexadecimal (n / 16);
    decimalEnHexadecimal (n mod 16)
  end else if n = 15 then begin
    ecrire "F"; translater (1, 0)
  end else if n = 14 then begin
    ecrire "E"; translater (1, 0)
  end else if n = 13 then begin
    ecrire "D"; translater (1, 0)
  end else if n = 12 then begin
    ecrire "C"; translater (1, 0)
  end else if n = 11 then begin
    ecrire "B"; translater (1, 0)
  end else if n = 10 then begin
    ecrire "A"; translater (1, 0)
  end else begin
    ecrire (entierEnChaine n); translater (1, 0)
  end

let () =
  lg 7.; decimalEnHexadecimal 123456789; st ()
