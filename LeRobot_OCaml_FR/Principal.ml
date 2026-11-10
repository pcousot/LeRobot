(*-----------------------------------------------------------------------*)
(* Robot : Fonctions utilisateur principales                             *)
(* -- corps -- Principal.ml                                              *)
(*-----------------------------------------------------------------------*)

open Utile
open Grille
open Robot
open Graphics
open Graph
open Dessin

exception STOP

(* declaree dans Principal.mli : doit aussi etre definie ici en OCaml *)
exception Range_error of string

(* conversion orientation -> angle *)
let get_angle n =
    let gt = valLgT ()
    in
        [| 90. ; gt ; 0. ; 360. -. gt ;
        270. ; 180. +. gt ; 180. ; 180. -. gt
        |].(n)
(*-------------------------------------------------------------------*)
let v = ref (10:int)                   (* vitesse de l'execution *)

let valVt () = !v

(* La version Caml Light temporisait par une boucle de calcul
   (200*(10-n) iterations), devenue instantanee sur les machines
   actuelles : on fait une vraie pause, de 0 (n=10) a 90 ms (n=1).      *)
let my_wait n =
    Unix.sleepf (0.01 *. float_of_int (10 - n))

(* appele avant chaque commande du robot (LibRobot : joue les notes en
   attente avant de dessiner) *)
let avant_action = ref (fun () -> ())

let wait () =
        !avant_action ();
        let n = !v in
             if n>0
             then my_wait (min n 10)
             else
               let char = int_of_char (read_key ())
                   in
                   if (char = 27) || (char = 167) || (char = 35)
                   then raise Stop
                   else ()

let vt n =
    v := min (max n 0) 10

let pp () = vt 0

let ex () = vt 10

let increase_vt () = vt (!v +1)
and decrease_vt () = vt (!v -1)

let marquerUnePause () =
let rec mp n bool =
    begin
      show_ret (bool);
      if (key_pressed ()) || (button_down ())
      then raise Stop
      else
        begin
          Unix.sleepf 0.01;    (* clignotement visible (~0,3 s) *)
          if (n  = 30)
          then mp 0 (not bool)
          else mp (n+1) bool
        end;
    end
in
try mp 0 true
with Stop -> ()
(*=======================================================================*)
(* representation *) (* cuisine graphique... *)


let xinter = ref ((float_of_int !centrex) : float)
and yinter = ref ((float_of_int !centrey) : float)
and coord = ref (false : bool)


let draw_bar () =
    begin
      my_draw_bar (); show_ret (true); set_color (current_color ())
    end

let get_size_coord a b =
    let chaine = "  ("^(string_of_int a)^","^(string_of_int b)^")"
    in
        (text_size (chaine),chaine)

let get_icon robot =
    if (valBc ())
    then
      begin
        [|
        (robNt ) ; (robNEt) ; (robEt ) ; (robSEt) ;
        (robSt ) ; (robSOt) ; (robOt ) ; (robNOt)
       |].(valOrientation () )
      end
    else
      begin
        [|
        (robN ) ; (robNE) ; (robE ) ; (robSE) ;
        (robS ) ; (robSO) ; (robO ) ; (robNO)
        |].(valOrientation () )
      end

let correction x y =
         let (dx,dy) =
             [|
             (-3 , 0)  ;
             (-2 , -2) ;
             (0 , -3)  ;
             (-2 , -4) ;
             (-3 , -5) ;
             (-4 , -4) ;
             (-5 , -3) ;
             (-4 , -2)
             |].(valOrientation ())
         in
             ((x + dx * echelleRobot) , (y + dy * echelleRobot))

let montrer_rob = ref (true : bool)

let draw_robot = function
         () ->
         let (x,y) = correction (pixel (valX()))
                                (pixel (valY()))
         in
             draw_image
             ((*make_image*) (get_icon (!probot)))
             x
             y

let draw = function
         test ->

(*coord*)let bool = !coord
(*coord*)in

if (!montrer_rob) then
         let dgx = valLgX ()
         and dgy = valLgY ()
         in
             let x = valX ()
             and y = valY ()
             in
                 let marge = float_of_int (6 * echelleRobot)
                 in
                 let basex = (pixel (x -. dgx -. marge))
                 and basey = (pixel (y -. dgy -. marge))

(*coord*)        and ((a,b),c) = get_size_coord
(*coord*)                   (int_of_float ((x -. !xinter) /. dgx))
(*coord*)                   (int_of_float ((y -. !yinter) /. dgy))
(*coord*)        and (x0,y0) = current_point ()

                 in
                 begin
                      if test  (*###############*)
                   then

                     begin
                       if (testbornes (pixel x) (pixel y))
                       then   (* cas dans l'ecran : mise a jour. *)
                         begin
                       (* fond sauve sous le robot : de x - dgx - marge a
                          x + dgx + marge, limite a la fenetre. La version
                          precedente donnait x + dgx + marge comme largeur :
                          pres du bord gauche ou bas (basex ou basey < 0) la
                          zone sauvee s'arretait avant la pointe du robot,
                          qui restait dessinee (traces pointillees). *)
                       let bx = max 0 basex and by = max 0 basey in
                       let w = min (size_x ()) (pixel (x +. dgx +. marge)
                                                + (if bool then a else 0)) - bx
                       and h = min (size_y ()) (pixel (y +. dgy +. marge)
                                                + (if bool then b else 0)) - by in
                       if w > 0 && h > 0 then begin
                         pict := get_image bx by w h;
                         pict_x := bx; pict_y := by; pict_ok := true
                       end;
                       draw_robot ();

(*coord*)              if bool
(*coord*)              then begin
(*coord*)              moveto (pixel x) (pixel y);
(*coord*)              draw_string c;
(*coord*)              moveto x0 y0 end
(*coord*)              else ()

                         end;
                     end
                   else
                     begin
                       if !pict_ok
                         then (* remettre le fond la ou il a ete sauve *)
                         begin
                           draw_image (!pict) !pict_x !pict_y;
                           pict_ok := false
                         end
                     end
                 end
else ()
(*=======================================================================*)

let montrerRobot () =
    begin
      if (!montrer_rob)
      then ()
      else
        begin
          montrer_rob := true;
          (*draw (false);*) draw (true)
        end
    end

let cacherRobot () =
    begin
      draw (false);
      montrer_rob := false;
      draw (true)
    end

let valVisible () =
    !montrer_rob

let lc = function
         () ->
         begin
           draw (false) ;
           r_lc ();
           draw (true)       (* *)
         end

let bc = function
         () ->
         begin
           r_bc ();
           draw (false) ; draw (true)       (* *)
         end

let dp = function
         () ->
         begin
           draw (false)
           ;
           plot
           (pixel (valX ()))
           (pixel (valY ()))
           ;
           draw (true)
         end

let dc = function
         () ->
         let x = pixel (valX ())
         and y = pixel (valY ())
         in
             begin
               draw (false)
               ;
               moveto (x + 2) y ;
               lineto (x - 2) y ;
               moveto x (y + 2) ;
               lineto x (y - 2) ;
               moveto x y
               ;
               draw (true)
             end

(*-----------------------------------------------------------------------*)
(* rotations                                                             *)

(* absolues -------*)

let pn = function                                 (* pivoter nord        *)
         () ->
         begin
           r_pn ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let pne = function
         () ->
         begin
           r_pne () ;
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let pe = function
         () ->
         begin
           r_pe ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let pse = function
         () ->
         begin
           r_pse ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let ps = function
         () ->
         begin
           r_ps ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let psw = function
         () ->
         begin
           r_psw ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let pw = function
          () ->
         begin
           r_pw ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let pnw = function
         () ->
         begin
           r_pnw ();
           draw (false) ; draw (true) (* *)
         end

(*-------------------*)

let pivoter = function
         n ->
         begin
           r_pivoter n ;
           draw (false) ; draw (true) (* *)
         end

(* relatives ------*)

let phtd = function
         () ->
         begin
           r_phtd ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let phtg = function
         () ->
         begin
           r_phtg ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let pqtd = function
         () ->
         begin
           r_pqtd ();
        (* *)   draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let pqtg = function
         () ->
         begin
           r_pqtg ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)

let p3htd = function
         () ->
         begin
           r_p3htd ();
           draw (false) ; draw (true) (* *)
         end
(*-------------------*)


let p3htg = function
         () ->
         begin
           r_p3htg ();
           draw (false) ; draw (true)
         end
(*-------------------*)

let pdt = function
         () ->
         begin
           r_pdt ();
           draw (false) ; draw (true)
         end
(*-----------------------------------------------------------------------*)
(* Entree des valeurs                                                    *)

let lgX l =
    let l0 = (max 0. l)
    in
        begin
          draw (false);
          g_lgX l0;
          draw(true)
        end
(*----------------------*)

let lgY l =
    let l0 = (max 0. l)
    in
        begin
          draw(false);
          g_lgY l0;
          draw(true)
        end

(*----------------------*)

let lg l =
    let l0 = (max 0. l)
    in
        begin
          draw (false);
          g_lg l0;
          draw(true)
        end

(*----------------------*)

(* lgRT (r, t) : carreau de diagonale r faisant l'angle t avec l'horizontale,
   pour tout angle t (lgX = |r cos t|, lgY = |r sin t|), comme sur le
   Macintosh : Pentagone_1 fait lgRT (L, 144) puis pqtg; av pour tracer
   le cote a 144 degres. (Avant, t etait ramene dans [0, 90].) *)
let lgRT (r,theta) =
    let r0 = (max 0. r)
    and t = deg_to_rad theta
    in

    begin
      draw (false);
      g_lgX (abs_float (r0 *. cos t));
      g_lgY (abs_float (r0 *. sin t));
      draw(true)
    end
(*-----------------------------------------------------------------------*)
(* Longueur dernier trace                                                *)

let valLgTl = function
         () ->
         begin
           !lgTl
         end
(*-----------------------------------------------------------------------*)
(* sortie de la fenetre                                                  *)
let sortie = ref ( false : bool)

let autoriserSorties () =
    sortie := true

let interdireSorties () =
    sortie := false

let valAutoriserSorties () =
    !sortie
(*-----------------------------------------------------------------------*)
(* Deplacements relatifs                                                 *)

let translater = function
         (dx,dy) ->
         let a = (valX())+.(float_of_int dx)*.(valLgX())
         and b = (valY())+.(float_of_int dy)*.(valLgY())
         in
             let aint = (pixel a)
             and bint = (pixel b)
             in
                 if (testbornes aint bint)
                 then
                   begin
                     draw (false);
                     r_translater (a,b);
                     moveto aint bint;
                     draw (true)    (* *)
           end
         else
           if (!sortie)
           then
             begin
               draw (false);
               r_translater (a,b);
               moveto aint bint
             end
           else
             raise (Range_error "translater")
(*-------------------*)

(* Trait epais : le crayon du Macintosh (QuickDraw) est un carre, un trait
   epais est donc la trace d'un carre de cote valEc () deplace le long du
   segment (un rectangle pour un trait horizontal ou vertical), alors que
   X11 arrondit les bouts des traits epais. On remplit l'enveloppe convexe
   des deux carres aux extremites. *)
let trait x2 y2 =
    let w = valEc ()
    in
        if w <= 1
        then lineto x2 y2
        else
          let (x1, y1) = current_point ()
          in let lo = - (w / 2) and hi = (w - 1) / 2
          in let coins (x, y) =
               [ (x + lo, y + lo); (x + hi, y + lo);
                 (x + hi, y + hi); (x + lo, y + hi) ]
          in let pts = List.sort_uniq compare (coins (x1, y1) @ coins (x2, y2))
          in let cross (ox, oy) (ax, ay) (bx, by) =
               (ax - ox) * (by - oy) - (ay - oy) * (bx - ox)
          in let demi l =
               List.fold_left
                 (fun h p ->
                    let rec retirer = function
                      | b :: a :: r when cross a b p <= 0 -> retirer (a :: r)
                      | h -> h
                    in p :: retirer h)
                 [] l
          in let bas = demi pts and haut = demi (List.rev pts)
          in let enveloppe = List.tl bas @ List.tl haut
          in
              fill_poly (Array.of_list enveloppe);
              moveto x2 y2

let av_effect = function
         () ->
             begin
               if (not (tb ())) || (valAutoriserSorties ())
               then
                 begin
                   draw (false) ;

                   (* reaffichage de la barre de commande durant une sortie *)
                   if (not (testbornes (Robot.arrondi (valX()))
                                       (Robot.arrondi (valY()))))
                   then draw_bar () ;
                   (* ------------------------------------------------------*)

                   r_av_effect () ;
                   if valBc ()
                   then
                     begin
                       trait (pixel (valX()))
                             (pixel (valY()))
                     end
                   else
                     begin
                       moveto (pixel (valX()))
                              (pixel (valY()))
                     end;
                   if testbornes (Robot.arrondi (valX()))
                                 (Robot.arrondi (valY()))
                   then draw (true) else ()
                 end
               else
                 begin
                   raise (Range_error "av")
                 end
            end

let av = function
         () ->
         begin
           if (key_pressed())              (*sequence test d'arret*)
           then                                            (* *)
             let char = int_of_char (read_key())           (* *)
             in
                 begin                                     (* *)
                   if ((char = 27) || (char = 167) || (char = 35))
                   then raise Stop                         (* *)
                   else
                     begin
                       av_effect ()
                     end
                 end
           else av_effect ()
         end

(*-----------------------*)

let avf n =
    if n >= 0
    then
         for k = 1 to n
         do
           av ()
         done
    else
      begin
        pdt ();
        for k = 1 to (- n)
        do
          av ()
        done;
        pdt ()
      end

(*-------------------------------------------------*)
(* virage a droite  *)

let vd_effect = function                             (* virage a droite.    *)
         () ->
         begin
           if (not (tbvd())) || (valAutoriserSorties ())
           then
             begin
               if (valBc ())
               then
                 begin
                   draw (false)
                   ;
                   if ((valOrientation ()) mod 2)= 0
                   then
                     begin
                       let (a,b,c,d,e,f) = vd_cardinaux ()
                       in
                           begin
                             draw_arc a b c d e f;
                             moveto(pixel (valX()))
                                   (pixel (valY()))
                           end
                     end
                   else
                     begin
                       if (tse ())
                       then
                         (* deux appels en sequence : le second deplace le robot *)
                         let (a1,b1,c1,d1,e1,f1) = vd_non_cardinaux 1 in
                         let (a2,b2,c2,d2,e2,f2) = vd_non_cardinaux 2
                         in
                             begin
                               draw_arc a1 b1 c1 d1 e1 f1;
                               draw_arc a2 b2 c2 d2 e2 f2;
                               moveto (pixel (valX()))
                                      (pixel (valY()))
                             end
                       else
                       let (a,b,c,d,e,f) = vd_non_cardinaux 0
                       in
                           begin
                             draw_arc a b c d e f;
                             moveto (pixel (valX()))
                                    (pixel (valY()))
                           end
                     end
                   ;
                   if testbornes (Robot.arrondi (valX()))
                                 (Robot.arrondi (valY()))
                   then
                     draw (true)
                   else
                     ()
                 end
               else
                 begin
                   phtd ();
                   av ();
                   phtd ()
                 end
             end
           else
             raise (Range_error "vd")
         end

let vd = function
         () ->
         begin
           if (key_pressed())              (*sequence test d'arret*)
           then                                            (* *)
             let char = int_of_char (read_key())           (* *)
             in
                 begin                                     (* *)
                   if ((char = 27) || (char = 167) || (char = 35))
                   then raise STOP                           (* *)
                   else
                     begin
                       vd_effect ()
                     end
                 end
           else vd_effect ()
         end

(*-------------------------------------------------*)
(* virage a gauche  *)
let vg_effect = function                             (* virage a gauche.    *)
         () ->
         begin
           if (not (tbvg())) || (valAutoriserSorties ())
           then
             begin
               if (valBc ())
               then
                 begin
                   draw (false)
                   ;
                   if ((valOrientation ()) mod 2)= 0
                   then
                     begin
                       let (a,b,c,d,e,f) = vg_cardinaux ()
                       in
                           begin
                             draw_arc a b c d e f;
                             moveto(pixel (valX()))
                                   (pixel (valY()))
                           end
                     end
                   else
                     begin
                       if (not (tne ())) then

                       let (a,b,c,d,e,f) = vg_non_cardinaux 0
                       in
                           begin
                             draw_arc a b c d e f;
                             moveto (pixel (valX()))
                                    (pixel (valY()))
                           end
                       else
                         (* deux appels en sequence : le second deplace le robot *)
                         let (a1,b1,c1,d1,e1,f1) = vg_non_cardinaux 1 in
                         let (a2,b2,c2,d2,e2,f2) = vg_non_cardinaux 2
                         in
                             begin
                               draw_arc a1 b1 c1 d1 e1 f1;
                               draw_arc a2 b2 c2 d2 e2 f2;
                               moveto (pixel (valX()))
                                      (pixel (valY()))
                             end

                     end
                   ;
                   if testbornes (Robot.arrondi (valX()))
                                 (Robot.arrondi (valY()))
                   then
                     draw (true)
                   else
                     ()
                 end
               else
                 begin
                   phtg ();
                   av ();
                   phtg ()
                 end
             end
           else
             raise (Range_error "vg")
         end

let vg = function
         () ->
         begin
           if (key_pressed())              (*sequence test d'arret*)
           then                                            (* *)
             let char = int_of_char (read_key())           (* *)
             in
                 begin                                     (* *)
                   if ((char = 27) || (char = 167) || (char = 35))
                   then raise STOP                         (* *)
                   else
                     begin
                       vg_effect ()
                     end
                 end
           else vg_effect ()
         end

(*====================================================================*)
(* AFFICHAGE DE LA GRILLE                                             *)

(* calcul de la position de depart *)
let get_start_position posx posy =
    let pasx = (valLgX ())
    and pasy = (valLgY ())
    in
        (posx -. ((float_of_int
                   (int_of_float (posx /. pasx)))
                   *. pasx),
         posy -. ((float_of_int
                   (int_of_float (posy /. pasy)))
                   *. pasy)
         )

(* calcul de la liste des abscisses pour la ligne *)
let rec compute_net_line (x, y, l, pas) =
    if (pixel x) > ((size_x()) - 1)
    then l
    else compute_net_line (x +. pas, y, (x,y)::l, pas)

(* un point de la grille : carre de cotePointGrille pixels de cote
   (un seul pixel, comme en 1998, est a peine visible sur un ecran Retina) *)
let cotePointGrille = 2
let point_grille x y =
    let d = (cotePointGrille - 1) / 2
    in fill_rect (x - d) (y - d) cotePointGrille cotePointGrille

(* calcul de la liste des ordonnees  + affichage lignes *)
let draw_net_line (x0, y0, color) =
    let list = compute_net_line (x0,y0,[], valLgX ())
    and pas = valLgY ()
    in
        let rec d_n_l l y =             (* fonction de trace --------*)
            let dnl l y =                    (* pour pouvoir arreter*)
                if (pixel y) < ((size_y()) - 1)            (* *)
                then                                              (* *)
                  d_n_l                                           (* *)
                  (List.map                                       (* *)
                   (function (x,y) ->                             (* *)
                            begin                                 (* *)
                              point_grille (pixel x) (pixel y);
                              (x, y+.pas )                        (* *)
                            end)                                  (* *)
                   l)                                             (* *)
                  (y+. pas)                                       (* *)
                else                                              (* *)
                  y                          (*----------------------*)
            in                                                     (* *)
                begin                                              (* *)
                  set_color color;                                 (* *)
                  if (key_pressed())         (*sequence test d'arret*)
                  then                                            (* *)
                    let char = int_of_char (read_key())           (* *)
                    in                                            (* *)
                        begin                                     (* *)
                          if ((char = 27) || (char = 167) || (char = 35))
                          then y                                  (* *)
                          else dnl l y                            (* *)
                        end                                       (* *)
                  else dnl l y                                    (* *)
                end                         (*----------------------*)
        in                              (*---------------------------*)
            begin
              ignore (d_n_l list y0)
            end

let my_dg x y = function
         () ->
         let (x0,y0) = get_start_position x y
         in
             begin
               set_color gris;
               draw_net_line (x0, y0, noir);  (* couleur grille *)
               moveto (pixel x) (pixel y)
             end

let dg = function
         () ->
         let a = (valX ())
         and b = (valY ())
         in
             let (x0,y0) = get_start_position a b
             in
                 begin
                   draw(false);
                   (*draw (true);*)
                   set_color gris;
                   set_line_width 1;
                   draw_net_line (x0, y0, noir);  (* couleur grille *)

                   moveto (pixel a) (pixel b);
                   set_line_width (valEc ());
                   draw (true)
                 end

(*=========================================================================*)

(* deplacements absolus                                                    *)
let tracer (a,b) =
    begin
      draw (false) ;
      if (valBc ())
      then trait a b
      else moveto a b ;
      r_ce (float_of_int a) (float_of_int b) ;
      draw (true)
    end
(*-------------------------------------------------------------------------*)
(* translation + changement de repere                                      *)
let rec tl l =
    (* longueur negative : on recule (demi-tour, tl de -l, demi-tour) ;
       lgX, lgY et lgRT n'acceptent pas de longueur negative *)
    if l < 0. then begin pdt (); tl (-. l); pdt () end else
    (* longueur nulle : le robot ne bouge pas et garde sa grille, donc sa
       direction (FloconTernaire fait tl (L div 3) avec L = 2) ; une grille
       de longueur nulle lui ferait perdre son angle *)
    if l < 1e-9 then () else
    begin
      let vo = valOrientation ()
          in
          if (vo mod 2) = 0
          then                        (* points cardinaux *)
            begin
              if (vo mod 4) = 0
              then                              (* N ou S *)
                let oldY = valLgY ()
                in
                    begin
                      lgY l ;
                      (* grille degeneree (longueur quasi nulle) : on repart
                         d'une grille carree *)
                      lgX (if abs_float oldY < 1e-6 then l
                           else (valLgX ()) *. l /. oldY) ;
                      av () ;
                    end
              else                              (* E ou O *)
                let oldX = valLgX ()
                in
                    begin
                      lgX l ;
                      lgY (if abs_float oldX < 1e-6 then l
                           else (valLgY ()) *. l /. oldX) ;
                      av () ;
                    end
            end
          else                        (*   non cardinaux  *)
            begin
              lgRT (l, (valLgT ())) ;
              av () ;
            end
    end
(*-------------------------------------------------------------------------*)
(* rotation + changement de repere                                         *)

(* angle ramene dans [0, 360[ (normalise le laissait dans ]-360, 360[,
   et lgRT ramene les angles hors de [0, 90] a 0 ou 90) *)
let angle360 a =
    let r = Float.rem a 360. in if r < 0. then r +. 360. else r

let rt t =
    let vo = valOrientation ()
    in let an = get_angle vo
    (* grille degeneree (apres tl 0.) : la direction serait perdue *)
    in let () = if valLgR () < 1e-6 then lg 1.
    in let a = angle360 (an +. t)
    in let anrad = deg_to_rad a
    in let cosan = cos (anrad)
    in let sinan = sin (anrad)
          in
              if (cosan = 1.)
              then                                                (* est *)
                begin
                  pe ()
                end
              else
                if (sinan = 1.)
                then                                             (* nord *)
                  begin
                    pn ()
                  end
                else
                  if (cosan = -1.)
                  then                                          (* ouest *)
                    begin
                      pw ()
                    end
                  else
                    if (sinan = -1.)
                    then                                          (* sud *)
                      begin
                        ps ()
                      end
                    else                      (*---------- non cardinaux *)
                      if (cosan > 0.)
                      then                         (*-------- moitie est *)
                        begin
                          if (sinan > 0.)
                          then                         (* quart nord-est *)
                            begin
                              lgRT (valLgR () , a) ;
                              pne ()
                            end
                          else                          (* quart sud-est *)
                            begin
                              lgRT (valLgR () , 360. -. a) ;
                              pse ()
                            end
                        end
                      else                         (*------ moitie ouest *)
                        begin
                          if (sinan > 0.)
                          then                       (* quart nord-ouest *)
                            begin
                              lgRT (valLgR () , 180. -. a) ;
                              pnw ()
                            end
                          else                        (* quart sud-ouest *)
                            begin
                              lgRT (valLgR () , a -. 180.) ;
                              psw ()
                            end
                        end
(*-------------------------------------------------------------------------*)
(* Positionnement au centre et sur les bords du cadre *)

let ce = function
         () ->
         (*
         let xmax = size_x () - !bsupx
         and ymax = size_y () - !bsupy
           *)
         let a = !centrex
         and b = !centrey
         in
             begin
               draw (false) ;
               moveto a b (*(xmax / 2) (ymax / 2)*) ;
               r_ce
                (float_of_int a (*(xmax) /. 2.*) )
                (float_of_int b (*(ymax) /. 2.*))
               ;
               draw (true)
             end

let eh = function
         () ->
         let ymax = size_y () - !bsupy
         in
             begin
               draw (false) ;
               moveto (fst (current_point ())) ymax ;
               r_tv (float_of_int ymax)
               ;
               draw (true)
             end

let eb = function
         () ->
         begin
           draw (false) ;
           moveto (fst (current_point ())) !binfy ;
           r_tv (float_of_int !binfy)
           ;
           draw (true)
         end

let ad = function
         () ->
         let xmax = size_x () - !bsupx
         in
             begin
               draw (false) ;
               moveto xmax (snd (current_point ())) ;
               r_th (float_of_int xmax)
               ;
               draw (true)
             end

let ag = function
         () ->
         begin
           draw (false) ;
           moveto !binfx (snd (current_point ())) ;
           r_th (float_of_int !binfx)
           ;
           draw (true)
         end
(*-----------------------------------------------------------------------*)
(* Deplacement absolu sur une grille munie d'un repere.                  *)

let cartes x y =
    (pixel((float_of_int !centrex) +. (float_of_int x) *. (valLgX ())) ,
     pixel((float_of_int !centrey) +. (float_of_int y) *. (valLgY ())) )

let deplacer = function
         (x,y) ->
         let (a,b) = cartes x y
         in
             begin
               draw (false) ;
               moveto a b  ;
               r_ce (float_of_int a) (float_of_int b)
               ;
               draw(true)
         end


(*-----------------------------------------------------------------------*)
(* Initialisation avec une couleur de fond choisie.                      *)

let indice_cf = ref (0 : int)

let valCf () = !indice_cf

let cf = function
         n ->
         begin
           init_pict ();
           cc n;
           indice_cf := n;
           fill_rect 0 0 (size_x ()) (size_y ());
           draw(true);
           draw_bar ();
           cc 7;
           show_color ();
           bc ();
           vt 10;
           ec 1;
           interdireSorties ();
           montrerRobot ();
           pn ();
           ce ()
         end


(*-----------------------------------------------------------------------*)
(* Memoire des interactions                                              *)

(* liste des commandes passees *)
let commandes = ref ([]:(unit->unit) list)
(* liste de chaines des commandes passees *)
let str_commandes = ref ([]:string list)

(* empilement des commandes *)
let empile_fun toto =
    commandes := [toto]@(!commandes)

let empile_str toto =
    str_commandes := [toto]@(!str_commandes)

let depile () =
    begin
      commandes := List.tl (!commandes);
      str_commandes := List.tl (!str_commandes)
    end

let rec my_undo = function
         [] -> ()
       | f::l -> begin f (); my_undo l end

let rec my_undo_bis = function
         [] -> ()
       | f::l -> begin f ();wait (); my_undo_bis l end

let undo () =
    let liste_com = (!commandes)
    in
        if liste_com = []
        then
          ()
        else
          begin
            set_color (current_color ()); show_color ();
            (* retirer la commande des deux piles : sinon elle reste dans
               le texte sauve dans mon_dessin.ml *)
            depile ();
            my_undo (List.rev (List.tl (liste_com)));
            (* la couleur courante est celle rejouee *)
            show_color ()
          end
(*-----------------------------------------------------------------------*)
let sauvegarde = ref ( false : bool)

let rec st () =
    begin
      moveto 17 yTexteBar;
      set_color blanc;
      fill_rect 0 0 (size_x () - 1) (hBar - 1);
      set_color bleu;
      if (!sauvegarde)
      then
        begin
          draw_string " Voulez-vous sauver dans mon_dessin.ml ? (y/n) ";
          if (read_key ()) = 'y'
          then
          begin
          let string_of_fun () =
              String.concat "" (List.rev !str_commandes)
          in
              let build_file () =

                    let channel = open_out "mon_dessin.ml"
                    in
                        begin
                          output_string channel
                          (
                          "(* Mon joli dessin *)
open LeRobot
let () =
begin
  init_pict (); ce();
  "^(string_of_fun ())^"
end
");
close_out channel;

                    (*-------------------------*)
                        end

              in
                  begin
                    moveto 17 yTexteBar;
                    build_file ();
                    raise Stop
                  end
          end

      else begin raise Stop end
        end
      else
        begin
          moveto 17 yTexteBar;
          set_color blanc;
          fill_rect 0 0 (size_x () - 1) (hBar - 1);
          set_color bleu;
          draw_string ("  + : plus vite   - : moins vite   vitesse : "
                       ^(string_of_int (!v))
                       ^"     autre touche : redessiner   Echap : quitter");
          let motion = wait_next_event [Key_pressed]
          in
              (* + et - changent seulement la vitesse (en 1998 ils
                 relancaient aussi le dessin) ; une autre touche redessine *)
              if motion.key = '+'
              then begin increase_vt (); st () end
              else
                if motion.key = '-'
                then begin decrease_vt (); st () end
                else
                  if (motion.key = '\027') || (motion.key = '#')
                  then (*raise Stop*) close_graph ()
                  else
                    begin
                      init_pict ();ce (); pn ();
                      my_undo_bis (List.rev (!commandes)); st ()
                    end
        end
    end
(*=======================================================================*)
(* Peinture                                                              *)
let direction_derriere () =                       (* point de depart du  *)
        [| (0,-1);(-1,-1);(-1,0);(-1,1);          (* remplissage en      *)
             (0,1);(1,1);(1,0);(1,-1) |]          (* fonction du robot : *)
        .(valOrientation ())                      (* direction, position.*)

let point_de_depart () =
    let (dx,dy) = direction_derriere ()
    in
        ((pixel (valX ()))+ dx,
         (pixel (valY ()))+ dy)

let peindre () =
    let (dx,dy) = direction_derriere ()
    and x = pixel (valX ()) and y = pixel (valY ())
    in
        (* effacer le robot AVANT de lire la couleur du point de depart :
           sinon on lit la couleur du dessin du robot (noir) et le
           remplissage d'une zone blanche ne se termine pas *)
        draw (false);
        (* le point juste derriere le robot tombe souvent sur un trait
           quand le robot est dans un coin (traits a 30 ou 60 degres) : s'il
           est sur un trait (noir ou de la couleur courante), on essaie 1 ou
           2 pixels plus loin dans la meme direction (sur le Macintosh, les
           traits sont decales d'un demi-pixel et laissent ce point libre) *)
        let sur_un_trait c = c = current_color () || c = black
        in
        let rec chercher k =
            let a = x + k * dx and b = y + k * dy
            in
                if not (sur_un_trait (point_color a b)) || k = 3
                then (a, b)
                else chercher (k + 1)
        in
        let (a,b) = chercher 1
        in
        let fond = point_color a b
        in
            if fond <> current_color ()
            then
              begin
                Peinture.remplir fond a b;
                set_line_width (valEc ())
              end;
            draw (true)
