open Graphics

(*=======================================================================*)
(* DIMENSION DE LA FENETRE GRAPHIQUE                                     *)
let dimX = 800
and dimY = 700

(* HAUTEUR DE LA BARRE DU BAS (15 a l'origine) et epaisseur de son bord  *)
let hBar = 24
and epBord = 2
let yTexteBar = 5                     (* ordonnee du texte dans la barre  *)
(*=======================================================================*)
(* NOM DU DISPLAY                                                        *)
(* "" : display par defaut (variable DISPLAY). A l'origine "gauguin:0".  *)
let my_display = ""
(*=======================================================================*)

let () = open_graph (my_display^" "^(string_of_int dimX)^"x"^(string_of_int dimY))
(* A l'origine le texte finissait par "* :" collé a la case de couleur ;
   la fenetre etant plus large, on nomme la commande et la touche de fin. *)
let mementoCommandesClavier = "- :pqtg + :pqtd g :phtg d :phtd a :av ( :vg ) :vd b :bc l :lc c :dc . :dg p :dp * :cc w :peindre  Entree :fin"
and valM = ref ("" : string)

let xshow = ref ((dimX-48):int)
and yshow = ref (((hBar - 6)/2):int)

let binfx = ref (10 : int)
let binfy = ref ((hBar + epBord): int)
let bsupx = ref (10: int)
let bsupy = ref (10: int)

let centrex = ref (((size_x ()) - !bsupx + !binfx)/2 : int)
and centrey = ref (((size_y ()) - !bsupy + !binfy)/2 : int)

let my_clear_bar bool =
      begin
        set_color white;
        fill_rect 0 0 (if bool then (size_x () - 1) else (dimX-52)) hBar;
        valM:= "";
        set_color black
      end

(* bord de la barre : trait epais en haut, trait fin a droite *)
let draw_bar_border () =
    begin
      fill_rect 0 hBar (size_x ()) epBord;
      moveto (size_x()-1) hBar; lineto (size_x()-1) 0
    end

let my_draw_bar () =
let (x,y) = current_point ()
in
    begin
      my_clear_bar (false);
      draw_bar_border ();
      moveto (dimX-52) hBar;
      lineto (dimX-52) 0;
      moveto (dimX-38) hBar;
      lineto (dimX-38) 0;
      moveto 2 yTexteBar;
        draw_string  (mementoCommandesClavier);
        valM := (mementoCommandesClavier);
      moveto x y
    end

let pict = (ref (create_image (size_x ()) (size_y ())) )

(* coin ou le fond sous le robot a ete sauve, et s'il reste a le remettre *)
let pict_x = ref 0
let pict_y = ref 0
let pict_ok = ref false

let init_pict () =
    begin
      clear_graph ();
      pict := get_image 0 0 (size_x()) (size_y());
      pict_ok := false;
      my_draw_bar ()
   end

let testbornes a b =
(a >= (!binfx)) && (a <= ((size_x()) - !bsupx))
&&
(b >= (!binfy)) && (b <= ((size_y()) - !bsupx))
