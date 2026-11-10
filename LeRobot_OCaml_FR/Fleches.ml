(* Les touches fleches pour le robot : voir fleches_stubs.c *)
open Graphics

external ouvrir : string -> bool = "lerobot_fleches_ouvrir"
external lire : unit -> int * int * int = "lerobot_fleches_lire"

let gauche = '\028' and droite = '\029' and haut = '\030' and bas = '\031'

let deplacement c =
  if c = gauche then (-1, 0) else if c = droite then (1, 0)
  else if c = haut then (0, 1) else if c = bas then (0, -1) else (0, 0)

(* None : pas encore essaye ; Some false : impossible (sans fleches) *)
let pret = ref None

let disponible () =
  match !pret with
  | Some b -> b
  | None ->
    let b = try ouvrir (GraphicsX11.window_id ()) with _ -> false in
    pret := Some b; b

let derniere = ref (-1, -1)          (* derniere position de la souris *)
let bouton = ref false               (* bouton vu enfonce *)

(* comme les evenements de X, on ne voit la souris que dans la fenetre *)
let dans_la_fenetre (x, y) = x >= 0 && y >= 0 && x < size_x () && y < size_y ()

let etat x y b k c =
  { mouse_x = x; mouse_y = y; button = b; keypressed = k; key = c }

(* Sans les fleches : l'attente d'origine (bloquante). Avec : on regarde
   toutes les 10 ms les fleches, le clavier et la souris. *)
let rec attendre () =
  let premiere_fois = !pret = None in
  if not (disponible ()) then
    wait_next_event [Mouse_motion; Key_pressed; Button_down]
  else begin
    if premiere_fois then begin
      (* la position de depart de la souris n'est pas un mouvement *)
      derniere := mouse_pos (); bouton := button_down ()
    end;
    let (genre, xr, yr) = lire () in
    if genre >= 1 && genre <= 4 then begin
      let (x, y) = mouse_pos () in
      etat x y (button_down ()) true (Char.chr (27 + genre))
    end
    else if genre = 5 && not !bouton then begin
      (* clic trop bref pour etre vu par l'etat de la souris *)
      let y = size_y () - 1 - yr in
      derniere := (xr, y);
      etat xr y true false '\000'
    end
    else if key_pressed () then begin
      let c = read_key () in
      let (x, y) = mouse_pos () in
      etat x y (button_down ()) true c
    end
    else begin
      let s = wait_next_event [Poll] in
      let pos = (s.mouse_x, s.mouse_y) in
      if s.button && not !bouton && dans_la_fenetre pos then begin
        bouton := true; derniere := pos; etat s.mouse_x s.mouse_y true false '\000'
      end
      else if pos <> !derniere && dans_la_fenetre pos then begin
        bouton := s.button; derniere := pos;
        etat s.mouse_x s.mouse_y s.button false '\000'
      end
      else begin
        bouton := s.button; derniere := pos; Unix.sleepf 0.01; attendre ()
      end
    end
  end
