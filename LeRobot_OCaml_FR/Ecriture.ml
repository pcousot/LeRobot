(*-----------------------------------------------------------------------*)
(* Robot : Ecriture dans la fenetre graphique                            *)
(* -- corps --  Ecriture.ml                                              *)
(*-----------------------------------------------------------------------*)
open Printf
open Graphics
open Principal
open Graph
open Dessin

let entierEnChaine = string_of_int

let reelEnChaine = function
         n -> sprintf "%1.4e" n

let booleenEnChaine = function
         b -> if b then "Vrai" else "Faux"

let concat = String.concat ""
(* *)
(* spec modifiee : format argument*)
(* *)
let ecrire = function
         chaine -> let (x,y) = current_point ()
                   in
                      begin draw_string chaine;
                            moveto x y
                      end

let refpol = ref ("" : string)
and reftaille = ref (0 : int)

let policeTexte = function
         police -> try
                   begin
                     set_font police;
                     refpol := police
                   end
                   with (Graphic_failure msg) -> begin print_string
                                                         ("policeTexte :"^msg);
                                                       flush stdout
                                                 end

let tailleTexte = function
         taille -> set_text_size taille;
                   reftaille := taille

let valPoliceTexte () = !refpol

let valTailleTexte () = !reftaille


let effacerMessage () =
    begin
      Graph.my_clear_bar (true);
      Graph.draw_bar_border ();
      moveto 2 Graph.yTexteBar
    end

let message = function
         chaine -> let (x,y) = current_point ()
                   in
                      begin
                        effacerMessage ();
                        valM := chaine;
                        draw_string chaine;
                        moveto x y
                      end

let valMessage () = !valM
(*-----------------------------------------------------------------------*)
(* Lecture d'un caractere.                                               *)

(*### modif de la spec : on renvoie directement un char, pas de variable.*)
let lireCar () =
let rec mp n bool =
    begin
      show_ret (bool);
      if (key_pressed ())
      then read_key ()
      else
        begin
          if (button_down ())
          then '0'
          else
            begin
              Unix.sleepf 0.01;    (* clignotement visible (~0,3 s) *)
              if (n  = 30)
              then mp 0 (not bool)
              else mp (n+1) bool
            end
        end
    end
in
    mp 0 true
