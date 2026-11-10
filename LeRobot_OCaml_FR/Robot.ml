(*-----------------------------------------------------------------------*)
(* Robot : definition, operations relatives, crayon et tests             *)
(* -- corps --  Robot.ml                                                 *)
(*-----------------------------------------------------------------------*)
open Utile
open Grille
open Dessin
open Graphics
open Graph

(* position -> pixel : on arrondit (et non on tronque, comme pixel).
   Les rangees d'un pavage tombent sur des ordonnees comme 642.99 et
   617.01 : tronquees (642, 617) elles ne sont plus a 26 pixels l'une de
   l'autre, et les traits et le point de depart de peindre se decalent d'un
   pixel d'une rangee a l'autre (PavageHexagonalOndule ne peignait que la
   premiere rangee). *)
let pixel v = int_of_float (Float.round v)

type robot =
  {
  mutable x : float;
  mutable y : float;
  mutable theta : int;
  mutable trace : bool ;
  mutable ep : int
 }

(* conversion orientation -> angle *)
let get_angle n =
    let gt = valLgT ()
    in
        [|
        90. ; gt ; 0. ; 360. -. gt ;
        270. ; 180. +. gt ; 180. ; 180. -. gt
        |].(n)

let roby =
    {
    x = 250. ;
    y = 250. ;
    theta = 0 ;
    trace = true ;
    ep = 1
   }

(* reference sur le robot *)
let probot = ref ( roby : robot)

(* reference sur la longueur de trace *)
let lgTl =  ref (0.)
(*-----------------------------------------------------------------------*)
(* Consultation des valeurs                                              *)

let valBc = function
         () -> (!probot).trace

let valEc = function
         () -> (!probot).ep
(*-------------------*)

let my_valX robot = robot.x

let valX = function
         () -> (!probot).x
(*-------------------*)

let my_valY robot = robot.y

let valY = function
         () -> (!probot).y
