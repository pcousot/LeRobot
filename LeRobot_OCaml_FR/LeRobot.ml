(* prive *) let wait =  Principal.wait   (* prive *)

(* Les commandes de dessin sont enregistrees (comme le fait Dessiner) pour
   que st () puisse rejouer le dessin quand on change la vitesse ; dans la
   version de 1998 la liste restait vide et le dessin disparaissait.     *)
(* prive *) let enreg f = Principal.empile_fun f; f ()
let valVt () = Principal.valVt()
let vt = Principal.vt
let pp = Principal.pp
let ex = Principal.ex

let lg  n = wait (); enreg (fun () -> Principal.lg n)
let lgX n = wait (); enreg (fun () -> Principal.lgX n)
let lgY n = wait (); enreg (fun () -> Principal.lgY n)
let lgRT (n,m) = wait (); enreg (fun () -> Principal.lgRT (n,m))
let dg    () = wait (); enreg Principal.dg
let pn    () = wait (); enreg Principal.pn
let pne   () = wait (); enreg Principal.pne
let pe    () = wait (); enreg Principal.pe
let pse   () = wait (); enreg Principal.pse
let ps    () = wait (); enreg Principal.ps
let psw   () = wait (); enreg Principal.psw
let pw    () = wait (); enreg Principal.pw
let pnw   () = wait (); enreg Principal.pnw
let pivoter n = wait (); enreg (fun () -> Principal.pivoter n)
let rt   n = wait (); enreg (fun () -> Principal.rt n)
let phtd  () = wait (); enreg Principal.phtd
let pqtd  () = wait (); enreg Principal.pqtd
let p3htd  () = wait (); enreg Principal.p3htd
let phtg  () = wait (); enreg Principal.phtg
let pqtg  () = wait (); enreg Principal.pqtg
let p3htg  () = wait (); enreg Principal.p3htg
let pdt   () = wait (); enreg Principal.pdt
let av    () = wait (); enreg Principal.av
let vd    () = wait (); enreg Principal.vd
let vg    () = wait (); enreg Principal.vg
let avf n = wait (); enreg (fun () -> Principal.avf n)
let tracer (n,m) = wait (); enreg (fun () -> Principal.tracer (n,m))
let translater (n,m) = wait (); enreg (fun () -> Principal.translater (n,m))
let deplacer (n,m) = wait (); enreg (fun () -> Principal.deplacer (n,m))
let tl n = wait (); enreg (fun () -> Principal.tl n)
let ce  () = wait (); enreg Principal.ce
let eh  () = wait (); enreg Principal.eh
let eb  () = wait (); enreg Principal.eb
let ad  () = wait (); enreg Principal.ad
let ag  () = wait (); enreg Principal.ag
let bc  () = wait (); enreg Principal.bc
let lc  () = wait (); enreg Principal.lc
let dc  () = wait (); enreg Principal.dc
let dp  () = wait (); enreg Principal.dp
let valLgTl       () = wait (); Principal.valLgTl ()
let cf n = enreg (fun () -> Principal.cf n)
let valCf = Principal.valCf
let montrerRobot  () = wait (); enreg Principal.montrerRobot
let cacherRobot   () = wait (); enreg Principal.cacherRobot
let valVisible    () = wait (); Principal.valVisible ()
let autoriserSorties  () = wait (); enreg Principal.autoriserSorties
let interdireSorties  () = wait (); enreg Principal.interdireSorties
let valAutoriserSorties  () = wait (); Principal.valAutoriserSorties ()
let st       () = wait (); Principal.st ()
let peindre  () = wait (); enreg Principal.peindre
(*-----------------------------------------------------------------------*)
let entierEnChaine  = Ecriture.entierEnChaine
let reelEnChaine    = Ecriture.reelEnChaine
let booleenEnChaine = Ecriture.booleenEnChaine
let concat = Ecriture.concat
let policeTexte = Ecriture.policeTexte
let tailleTexte = Ecriture.tailleTexte
(* let styleTexte *)
let valPoliceTexte = Ecriture.valPoliceTexte
let valTailleTexte = Ecriture.valTailleTexte
(* let val StyleTexte *)
let message = Ecriture.message
let effacerMessage = Ecriture.effacerMessage
let valMessage = Ecriture.valMessage
let lireCar = Ecriture.lireCar
(*-----------------------------------------------------------------------*)
let valEc  () = wait (); Robot.valEc()
let valX   () = wait (); Robot.valX()
let valY   () = wait (); Robot.valY()
let valBc  () = wait (); Robot.valBc()
let valOrientation  () = wait (); Robot.valOrientation()
let ec n = wait (); enreg (fun () -> Robot.ec n)
let tn   () = wait (); Robot.tn()
let tne  () = wait (); Robot.tne()
let te   () = wait (); Robot.te()
let tse  () = wait (); Robot.tse()
let ts   () = wait (); Robot.ts()
let tsw  () = wait (); Robot.tsw()
let tw   () = wait (); Robot.tw()
let tnw  () = wait (); Robot.tnw()
let tb   () = wait (); Robot.tb()
let lgTl = Robot.lgTl
(*-----------------------------------------------------------------------*)
let blanc  = Dessin.blanc
let gris   = Dessin.gris
let rouge  = Dessin.rouge
let bleu   = Dessin.bleu
let vert   = Dessin.vert
let violet = Dessin.violet
let noir   = Dessin.noir
let indigo = Dessin.indigo
let jaune  = Dessin.jaune
let cc n = enreg (fun () -> Dessin.cc n)
let valCc = Dessin.valCc
(*-----------------------------------------------------------------------*)
let init_pict  () = wait (); Graph.init_pict()
let mementoCommandesClavier = Graph.mementoCommandesClavier
(*-----------------------------------------------------------------------*)
let valLgX  () = wait (); Grille.valLgX()
let valLgY  () = wait (); Grille.valLgY()
let valLgR  () = wait (); Grille.valLgR()
let valLgT  () = wait (); Grille.valLgT()
(*-----------------------------------------------------------------------*)
let interaction = Interaction.interaction

