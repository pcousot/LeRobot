(*-----------------------------------------------------------------------*)
(* Robot : Description de la grille                                      *)
(* -- corps --  Grille.ml                                                *)
(*-----------------------------------------------------------------------*)
open Utile
open Graphics
open Graph

(* Definition du type de la grille
      lX : largeur d'un carreau de la grille,
      lY : hauteur d'un carreau de la grille,
      oN : angle du Nord avec la hauteur.
*)

type grille =
  {
  mutable lX : float ;
  mutable lY : float ;
  mutable oN : float
 }

(* Grille de base      *)
let ginit = {
            lX = 30. ;
            lY = 30. ;
            oN = 90.
   }

(* reference sur grille *)
let pgrille = (ref ginit)

(*-----------------------------------------------------------------------*)
(* Consultation des valeurs                                              *)

let my_valLgX = function
         grille -> grille.lX

let valLgX = function
         () -> (!pgrille).lX
(*--------------------------*)

let my_valLgY = function
         grille -> grille.lY

let valLgY = function
         () -> (!pgrille).lY
(*--------------------------*)

let my_valLgR = function
         grille -> let x = grille.lX
                   and y = grille.lY
                   in
                   sqrt (x*.x+.y*.y)

let valLgR = function
         () -> let x = (!pgrille).lX
               and y = (!pgrille).lY
               in
               sqrt (x*.x+.y*.y)
(*--------------------------*)

let my_valLgT = function
         grille -> rad_to_deg ((acos ((my_valLgX grille)
                                      /. (my_valLgR grille))))

let valLgT = function
         () -> rad_to_deg ((acos ((valLgX ()) /. (valLgR ()))))
(*-----------------------------------------------------------------------*)
(* Entree des valeurs                                                    *)

let my_lgX2 l = function
         grille -> {
                   lX = l ;
                   lY = grille.lY ;
                   oN = grille.oN
                   }

let g_lgX l =
    begin
      (!pgrille).lX <- l
    end
(*----------------------*)

let my_lgY2 l = function
         grille -> {
                   lX = grille.lX ;
                   lY = l ;
                   oN = grille.oN
                   }

let g_lgY l =
    begin
      (!pgrille).lY <- l
    end
(*----------------------*)

let my_lg l = function
         grille -> {
                   lX = l ;
                   lY = l ;
                   oN = grille.oN
                   }

let g_lg l =
    begin
      g_lgX l;
      g_lgY l
    end
(*----------------------*)

let my_lgRT (r,theta) = function
         grille -> {
                   lX = r *. (cos (deg_to_rad theta)) ;
                   lY = r *. (sin (deg_to_rad theta)) ;
                   oN = grille.oN
                   }

let g_lgRT (r,theta) =
    begin
      g_lgX (r *. (cos (deg_to_rad theta)));
      g_lgY (r *. (sin (deg_to_rad theta)))
    end
(*-----------------------------------------------------------------------*)
