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

(*--------------------------------------------------------*)

val pi : float

val deg_to_rad : float -> float

val rad_to_deg : float -> float

val assoc_bool : 'a -> (('a -> bool) * 'b) list -> 'b

val normalise : float -> float

(*--------------------------------------------------------*)

exception Undefined_variable of string

exception Undefined_prim_op  of string

exception Type_mismatch      of string

exception Stop
