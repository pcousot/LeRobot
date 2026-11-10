open LibRobot

(* Dessiner des pavés récursifs *)

let rec pave n =
  if n = 0 then
    (* Dessiner un carré de côté 0 *)
    dp ()
  else begin
    (* Dessiner un carré de côté n *)
    avf n; pqtd (); avf n; pqtd (); avf n; pqtd ();
    avf n; pqtd ();
    (* Paver l'intérieur *)
    pave (n - 1)
  end

let () =
  eb (); ag (); pave 10; st ()