(*-----------------------------------------------------------------------*)
(* Test booleen d'orientation                                            *)

let my_tn  = function                             (* nord ?              *)
         robot -> robot.theta = 0
let tn = function
         () -> (!probot).theta = 0
(*-------------------*)

let my_tne = function                             (* nord-est ?          *)
         robot -> robot.theta = 1
let tne = function
         () -> (!probot).theta = 1
(*-------------------*)

let my_te  = function                             (* est ?               *)
         robot -> robot.theta = 2
let te = function
         () -> (!probot).theta = 2
(*-------------------*)

let my_tse = function                             (* sud-est ?           *)
         robot -> robot.theta = 3

let tse = function
         () -> (!probot).theta = 3
(*-------------------*)

let my_ts  = function                             (* sud ?               *)
         robot -> robot.theta = 4
let ts = function
         () -> (!probot).theta = 4
(*-------------------*)

let my_tsw = function                             (* sud-ouest ?         *)
         robot -> robot.theta = 5
let tsw = function
         () -> (!probot).theta = 5
(*-------------------*)

let my_tw  = function                             (* ouest ?             *)
         robot -> robot.theta = 6
let tw = function
         () -> (!probot).theta = 6
(*-------------------*)

let my_tnw = function                             (* nord-ouest ?        *)
         robot -> robot.theta = 7
let tnw = function
         () -> (!probot).theta = 7
(*-----------------------------------------------------------------------*)
(* consultation d'orientation                                            *)

let my_valOrientation = function
         robot -> robot.theta

let valOrientation = function
         () -> (!probot).theta
(*-----------------------------------------------------------------------*)
(* operations crayon                                                     *)

let my_lc = function
        robot ->
        let nouveau_robot =
            {
            x = (!probot).x ;
            y = (!probot).y ;
            theta = (!probot).theta ;
            trace = false ;
            ep = (!probot).ep
           }
         in
             begin
               nouveau_robot
             end

let r_lc = function
         () ->
             begin
               (!probot).trace <- false
             end

let r_bc = function
         () ->
             begin
               (!probot).trace <- true
             end

let ec = function
         n ->
         begin
           (!probot).ep <- n;
           set_line_width n
         end
(*-----------------------------------------------------------------------*)
(* rotations                                                             *)

(* absolues -------*)

(* robot de meme position, oriente selon theta (factorise my_pn..my_pnw) *)
let my_pivote theta robot =
    {
    x = robot.x ;
    y = robot.y ;
    theta = theta ;
    trace = robot.trace;
    ep = (!probot).ep }

let my_pn  = my_pivote 0                          (* pivoter nord        *)
let my_pne = my_pivote 1                          (* pivoter nord-est    *)
let my_pe  = my_pivote 2                          (* pivoter est         *)
let my_pse = my_pivote 3                          (* pivoter sud-est     *)
let my_ps  = my_pivote 4                          (* pivoter sud         *)
let my_psw = my_pivote 5                          (* pivoter sud-ouest   *)
let my_pw  = my_pivote 6                          (* pivoter ouest       *)
let my_pnw = my_pivote 7                          (* pivoter nord-ouest  *)

let r_pn  () = (!probot).theta <- 0               (* pivoter nord        *)
let r_pne () = (!probot).theta <- 1               (* pivoter nord-est    *)
let r_pe  () = (!probot).theta <- 2               (* pivoter est         *)
let r_pse () = (!probot).theta <- 3               (* pivoter sud-est     *)
let r_ps  () = (!probot).theta <- 4               (* pivoter sud         *)
let r_psw () = (!probot).theta <- 5               (* pivoter sud-ouest   *)
let r_pw  () = (!probot).theta <- 6               (* pivoter ouest       *)
let r_pnw () = (!probot).theta <- 7               (* pivoter nord-ouest  *)

(* relatives ------*)

let my_phtd robot =                               (* huitieme a droite.  *)
    [|
    (my_pne);(my_pe );(my_pse);(my_ps );(my_psw);(my_pw );(my_pnw);(my_pn )
  |].(my_valOrientation robot)
    robot

let r_phtd = function
         () ->
           [|(r_pne);(r_pe );(r_pse);(r_ps );(r_psw);(r_pw );(r_pnw);(r_pn )|]
             .(valOrientation ())
             ()
(*-------------------*)

let my_phtg robot =                               (* huitieme a gauche.  *)
    [|
    (my_pnw);(my_pn );(my_pne);(my_pe );(my_pse);(my_ps );(my_psw);(my_pw )
    |].(my_valOrientation robot)
    robot

let r_phtg = function
         () ->
           [|(r_pnw);(r_pn );(r_pne);(r_pe );(r_pse);(r_ps );(r_psw);(r_pw )|]
             .(valOrientation ())
             ()
(*-------------------*)

let my_pqtd robot =                               (* quart a droite.     *)
    [|
    (my_pe );(my_pse);(my_ps );(my_psw);(my_pw );(my_pnw);(my_pn );(my_pne)
    |].(my_valOrientation robot)
    robot

let r_pqtd = function
         () ->
           [|(r_pe );(r_pse);(r_ps );(r_psw);(r_pw );(r_pnw);(r_pn );(r_pne)|]
             .(valOrientation ())
             ()
(*-------------------*)

let my_pqtg robot =                               (* quart a gauche.     *)
    [|
    (my_pw );(my_pnw);(my_pn );(my_pne);(my_pe );(my_pse);(my_ps );(my_psw)
    |].(my_valOrientation robot)
    robot

let r_pqtg = function
         () ->
           [|(r_pw );(r_pnw);(r_pn );(r_pne);(r_pe );(r_pse);(r_ps );(r_psw)|]
             .(valOrientation ())
             ()
(*-------------------*)

let my_p3htd robot =                              (* 3 huitiemes a droite*)
    [|
    (my_pse);(my_ps );(my_psw);(my_pw );(my_pnw);(my_pn );(my_pne);(my_pe )
    |].(my_valOrientation robot)
    robot

let r_p3htd = function
         () ->
           [|(r_pse);(r_ps );(r_psw);(r_pw );(r_pnw);(r_pn );(r_pne);(r_pe )|]
             .(valOrientation ())
             ()
(*-------------------*)

let my_p3htg robot =                              (* 3 huitiemes a gauche*)
    [|
    (my_psw);(my_pw );(my_pnw);(my_pn );(my_pne);(my_pe );(my_pse);(my_ps )
    |].(my_valOrientation robot)
    robot

let r_p3htg = function
         () ->
           [|(r_psw);(r_pw );(r_pnw);(r_pn );(r_pne);(r_pe );(r_pse);(r_ps )|]
             .(valOrientation ())
             ()
(*-------------------*)

let my_pdt robot =                                (* demi-tour.          *)
    [|
    (my_ps );(my_psw);(my_pw );(my_pnw);(my_pn );(my_pne);(my_pe );(my_pse)
    |].(my_valOrientation robot)
    robot

let r_pdt = function
         () ->
           [|(r_ps );(r_psw);(r_pw );(r_pnw);(r_pn );(r_pne);(r_pe );(r_pse)|]
             .(valOrientation ())
             ()
(*-------------------*)
                                                  (* rotation.           *)
let r_pivoter n =
    [| (r_pn );(r_pne);(r_pe );(r_pse);(r_ps );(r_psw);(r_pw );(r_pnw)|].(n)
    ()
(*-----------------------------------------------------------------------*)
(* Deplacements relatifs                                                 *)

let my_translater (x,y) = function                (* translation en (x,y)*)
         robot ->
         let nouveau_robot =
             {
             x = robot.x +. (x *. (valLgX ())) ;
             y = robot.y +. (y *. (valLgY ())) ;
             theta = robot.theta ;
             trace = robot.trace;
            ep = (!probot).ep }
         in
             begin
               nouveau_robot
             end

let r_translater = function
         (a,b) ->
         begin
           (!probot).x <- a(*(!probot).x +. ((float_of_int a)*.(valLgX()))*) ;
           (!probot).y <- b(*(!probot).y +. ((float_of_int b)*.(valLgY()))*) ;
         end
(*-------------------*)

let my_av = function                              (* avancer tout droit. *)
         robot ->
         let (dx,dy) =
             [|
             (0.,1.) ; (1.,1.) ; (1.,0.) ; (1.,-1.) ;
             (0.,-1.) ; (-1.,-1.) ;
             (-1.,0.) ; (-1.,1.)
             |].(my_valOrientation robot)
         in
         let nouveau_robot =
             {
             x = robot.x +. dx *. (valLgX ()) ;
             y = robot.y +. dy *. (valLgY ()) ;
             theta = robot.theta ;
             trace = robot.trace;
             ep = (!probot).ep
            }
         in
             begin
               nouveau_robot
             end


let r_av_effect = function
         () ->
         let (dx,dy,dl) =
             [|
             (0.,1.,valLgY) ;
             (1.,1.,valLgR) ;
             (1.,0.,valLgX) ;
             (1.,-1.,valLgR) ;
             (0.,-1.,valLgY) ;
             (-1.,-1.,valLgR) ;
             (-1.,0.,valLgX) ;
             (-1.,1.,valLgR)
             |].(valOrientation ())
         in
             begin

             lgTl := dl () ; (* mise a jour longueur de trace *)

             (!probot).x <- (!probot).x +. dx *. (valLgX ()) ;
             (!probot).y <- (!probot).y +. dy *. (valLgY ()) ;

             end
(*--------------------------------------------------------------------------*)
(* les tests de bord arrondissent la position : apres des rotations, un
   robot revenu sur le bord (eb) est a 25.998 au lieu de 26 et serait
   considere comme sorti (Rapporteur) *)
let arrondi = pixel

let my_tb = function                                 (* test de bord d'ecran*)
         robot ->
         let nouveau_robot = my_av robot
             in
             (not (testbornes
              (arrondi nouveau_robot.x)
              (arrondi nouveau_robot.y)
              ))

let tb = function
         () ->
         my_tb (!probot)
(*-------------------------------------------------*)
(* virage a droite  *)

let vd_cardinaux ()=                          (* si l'orientation de *)
    let tmp_robot = my_av (my_pqtd (my_lc (!probot)))(* depart est l'un des *)
    in                                        (* cardinaux.          *)
        let start_angle = (pixel (get_angle (!probot).theta))
        and end_angle = (pixel (get_angle (my_pdt tmp_robot).theta))
            in
            begin
              if (ts())                         (* on teste si le robot*)
              then                              (* est oriente vers le *)
                begin                           (* sud car alors l'arc *)
                  r_lc ();
                  r_phtd (); r_av_effect (); r_phtd () ;
                  r_bc ();
                  (pixel tmp_robot.x,    (* est trace depuis    *)
                   pixel tmp_robot.y,    (* 360 et pas          *)
                   pixel (valLgX ()),    (* start_angle = 0.    *)
                   pixel (valLgY ()),
                   start_angle,
                   360)

                end
              else
                begin                           (* le cas standard     *)
                  r_lc ();
                  r_phtd (); r_av_effect (); r_phtd () ;
                  r_bc ();
                  ((pixel tmp_robot.x),
                   (pixel tmp_robot.y),
                   (pixel (valLgX ())),
                   (pixel (valLgY ())),
                   start_angle,
                   end_angle)

                end

            end

(* pour la determination du centre (cas non cardinaux) *)
let dr = [| (0.,1.);(1.,1.);(1.,0.);(1.,-.1.);
            (0.,-.1.);(-.1.,-.1.);(-.1.,0.);(-.1.,1.) |]

(* les angles de la tangente pour un virage a droite *)
let vect_angle_droite = [| (0,0) ; (135,45) ; (0,0) ; (1,1) ;
                    (0,0) ; (315,225) ; (0,0) ; (135,225) |]

let vd_non_cardinaux n =                     (* si l'orientation de *)
    let tmp_robot = (my_pqtd (!probot))      (* depart n'est pas un *)
    in                                       (* des cardinaux.      *)
        let x0 = (valLgX())
        and y0 = (valLgY())
        and (cx,cy) = dr.(tmp_robot.theta)
        in
            let centre_x =                   (* determination du    *)
                (pixel (tmp_robot.x +.(* centre de l'ellipse.*)
                               cx *.
                               x0 /. 2.))
            and centre_y =
                (pixel (tmp_robot.y +.
                               cy *.
                               y0 /. 2.))
            in                               (* calcul des rayons.  *)
                let rx = (pixel (x0 /.sqrt 2.))
                and ry = (pixel (y0 /.sqrt 2.))
                in
                    if (n=0)                 (* determination angles*)
                    then                     (* cas standard.       *)

                      let (debut,fin)= vect_angle_droite.((!probot).theta)
                      in

                          begin
                            r_lc ();         (* positionnement robot*)
                            r_phtd (); r_av_effect (); r_phtd () ;
                            r_bc ();
                            (centre_x,       (* arguments draw_arc. *)
                             centre_y,
                             rx,
                             ry,
                             debut,
                             fin)
                      end
                    else
                      if (n=1)               (* cas ou l'arc doit   *)
                      then                   (* etre trace en deux  *)
                        begin                (* fois : passage par  *)
                          (centre_x,         (* l'angle 0.          *)
                           centre_y,
                           rx,
                           ry,
                           0,
                           45)
                        end
                      else
                        if (n=2)
                        then
                          begin
                                r_lc ();
                                r_phtd (); r_av_effect (); r_phtd ();
                                r_bc ();
                                (centre_x,
                                 centre_y,
                                 rx,
                                 ry,
                                 315,
                                 360)
                          end
                        else failwith "Appel illegal : vd_non_cardinaux"

(* test de bord pour un virage a droite *)
let tbvd () =
    let toto = my_av (my_phtd(!probot))
    in
        (not (testbornes (arrondi toto.x) (arrondi toto.y)))
(*-------------------------------------------------*)
(* virage a gauche  *)

let vg_cardinaux ()=                          (* si l'orientation de *)
    let tmp_robot = my_av (my_pqtg (my_lc (!probot)))(* depart est l'un des *)
    in                                        (* cardinaux.          *)
        let start_angle = (pixel (get_angle (!probot).theta))
        and end_angle = (pixel (get_angle (my_pdt tmp_robot).theta))
            in
            if (te())                         (* on teste si le robot*)
            then                              (* est oriente vers    *)
              begin                           (* Est car alors l'arc *)
                r_lc ();                      (* est trace depuis    *)
                r_phtg () ; r_av_effect () ; r_phtg () ;
                r_bc ();                      (* 360 et pas          *)
                (                             (* start_angle = 0 !   *)
                (pixel tmp_robot.x),
                (pixel tmp_robot.y),
                (pixel (valLgX ())),
                (pixel (valLgY ())),
                360,
                end_angle)

              end
            else
              begin                           (* le cas standard     *)
                r_lc ();
                r_phtg (); r_av_effect (); r_phtg ();
                r_bc ();
                (
                (pixel tmp_robot.x),
                (pixel tmp_robot.y),
                (pixel (valLgX ())),
                (pixel (valLgY ())),
                start_angle,
                end_angle)
              end

(* les angles de la tangente pour un virage a gauche *)
let vect_angle_gauche = [| (0,0) ; (1,1) ; (0,0) ; (315,225) ;
                    (0,0) ; (135,225) ; (0,0) ; (135,45) |]

let vg_non_cardinaux n =                     (* si l'orientation de *)
    let tmp_robot = (my_pqtg (!probot))      (* depart n'est pas un *)
    in                                       (* de cardinaux.       *)
        let x0 = (valLgX())
        and y0 = (valLgY())
        and (cx,cy) = dr.(tmp_robot.theta)   (*sgn cos&sin *)
        in
            let centre_x =                           (*X du centre *)
                (pixel (tmp_robot.x +.
                               cx *.
                               x0 /. 2.))
            and centre_y =                           (*Y du centre *)
                (pixel (tmp_robot.y +.
                               cy *.
                               y0 /. 2.))
            in
                let rx = (pixel (x0 /.sqrt 2.)) (* rayons   *)
                and ry = (pixel (y0 /.sqrt 2.)) (*          *)
                in
                    if (n=0)
                    then

                      let (debut,fin)= vect_angle_gauche.((!probot).theta)
                      in

                          begin
                            r_lc ();
                            r_phtg (); r_av_effect (); r_phtg () ;
                            r_bc ();
                            (centre_x,
                             centre_y,
                             rx,
                             ry,
                             debut,
                             fin)
                      end
                    else
                      if (n=1)
                      then
                        begin
                          (centre_x,
                           centre_y,
                           rx,
                           ry,
                           0,
                           45)
                        end
                      else
                        if (n=2)
                        then
                          begin
                                r_lc ();
                                r_phtg (); r_av_effect (); r_phtg ();
                                r_bc ();
                                (centre_x,
                                 centre_y,
                                 rx,
                                 ry,
                                 315,
                                 360)
                          end
                        else failwith "Appel illegal : vg_non_cardinaux"

(* test de bord pour un virage a gauche *)
let tbvg () =
    let toto = (my_av(my_phtg(!probot)))
    in
        not (testbornes (arrondi toto.x) (arrondi toto.y))
(*-------------------------------------------------------------------------*)
(* positionnement au centre et sur les bords du cadre *)

let r_ce x y =
    begin
      (!probot).x <- x ;
      (!probot).y <- y
    end

let r_tv z =
    (!probot).y <- z

let r_th z =
    (!probot).x <- z
