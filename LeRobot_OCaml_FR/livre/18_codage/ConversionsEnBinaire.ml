open LibRobot

(* Conversions entre numérations binaire et décimale
   (corrigé des exercices du chapitre 18) *)

(* Écriture de n en base deux *)
let rec decimalEnBinaire n =
  if n < 0 then
    "-" ^ decimalEnBinaire (- n)
  else if n < 2 then
    string_of_int n
  else
    decimalEnBinaire (n / 2) ^ decimalEnBinaire (n mod 2)

(* Écriture de n (0 <= n < 256) en base deux sur un
   octet, suivie d'un blanc *)
let decimalEnOctet n =
  if n < 0 || n >= 256 then begin
    message "Nombre hors de [0, 255] dans decimalEnOctet";
    st ()
  end;
  let b = decimalEnBinaire n in
  String.make (8 - String.length b) '0' ^ b ^ " "

(* Code ASCII du caractère c, en binaire *)
let octet c =
  decimalEnOctet (Char.code c)

let () =
  lg 7.;
  message "Ecriture de  127  en binaire";
  ecrire (decimalEnBinaire 127);
  eb (); ag (); marquerUnePause ();
  cf blanc;
  message ("Ecriture de  " ^ decimalEnBinaire 13653
           ^ "  en décimal");
  ecrire (string_of_int 13653);
  eb (); ag (); marquerUnePause ();
  cf blanc;
  message (octet 'D' ^ octet 'e' ^ octet 's' ^ octet 'c'
           ^ octet 'a' ^ octet 'r' ^ octet 't' ^ octet 'e'
           ^ octet 's');
  ecrire "Descartes";
  eb (); ag (); marquerUnePause ()
