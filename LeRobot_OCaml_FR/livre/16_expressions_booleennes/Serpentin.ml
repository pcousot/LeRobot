open LibRobot

(* Dessiner un serpentin *)

let dessinSerpentin l =
  for i = 1 to 2 * l do
    if i <= l then
      lg (float_of_int i)
    else
      lg (float_of_int (2 * l + 1 - i));
    if i mod 2 = 1 then begin
      (* Demi-cercle supérieur *)
      vd (); vd ()
    end else begin
      (* Demi-cercle inférieur *)
      vg (); vg ()
    end
  done

let () =
  ag (); dessinSerpentin 13; st ()
