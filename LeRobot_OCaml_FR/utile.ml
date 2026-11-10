(* En OCaml, les types et exceptions declares dans utile.mli doivent
   aussi etre definis ici. *)
type valeur =
    Val_int       of int
  | Val_float     of float
  | Val_bool      of bool
  | Val_paire     of valeur * valeur
  | Val_fermeture of fermeture
  | Val_primop    of (valeur -> valeur)
  | Val_unit      of unit

and fermeture =
    { contexte : environnement;
      def      : fonction
    }

and expression =
    Var      of string
  | Int      of int
  | Float    of float
  | Bool     of bool
  | Unit
  | Paire    of expression * expression
  | Fonction of fonction
  | Prim_op  of prim
  | App      of expression * expression

and fonction =
    { arg   : string;
      corps : expression
    }

and environnement = (string * valeur) list

and prim = string

type top_expression =
    Def  of string * expression
  | Expr of expression

exception Undefined_variable of string
exception Undefined_prim_op  of string
exception Type_mismatch      of string
exception Stop

(*--------------------------------------------------------*)

let pi = 3.1415926535

let deg_to_rad = function
         x -> x *. pi /. 180.

let rad_to_deg = function
         x -> x *. 180. /. pi

let rec assoc_bool a = function
         (f,v)::reste ->
                if f a
                then v
                else assoc_bool a reste
       | [] -> failwith "echec assoc_bool <utile>"

let rec normalise a =
    if (abs_float a) > 360.
    then
      begin
        if a > 0.
        then
          normalise (a -. 360.)
        else
          normalise (a +. 360.)
      end
    else
      a
