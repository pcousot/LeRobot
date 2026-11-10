open LibRobot

(* Lire un entier n et écrire sa factorielle n! *)

let nmin = 0
let nmax = 20

(* Lire au clavier la valeur de n, en recommençant
   tant que l'on n'a pas nmin <= n <= nmax *)
let rec lireN () =
  write ["n = "];
  let n = lireEntier () in
  if nmin <= n && n <= nmax then n
  else begin
    writeln ["n doit être compris entre ";
             string_of_int nmin; " et ";
             string_of_int nmax; " ! Recommencer."];
    lireN ()
  end

let () =
  let n = lireN () in
  (* Calculer f = n! *)
  let f = ref 1 in
  for i = 1 to n do
    f := !f * i
  done;
  (* Écrire f *)
  writeln ["n! = "; string_of_int !f];
  readln ()
