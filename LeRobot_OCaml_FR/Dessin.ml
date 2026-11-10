(*-----------------------------------------------------------------------*)
(* Robot : Description des dessins                                       *)
(* -- corps --  Dessin.ml                                                *)
(*-----------------------------------------------------------------------*)

open Graphics
open Graph

(*------------------------------------------------------------------------*)
(* les couleurs                                                           *)

let blanc = rgb 255 255 255
let gris = rgb 50 50 50
let rouge = rgb 255 1 1              (* *)
let bleu = rgb 1 1 255               (* *)
let vert = rgb 1 255 1               (* *)
let violet = rgb 255 1 255           (* *)
let noir = rgb 0 0 0
let indigo = rgb 100 1 100           (* *)
let jaune = rgb 255 255 1            (* *)

(*-----------------------------------------------------------------------*)
(* Dessin du robot                                                       *)

(* Facteur d'agrandissement du robot : chaque pixel des dessins ci-dessous
   est affiche comme un carre echelleRobot x echelleRobot (1 a l'origine). *)
let echelleRobot = 3

let agrandir k m =
    Array.init (k * Array.length m)
      (fun i -> let ligne = m.(i / k) in
                Array.init (k * Array.length ligne) (fun j -> ligne.(j / k)))

let image_robot m = make_image (agrandir echelleRobot m)

let robN = image_robot
    [|
    [| transp; transp; transp;   noir; transp; transp; transp |];
    [| transp; transp;   noir;   noir;   noir; transp; transp |];
    [| transp;   noir;   noir; transp;   noir;   noir; transp |];
    [|   noir;   noir; transp; transp; transp;   noir;   noir |];
    [| transp;   noir;   noir; transp;   noir;   noir; transp |];
    [|   noir;   noir;   noir; transp;   noir;   noir;   noir |]
    |]

let robS = image_robot
    [|
    [|   noir;   noir;   noir; transp;   noir;   noir;   noir |];
    [| transp;   noir;   noir; transp;   noir;   noir; transp |];
    [|   noir;   noir; transp; transp; transp;   noir;   noir |];
    [| transp;   noir;   noir; transp;   noir;   noir; transp |];
    [| transp; transp;   noir;   noir;   noir; transp; transp |];
    [| transp; transp; transp;   noir; transp; transp; transp |]
    |]

let robE = image_robot
    [|
    [|   noir; transp;   noir; transp; transp; transp |];
    [|   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir;   noir; transp;   noir;   noir; transp |];
    [| transp; transp; transp; transp;   noir;   noir |];
    [|   noir;   noir; transp;   noir;   noir; transp |];
    [|   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir; transp;   noir; transp; transp; transp |]
    |]

let robO = image_robot
    [|
    [| transp; transp; transp;   noir; transp;   noir |];
    [| transp; transp;  noir;   noir;   noir;   noir  |];
    [| transp;   noir;   noir; transp;   noir;   noir |];
    [|   noir;   noir; transp; transp; transp; transp |];
    [| transp;   noir;   noir; transp;   noir;   noir |];
    [| transp; transp;   noir;   noir;   noir;   noir |];
    [| transp; transp; transp;   noir; transp;   noir |]
    |]

let robNE = image_robot
    [|
    [| transp; transp;   noir;   noir;   noir;   noir;   noir |];
    [| transp; transp;   noir; transp; transp; transp;   noir |];
    [|   noir;   noir;   noir; transp; transp; transp;   noir |];
    [| transp;   noir; transp; transp; transp; transp;   noir |];
    [| transp; transp; transp; transp;   noir;   noir;   noir |];
    [| transp; transp; transp;   noir;   noir; transp; transp |];
    [| transp; transp; transp; transp;   noir; transp; transp |]
    |]

let robSE = image_robot
    [|
    [| transp; transp; transp; transp;   noir; transp; transp |];
    [| transp; transp; transp;   noir;   noir; transp; transp |];
    [| transp; transp; transp; transp;   noir;   noir;   noir |];
    [| transp;   noir; transp; transp; transp; transp;   noir |];
    [|   noir;   noir;   noir; transp; transp; transp;   noir |];
    [| transp; transp;   noir; transp; transp; transp;   noir |];
    [| transp; transp;   noir;   noir;   noir;   noir;   noir |]
    |]

let robNO = image_robot
    [|
    [|   noir;   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir; transp; transp; transp;   noir; transp; transp |];
    [|   noir; transp; transp; transp;   noir;   noir;   noir |];
    [|   noir; transp; transp; transp; transp;   noir; transp |];
    [|   noir;   noir;   noir; transp; transp; transp; transp |];
    [| transp; transp;   noir;   noir; transp; transp; transp |];
    [| transp; transp;   noir; transp; transp; transp; transp |]
    |]

let robSO = image_robot
    [|
    [| transp; transp;   noir; transp; transp; transp; transp |];
    [| transp; transp;   noir;   noir; transp; transp; transp |];
    [|   noir;   noir;   noir; transp; transp; transp; transp |];
    [|   noir; transp; transp; transp; transp;   noir; transp |];
    [|   noir; transp; transp; transp;   noir;   noir;   noir |];
    [|   noir; transp; transp; transp;   noir; transp; transp |];
    [|   noir;   noir;   noir;   noir;   noir; transp; transp |];
    |]

(*-----------------------------------------------------------------------*)

let robNt = image_robot
    [|
    [| transp; transp; transp;   noir; transp; transp; transp |];
    [| transp; transp;   noir;   noir;   noir; transp; transp |];
    [| transp;   noir;   noir;   noir;   noir;   noir; transp |];
    [|   noir;   noir;   noir;   noir;   noir;   noir;   noir |];
    [| transp;   noir;   noir;   noir;   noir;   noir; transp |];
    [|   noir;   noir;   noir;   noir;   noir;   noir;   noir |]
    |]

let robSt = image_robot
    [|
    [|   noir;   noir;   noir;   noir;   noir;   noir;   noir |];
    [| transp;   noir;   noir;   noir;   noir;   noir; transp |];
    [|   noir;   noir;   noir;   noir;   noir;   noir;   noir |];
    [| transp;   noir;   noir;   noir;   noir;   noir; transp |];
    [| transp; transp;   noir;   noir;   noir; transp; transp |];
    [| transp; transp; transp;   noir; transp; transp; transp |]
    |]

let robEt = image_robot
    [|
    [|   noir; transp;   noir; transp; transp; transp |];
    [|   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir;   noir;   noir;   noir;   noir; transp |];
    [|   noir;   noir;   noir;   noir;   noir;   noir |];
    [|   noir;   noir;   noir;   noir;   noir; transp |];
    [|   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir; transp;   noir; transp; transp; transp |]
    |]

let robOt = image_robot
    [|
    [| transp; transp; transp;   noir; transp;   noir |];
    [| transp; transp;   noir;   noir;   noir;   noir |];
    [| transp;   noir;   noir;   noir;   noir;   noir |];
    [|   noir;   noir;   noir;   noir;   noir;   noir |];
    [| transp;   noir;   noir;   noir;   noir;   noir |];
    [| transp; transp;   noir;   noir;   noir;   noir |];
    [| transp; transp; transp;   noir; transp;   noir |]
    |]

let robNEt = image_robot
    [|
    [| transp; transp;   noir;   noir;   noir;   noir;   noir |];
    [| transp; transp;   noir;   noir;   noir;   noir;   noir |];
    [|   noir;   noir;   noir;   noir;   noir;   noir;   noir |];
    [| transp;   noir;   noir;   noir;   noir;   noir;   noir |];
    [| transp; transp;   noir;   noir;   noir;   noir;   noir |];
    [| transp; transp; transp;   noir;   noir; transp; transp |];
    [| transp; transp; transp; transp;   noir; transp; transp |]
    |]

let robSEt = image_robot
    [|
    [| transp; transp; transp; transp;   noir; transp; transp |];
    [| transp; transp; transp;   noir;   noir; transp; transp |];
    [| transp; transp;   noir;   noir;   noir;   noir;   noir |];
    [| transp;   noir;   noir;   noir;   noir;   noir;   noir |];
    [|   noir;   noir;   noir;   noir;   noir;   noir;   noir |];
    [| transp; transp;   noir;   noir;   noir;   noir;   noir |];
    [| transp; transp;   noir;   noir;   noir;   noir;   noir |]
    |]

let robNOt = image_robot
    [|
    [|   noir;   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir;   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir;   noir;   noir;   noir;   noir;   noir;   noir |];
    [|   noir;   noir;   noir;   noir;   noir;   noir; transp |];
    [|   noir;   noir;   noir;   noir;   noir; transp; transp |];
    [| transp; transp;   noir;   noir; transp; transp; transp |];
    [| transp; transp;   noir; transp; transp; transp; transp |]
    |]

let robSOt = image_robot
    [|
    [| transp; transp;   noir; transp; transp; transp; transp |];
    [| transp; transp;   noir;   noir; transp; transp; transp |];
    [|   noir;   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir;   noir;   noir;   noir;   noir;   noir; transp |];
    [|   noir;   noir;   noir;   noir;   noir;   noir;   noir |];
    [|   noir;   noir;   noir;   noir;   noir; transp; transp |];
    [|   noir;   noir;   noir;   noir;   noir; transp; transp |];
    |]

let indice = ref (1 : int)

let indicepp () =
    indice:= (!indice + 1) mod 8 ;
    !indice

let color_vect = [|blanc;jaune;bleu;violet;vert;rouge;indigo;noir|]

let valCc = function
         () -> !indice

let cc = function
         n ->
         begin set_color (color_vect.(n));
               indice := n
         end

let robColor () =
    let toto = color_vect.(!indice)
    in
        [|
        [| transp; transp; transp;   toto; transp; transp; transp |];
        [| transp; transp;   toto;   toto;   toto; transp; transp |];
        [| transp;   toto;   toto;   toto;   toto;   toto; transp |];
        [|   toto;   toto;   toto;   toto;   toto;   toto;   toto |];
        [| transp;   toto;   toto;   toto;   toto;   toto; transp |];
        [|   toto;   toto;   toto;   toto;   toto;   toto;   toto |]
      |]

let return bool =
    let o = (if bool then noir else blanc)
    and t = transp
    in
        [|
        [| t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; o; o; o; o; o; t; t; t; t; t |];
        [| t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; t; t; t; t; t; o; o; t; t; t |];
        [| t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; o; o; o; o; o; t; t; o; t; t |];
        [| t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; o; t; o; t |];
        [| t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; t; o |];
        [| t; t; t; t; o; o; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; t; o |];
        [| t; t; t; o; t; o; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; t; o |];
        [| t; t; o; t; o; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; o; t; o; t |];
        [| t; o; t; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; t; t; o; t; t |];
        [| o; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; o; o; t; t; t |];
        [| t; o; t; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; o; t; t; t; t; t |];
        [| t; t; o; t; o; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t |];
        [| t; t; t; o; t; o; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t |];
        [| t; t; t; t; o; o; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t; t |];
      |]


let show_color () = draw_image (make_image (robColor ()) ) (!xshow) (!yshow)

let show_ret bool = draw_image (make_image (return bool))
                    (size_x () - !bsupx - 20) ((hBar - 14)/2)

let cdef () =
begin
  set_color (color_vect.(indicepp ()));

  show_color ()
end

let current_color () = color_vect.(!indice)
