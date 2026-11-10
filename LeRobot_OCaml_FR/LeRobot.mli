(*#######################################################################*)
(*#                                                                     #*)
(*#  BIBLIOTHEQUE ROBOT                                                 #*)
(*#                                                                     #*)
(*#  Interface                                                          #*)
(*#                                                                     #*)
(*#######################################################################*)

open Graphics

(*-----------------------------------------------------------------------*)
(* Robot : Fonctions utilisateur                                         *)
(* -- interface --  Principal.mli                                        *)
(*-----------------------------------------------------------------------*)
(******************************* Grille **********************************)
(* Entree des valeurs                                                    *)

val lg   : float -> unit                      (* Longueur des cotes *)
                                                   (* d'un carreau grille*)

val lgX  : float -> unit                      (* Longueur abscisse  *)
                                                   (* d'un carreau grille*)

val lgY  : float -> unit                      (* Longueur ordonnee  *)
                                                   (* d'un carreau grille*)

val lgRT : float * float -> unit              (* Definition par les *)
                                                   (* coordonnees polaires*)
                                                   (* format (r,theta)   *)
(*-----------------------------------------------------------------------*)
(* Affichage                                                             *)

val dg : unit -> unit                         (* Dessine la grille. *)

(****************************** Robot ************************************)
(* Rotations absolues                                                    *)

val pn  : unit -> unit                        (* Nord               *)

val pne : unit -> unit                        (* Nord-est           *)

val pe  : unit -> unit                        (* Est                *)

val pse : unit -> unit                        (* Sud-est            *)

val ps  : unit -> unit                        (* Sud                *)

val psw : unit -> unit                        (* Sud-ouest          *)

val pw  : unit -> unit                        (* Ouest              *)

val pnw : unit -> unit                        (* Nord-ouest         *)

val pivoter : int -> unit                     (* pivoter vers...    *)

val rt : float -> unit                        (* rotation avec      *)
                                                   (* modif du repere.   *)
(*-----------------------------------------------------------------------*)
(* Operations de deplacements relatifs : rotations                       *)

val phtd  : unit -> unit                      (* Huitieme de tour   *)
                                                   (* a droite.          *)

val pqtd  : unit -> unit                      (* Quart de tour      *)
                                                   (* a droite.          *)

val p3htd : unit -> unit                      (* 3 huitiemes de tour*)
                                                   (* a droite.          *)

val phtg  : unit -> unit                      (* Huitieme de tour   *)
                                                   (* a gauche.          *)

val pqtg  : unit -> unit                      (* Quart de tour      *)
                                                   (* a gauche.          *)

val p3htg : unit -> unit                      (* 3 huitiemes de tour*)
                                                   (* a gauche.          *)

val pdt   : unit -> unit                      (* Demi-tour.         *)
(*-----------------------------------------------------------------------*)
(* Operations de deplacements relatifs : translations...                 *)

val av  : unit -> unit                        (* Avancer.           *)

val vd  : unit -> unit                        (* Virage a droite.   *)

val vg  : unit -> unit                        (* Virage a gauche.   *)

val avf : int -> unit                         (* Avancer n fois.    *)
(*-----------------------------------------------------------------------*)
(* Deplacements absolus                                                  *)

val tracer : (int*int) -> unit                (* Place, en tracant  *)
                                                   (* le cas echeant, le *)
                                                   (* robot en (a,b).    *)

val translater : (int*int) -> unit            (* translate de dX dY *)
                                                   (* sans tracer.       *)


val tl : float -> unit                        (* translate de l pts *)
                                                   (* + modifie repere.  *)
(*-----------------------------------------------------------------------*)
(* Positionnement au centre et sur les bords                             *)

val ce : unit -> unit                         (* au centre.         *)

val eh : unit -> unit                         (* en haut.           *)

val eb : unit -> unit                         (* en bas.            *)

val ad : unit -> unit                         (* a droite.          *)

val ag : unit -> unit                         (* a gauche.          *)
(*-----------------------------------------------------------------------*)
(* Positionnement sur une grille munie d'un repere cartesien.            *)

val deplacer : int*int -> unit                (* place le robot en  *)
                                                   (* (x,y) du repere.   *)
(*-----------------------------------------------------------------------*)
(* Operations sur le crayon                                              *)

val bc : unit -> unit                        (* Baisser le crayon.  *)

val lc : unit -> unit                        (* Lever le crayon.    *)

val dc : unit -> unit                        (* Dessiner un +.      *)

val dp : unit -> unit                        (* Dessiner un point.  *)

val cc : int  -> unit                        (* selection couleur.  *)

val valCc : unit -> int                      (* couleur du crayon.  *)
(*-----------------------------------------------------------------------*)
(* Longueur du dernier trace                                             *)

val valLgTl : unit -> float
(*-----------------------------------------------------------------------*)
(* Mise au point du programme                                            *)
val cf : int -> unit                         (*init+couleur de fond.*)

val valCf : unit -> int                      (* couleur de fond.    *)

val montrerRobot : unit -> unit              (* robot visible.      *)

val cacherRobot  : unit -> unit              (* robot invisible.    *)

val valVisible   : unit -> bool              (* robot visible ?     *)

val autoriserSorties : unit -> unit          (* sortie possible.    *)

val interdireSorties : unit -> unit          (* sortie impossible.  *)

val valAutoriserSorties : unit -> bool       (* sortie possible ?   *)

val pp : unit -> unit                        (* mode pas a pas.     *)

val ex : unit -> unit                        (* execution normale.  *)

val vt : int -> unit                         (* selection vitesse.  *)

val valVt : unit -> int                      (* consultation vitesse*)
(*-----------------------------------------------------------------------*)
(* Arret                                                                 *)

val st : unit -> unit                        (* arret du programme. *)
(*-----------------------------------------------------------------------*)
(* Peinture                                                              *)

val peindre : unit -> unit                    (* peinture.           *)
(*-----------------------------------------------------------------------*)
(* Robot : definition, operations relatives, crayon et tests             *)
(* -- interface --  Robot.mli                                            *)
(*-----------------------------------------------------------------------*)

(*-----------------------------------------------------------------------*)
(* Consultation de valeurs                                               *)

val valEc : unit -> int                       (* epaisseur crayon. *)
val valX  : unit -> float                      (* abscisse robot.   *)
val valY  : unit -> float                      (* ordonnee robot.   *)
(*-----------------------------------------------------------------------*)
(* Operations sur le crayon                                              *)

val valBc : unit -> bool                      (* teste le crayon.   *)
val ec : int -> unit                          (* epaisseur crayon.  *)
(*-----------------------------------------------------------------------*)
(* Consultation de l'orientation                                         *)

val valOrientation : unit -> int             (* Valeur de l'orient.*)
                                                  (* 0=N, 1=NE, 2=E...  *)

(*-----------------------------------------------------------------------*)
(* Tests sur l'orientation du robot                                      *)

val tn  : unit -> bool                       (* Nord ?             *)

val tne : unit -> bool                       (* Nord-est ?         *)

val te  : unit -> bool                       (* Est ?              *)

val tse : unit -> bool                       (* Sud-est ?          *)

val ts  : unit -> bool                       (* Sud ?              *)

val tsw : unit -> bool                       (* Sud-ouest ?        *)

val tw  : unit -> bool                       (* Ouest ?            *)

val tnw : unit -> bool                       (* Nord-ouest ?       *)
(*-----------------------------------------------------------------------*)
(* test de bord de cadre                                                 *)

val tb : unit -> bool                        (* true si av() sort.  *)
(*-----------------------------------------------------------------------*)
(* Robot : Description des dessins                                       *)
(* -- interface --  Dessin.mli                                           *)
(*-----------------------------------------------------------------------*)
val blanc : color
val gris : color
val rouge  : color
val bleu : color
val vert : color
val violet : color
val noir : color
val indigo : color
val jaune  : color
(*-----------------------------------------------------------------------*)
(* Robot : Initialisations graphiques                                    *)
(* -- interface -- Graph.mli                                             *)
(*-----------------------------------------------------------------------*)

val init_pict : unit -> unit
(*-----------------------------------------------------------------------*)
(* Robot : Description de la grille                                      *)
(* -- interface --  Grille.mli                                           *)
(*-----------------------------------------------------------------------*)

(*-----------------------------------------------------------------------*)
(* Consultation des valeurs                                              *)

val valLgX : unit -> float                    (* Largeur du cote.   *)

val valLgY : unit -> float                    (* hauteur du cote.   *)

val valLgR : unit -> float                    (* long. de diagonale.*)

val valLgT : unit -> float                    (* angle de diagonale.*)

(*-----------------------------------------------------------------------*)
(* Ecriture dans la fenetre du robot.                                    *)

val entierEnChaine : int -> string            (* conversion.        *)

val reelEnChaine : float -> string            (* conversion.        *)

val booleenEnChaine : bool -> string          (* conversion.        *)

val concat : string list -> string            (* ["a";"b"..]->"ab.."*)

val policeTexte : string -> unit              (* selection police.  *)

val tailleTexte : int -> unit                 (* selection taille.  *)

(*
val styleTexte :                                 (* selection style.   *)
*)

val valPoliceTexte : unit -> string           (* police actuelle.   *)

val valTailleTexte : unit -> int              (* taille actuelle.   *)

(*
val valStyleTexte :                              (* style actuel.      *)
*)
(*-----------------------------------------------------------------------*)
(* Ecriture dans la barre de messages au bas de la fenetre graphique.    *)

val mementoCommandesClavier : string          (* rappel commandes.  *)

val message : string -> unit                  (* affichage message. *)

val effacerMessage : unit -> unit             (* nettoyage message. *)

val valMessage : unit -> string               (* message actuel.    *)
(*-----------------------------------------------------------------------*)
(* Lecture d'un caractere dans la fenetre graphique.                     *)

val lireCar : unit -> char                    (* caractere frappe.  *)
(*-----------------------------------------------------------------------*)
(* Interaction.                                                          *)

val interaction : bool*bool*bool*bool*bool -> unit
