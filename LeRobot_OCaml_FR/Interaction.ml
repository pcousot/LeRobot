(*-------------------------------------------------------------------*)
(* Robot : Gestion d'interaction                                     *)
(* -- corps -- Interaction.ml                                        *)
(*-------------------------------------------------------------------*)

open Graphics

open Utile
open Grille
open Dessin
open Robot
open Graph
open Principal
open Ecriture
(*-----------------------------------------------------------------------*)

let lpivot =
[
(* PIVOTEMENTS  *)
('d' , function a -> begin empile_fun  phtd  ;
                           empile_str "phtd();"   ;
                           phtd a end);
('+' , function a -> begin empile_fun  pqtd ;
                           empile_str "pqtd();"   ;
                           pqtd a end);
('g' , function a -> begin empile_fun  phtg   ;
                           empile_str "phtg();"   ;
                           phtg a end);
('-' , function a -> begin empile_fun  pqtg   ;
                           empile_str "pqtg();"   ;
                           pqtg a end)
   ]
(*--------------*)

let nom_couleur n =
    [|"blanc";"jaune";"bleu";"violet";"vert";"rouge";"indigo";"noir"|].(n)

let ldessin =
[
(* GRILLE       *)
('.' , function a -> begin empile_fun  dg  ;
                           empile_str "dg();"   ;
                           dg a end);
(* DEPLACEMENTS *)
('a' , function a -> begin av a ;
                           empile_fun  av ;
                           empile_str "av();"
                           end);
(')' , function a -> begin vd a ;
                           empile_fun  vd   ;
                           empile_str "vd();"
                           end);
('(' , function a -> begin vg a ;
                           empile_fun  vg   ;
                           empile_str "vg();"
                           end);

(* FLECHES *)
(*
(??? , function a -> begin empile "translater (?,?);"; translater (?,?) end)
(??? , function a -> begin empile "translater (?,?);"; translater (?,?) end)
(??? , function a -> begin empile "translater (?,?);"; translater (?,?) end)
(??? , function a -> begin empile "translater (?,?);"; translater (?,?) end)
*)

(* CRAYON       *)
('l' , function a -> begin empile_fun  lc  ;
                           empile_str "lc();"   ;
                           lc a end);
('b' , function a -> begin empile_fun  bc   ;
                           empile_str "bc();"   ;
                           bc a end);
('p' , function a -> begin empile_fun  dp   ;
                           empile_str "dp();"   ;
                           dp a end);
('c' , function a -> begin empile_fun  dc   ;
                           empile_str "dc();"   ;
                           dc a end);
(* COULEURS     *)
('*' , function a -> begin cdef a ;
                           (* enregistrer la couleur choisie : elle est
                              rejouee apres un effacement et sauvee dans
                              mon_dessin.ml (cc prend le numero 0..7) *)
                           let n = valCc ()
                           in
                               begin
                                 empile_fun (fun () -> Dessin.cc n) ;
                                 empile_str ("cc "^(string_of_int n)^
                                             " (* "^nom_couleur n^" *);")
                               end
                           end);
(* PEINTURE : la zone fermee derriere le robot, couleur du crayon *)
('w' , function a -> begin peindre a ;
                           empile_fun  peindre ;
                           empile_str "peindre();"
                           end);
(* ERREURS      *)
('\008' , function a-> begin cf(valCf());undo a end)
   ]
(*--------------*)

let linter = [
(* ARRET        *)
('\013' , function a -> begin raise Stop end);
  ]
(*--------------*)

let bl bool = function
         l -> if bool
              then l
              else []
(*-----------------------------------------------------------------------*)


let translation_totale = ref ((0,0): int*int)

let trans (a,b) =
    let (u,v)= !translation_totale
    in
        begin
          translater (a,b);
          translation_totale:= (u+a,v+b)
        end

let t (u,v) () =
        begin
          translater (u,v)
        end

let testeny my ryp ryn =                          (* teste la difference *)
      if (my > ryp)                               (* en ordonnee entre   *)
                then trans      (0,1)             (* robot et souris     *)
                else
                if (my < ryn)
                  then trans    (0,-1)



let interaction (coordonnees,pivotements,dessin,finsouris,sauver) =

(* *)let interagit () =
(* *)let listop = (bl pivotements lpivot)
(* *)             @(bl (pivotements && dessin) ldessin)
(* *)             @linter
(* *)in

    let (rxp,ryp) = (int_of_float ((valX()) +. (valLgX())/.2.) , (* un   *)
                     int_of_float ((valY()) +. (valLgY())/.2.) ) (* peu  *)
    and (rxn,ryn) = (int_of_float ((valX()) -. (valLgX())/.2.) , (* de   *)
                     int_of_float ((valY()) -. (valLgY())/.2.) ) (* marge*)
    and motion = Fleches.attendre ()   (* wait_next_event, et les fleches *)
    in
        (* fleche : le robot se deplace d'un carreau sans tracer, comme
           avec la souris (translater, enregistre avec la commande
           suivante) *)
        if motion.keypressed && Fleches.deplacement motion.key <> (0, 0)
        then
          begin
            try trans (Fleches.deplacement motion.key)
            with Range_error msg ->
              Son.bipbip (); print_string (" ** SORTIE INTERDITE ** "^msg); print_newline ()
          end
        else
        if (motion.keypressed)                    (* action : commande   *)
        then
          begin
            let (a,b) = !translation_totale
            in
                begin
                  (* effacement (retour arriere) : le deplacement a la
                     souris pas encore enregistre est abandonne, sinon
                     c'est lui qui serait efface et non la derniere
                     commande ; le redessin remet le robot a sa place *)
                  if motion.key = '\008'
                  then translation_totale := (0,0)
                  else
                  if (a,b)<>(0,0)
                  then
                    begin
                      empile_fun (t (a,b))  ;
                      empile_str ("translater ("^(string_of_int a)^","
                                  ^(string_of_int b)^");")   ;
                      translation_totale:= (0,0)
                    end;
                  try
                      (List.assoc (motion.key) listop) ()
                  with Not_found -> ()            (* commande inconnue.  *)
                    | Range_error msg ->          (* bord trop pres.     *)
                      begin
                        Son.bipbip (); print_string (" ** SORTIE INTERDITE ** "^msg);
                        print_newline()
                      end
                end
          end
        else                                      (* action : souris     *)

(* *)      if finsouris && (motion.button)
(* *)      then raise Stop
(* *)      else

          (* un clic (ou un deplacement bouton enfonce) amene le robot,
             sans tracer, au point d'arret de la grille le plus proche de
             la souris ; bouton relache, le robot reste en place. Si
             finsouris, le bouton termine l'interaction : le robot suit
             alors la souris pas a pas, bouton relache, comme en 1998. *)
          try
            if not finsouris
            then
              begin
                if motion.button
                then
                  let vers m r lg =
                      int_of_float (Float.round ((float_of_int m -. r) /. lg))
                  in
                      let dx = vers motion.mouse_x (valX ()) (valLgX ())
                      and dy = vers motion.mouse_y (valY ()) (valLgY ())
                      in
                          if (dx,dy) <> (0,0) then trans (dx,dy)
              end
            else
              if (motion.mouse_x > rxp)           (* teste la difference *)
              then                                (* en abscisse puis    *)
                begin                             (* appelle le test pour*)
                  trans      (1,0);               (* la difference en    *)
                  testeny motion.mouse_y ryp ryn  (* ordonnee.           *)
                end
              else
                if (motion.mouse_x < rxn)
                then
                  begin
                    trans    (-1,0);
                    testeny motion.mouse_y ryp ryn
                  end
                else
                  testeny motion.mouse_y ryp ryn

          with Range_error msg ->
                               begin
                                Son.bipbip (); print_string (" ** SORTIE INTERDITE ** "^msg);
                                print_newline()
                               end

(* *)in let inter () =
(* *)   begin
(* *)     coord := coordonnees;
(* *)     sauvegarde := (sauver && dessin);
(* *)     try
(* *)       while true do interagit () done
(* *)     with Stop -> begin
(* *)                    empile_fun st ;
(* *)                    empile_str "st()"   ;
(* *)                    st ()
(* *)                  end
(* *)   end
(* *)
(* *) in
begin
 try
cf 0;
inter();
flush stdout
with Stop -> close_graph ();
             print_newline();
             flush stdout

end
