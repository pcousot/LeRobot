(*#######################################################################*)
(*#                                                                     #*)
(*#  LibRobot : la bibliotheque du robot pour les programmes du livre   #*)
(*#  "Premieres lecons de programmation en OCaml". Un programme         #*)
(*#  commence par  open LibRobot  et dispose alors de toutes les        #*)
(*#  commandes du robot (LeRobot), completees et corrigees ci-dessous   #*)
(*#  comme dans les unites Robot1, Robot2 et Robot3 de "Premieres       #*)
(*#  lecons de programmation en Turbo Pascal" (Macintosh, 1991).        #*)
(*#                                                                     #*)
(*#######################################################################*)

include LeRobot

open Graphics
open LeRobot

let () = Random.self_init ()

(* prive *) let enreg f = Principal.empile_fun f; f ()

(*-----------------------------------------------------------------------*)
(* Fonctions predefinies de Pascal absentes d'OCaml                      *)

let pi = Float.pi
let odd n = n land 1 = 1
let sqr (n : int) = n * n
let sqr_reel (x : float) = x *. x
let round x = int_of_float (Float.round x)

(* Random de la boite a outils du Macintosh : entier de -32767 a 32767 *)
let random () = Random.int 65535 - 32767

(* TickCount : nombre de soixantiemes de seconde ecoules *)
let tickCount () =
  int_of_float (Float.rem (Unix.gettimeofday () *. 60.) 1e9)

(* copy (s, debut, longueur) et pos (sous-chaine, chaine) de Turbo Pascal *)
let copy s i n =
  let l = String.length s in
  let i = max 1 i in
  if i > l || n <= 0 then "" else String.sub s (i - 1) (min n (l - i + 1))

let pos sub s =
  let n = String.length sub and l = String.length s in
  let rec cherche i =
    if i + n > l then 0
    else if String.sub s i n = sub then i + 1
    else cherche (i + 1)
  in
  if n = 0 then 0 else cherche 0

(* delete (s, debut, longueur) et insert (t, s, position) : en Pascal ce
   sont des procedures qui modifient s ; ici des fonctions qui rendent la
   nouvelle chaine :  s := delete !s i n *)
let delete s i n =
  let l = String.length s in
  if i < 1 || i > l || n <= 0 then s
  else String.sub s 0 (i - 1) ^ copy s (i + n) l

let insert t s i =
  let l = String.length s in
  let i = max 1 (min i (l + 1)) in
  String.sub s 0 (i - 1) ^ t ^ String.sub s (i - 1) (l - i + 1)

let maxInt = 32767                 (* entiers integer du Macintosh  *)
let maxLongint = 2147483647        (* entiers longint                *)

(*-----------------------------------------------------------------------*)
(* Orientations absolues (pour pivoter)                                  *)

let nord = 0 and nordEst = 1 and est = 2 and sudEst = 3
and sud = 4 and sudOuest = 5 and ouest = 6 and nordOuest = 7

(*-----------------------------------------------------------------------*)
(* Couleurs : comme en Turbo Pascal, cc et cf prennent un numero de      *)
(* couleur (indice dans la palette de Dessin.ml), et valCc rend ce       *)
(* numero. Ces constantes masquent les couleurs Graphics (rgb) de LeRobot.*)

let blanc = 0 and jaune = 1 and bleu = 2 and violet = 3
and vert = 4 and rouge = 5 and indigo = 6 and noir = 7

(*-----------------------------------------------------------------------*)
(* Initialisation : la grille du robot de Turbo Pascal mesure 12 pixels  *)
(* par defaut (30 dans LeRobot), et le robot part du centre ; ce ()      *)
(* place aussi le point courant de Graphics sous le robot (sinon le      *)
(* premier trait partirait du coin en bas a gauche).                     *)

let lgDefaut = 12.

let init_pict () =
  LeRobot.init_pict ();
  (match Sys.getenv_opt "LEROBOT_PROGRAMME" with
   | Some nom -> set_window_title nom
   | None -> ());
  lg lgDefaut;
  (* on dessine en noir : la couleur courante de LeRobot (jaune au depart)
     doit le dire, sinon peindre ne reconnait pas les traits noirs *)
  LeRobot.cc noir;
  ce ()

(*-----------------------------------------------------------------------*)
(* Temps                                                                 *)

let delai secondes =
  if secondes > 0. then Unix.sleepf secondes

let marquerUnePause = Principal.marquerUnePause

let heure h m s =
  let t = Unix.localtime (Unix.time ()) in
  h := t.Unix.tm_hour; m := t.Unix.tm_min; s := t.Unix.tm_sec

let date j m a =
  let t = Unix.localtime (Unix.time ()) in
  j := t.Unix.tm_mday; m := t.Unix.tm_mon + 1; a := t.Unix.tm_year + 1900

(*-----------------------------------------------------------------------*)
(* Sons : chaque son est un fichier WAV engendre une fois pour toutes    *)
(* dans le repertoire temporaire et joue par afplay (macOS) ; sans       *)
(* afplay, on attend simplement la duree du son.                         *)

(* LEROBOT_MUET=1 dans l'environnement : pas de son *)
let afplay =
  Sys.file_exists "/usr/bin/afplay" && Sys.getenv_opt "LEROBOT_MUET" = None

(* processus afplay en cours *)
let joueurs = ref []

let ramasser bloquant =
  joueurs := List.filter (fun pid ->
      try
        let p, _ = Unix.waitpid (if bloquant then [] else [Unix.WNOHANG]) pid in
        p = 0
      with Unix.Unix_error _ -> false) !joueurs

let lancer_afplay nom =
  ramasser false;
  let nul = Unix.openfile "/dev/null" [Unix.O_RDWR] 0 in
  let pid = Unix.create_process "/usr/bin/afplay" [| "afplay"; nom |]
      nul nul nul in
  Unix.close nul;
  joueurs := pid :: !joueurs

(* Les notes ne sont pas jouees une par une : afplay met un temps variable a
   demarrer (le rythme etait irregulier, surtout au debut des chansons). Les
   sons s'accumulent dans un tampon, joue d'un seul tenant par un seul
   afplay des que le programme fait autre chose que jouer des notes (une
   commande du robot, une lecture au clavier, st, la fin du programme) ; le
   programme attend alors la fin du morceau, comme avant. *)
let taux = 22050
let tampon = Buffer.create (taux * 2 * 10)
let duree_tampon = ref 0.
let fichiers_joues = ref []

let ajouter_son freq duree volume =
  let n = int_of_float (duree *. float_of_int taux) in
  let attaque = float_of_int taux *. 0.01 in
  for i = 0 to n - 1 do
    let t = float_of_int i /. float_of_int taux in
    (* petite enveloppe pour eviter les claquements *)
    let env = min 1. (min (float_of_int i /. attaque)
                         (float_of_int (n - i) /. attaque)) in
    let v = if freq <= 0. then 0.
      else volume *. env *. sin (2. *. Float.pi *. freq *. t) in
    Buffer.add_int16_le tampon (int_of_float (v *. 32000.))
  done;
  duree_tampon := !duree_tampon +. float_of_int n /. float_of_int taux

let ajouter_silence duree = ajouter_son 0. duree 0.

let vider_sons () =
  if Buffer.length tampon > 0 then begin
    let n = Buffer.length tampon / 2 in
    let nom = Filename.temp_file "lerobot" ".wav" in
    let oc = open_out_bin nom in
    let b = Buffer.create 44 in
    let u32 x = Buffer.add_int32_le b (Int32.of_int x)
    and u16 x = Buffer.add_uint16_le b x in
    Buffer.add_string b "RIFF"; u32 (36 + 2 * n); Buffer.add_string b "WAVE";
    Buffer.add_string b "fmt "; u32 16; u16 1; u16 1; u32 taux; u32 (2 * taux);
    u16 2; u16 16;
    Buffer.add_string b "data"; u32 (2 * n);
    Buffer.output_buffer oc b; Buffer.output_buffer oc tampon; close_out oc;
    Buffer.clear tampon;
    let d = !duree_tampon in
    duree_tampon := 0.;
    fichiers_joues := nom :: !fichiers_joues;
    lancer_afplay nom;
    Unix.sleepf d
  end

let () = Principal.avant_action := vider_sons

(* programme interrompu (Ctrl-C, kill) : arreter aussi le morceau en cours *)
let interrompu = ref false
let () =
  let arreter _ =
    interrompu := true;
    List.iter (fun pid -> try Unix.kill pid Sys.sigterm with _ -> ()) !joueurs;
    exit 1 in
  List.iter (fun sg -> try Sys.set_signal sg (Sys.Signal_handle arreter)
                       with _ -> ()) [Sys.sigint; Sys.sigterm; Sys.sighup]

(* Echap pendant le dessin leve Utile.Stop : c'est une fin normale du
   programme (code 0, sans "Fatal error"), pas une erreur *)
let () =
  let defaut = Printexc.default_uncaught_exception_handler in
  Printexc.set_uncaught_exception_handler (fun e bt ->
      match e with
      | Utile.Stop ->
        interrompu := true;
        (try close_graph () with _ -> ());
        exit 0
      | _ -> defaut e bt)

(* a la fin du programme : jouer ce qui reste, laisser les sons se terminer,
   puis effacer les fichiers WAV *)
let () = at_exit (fun () ->
    (try vider_sons () with _ -> ());
    ramasser true;
    List.iter (fun f -> try Sys.remove f with _ -> ()) !fichiers_joues)

let jouer_son freq duree volume =
  if duree > 0. then
    if afplay then ajouter_son freq duree volume else Unix.sleepf duree

(* une pause entre deux notes fait partie du morceau *)
let delai secondes =
  if secondes > 0. then
    if Buffer.length tampon > 0 then ajouter_silence secondes
    else Unix.sleepf secondes

(* bip et biiip sont des signaux : ils sonnent tout de suite (sinon un bip
   de refus pendant une lecture au clavier ne s'entendrait qu'apres) *)
let bip () = jouer_son 880. 0.12 0.5; vider_sons ()
let biiip () = jouer_son 880. 0.4 0.5; vider_sons ()

(* lecture d'un caractere dans la fenetre du robot : jouer d'abord les
   notes en attente *)
let lireCar () =
  (* comme Ecriture.lireCar (touche, ou '0' pour un clic), mais un clic ne
     compte que si le bouton s'enfonce pendant l'attente : XQuartz signale
     parfois un bouton enfonce alors qu'il ne l'est pas, et la question
     suivante recevait aussitot la reponse '0' (Addition_A_Completer) *)
  vider_sons ();
  let enfonce_au_debut = button_down () in
  let rec attendre n allume =
    Dessin.show_ret allume;
    if key_pressed () then read_key ()
    else begin
      let b = button_down () in
      if b && not enfonce_au_debut then begin
        while button_down () do Unix.sleepf 0.01 done; '0'
      end else begin
        Unix.sleepf 0.01;
        if n = 30 then attendre 0 (not allume) else attendre (n + 1) allume
      end
    end in
  attendre 0 true

(*-----------------------------------------------------------------------*)
(* Musique (Robot3) : note (hauteur, duree)                              *)
(* hauteur : demi-tons comptes a partir du do du milieu du piano         *)
(* duree   : en temps (noire = 1)                                        *)

(* hauteurs *)
let d0 = 0 and do0 = 0 and ut = 0 and re = 2 and mi = 4 and fa = 5
and sol = 7 and la = 9 and si = 11
let octave = 12
let diese = 1 and bemol = -1 and becarre = 0

(* durees des notes *)
let ronde = 4. and blanche = 2. and noire = 1. and croche = 0.5
and double_croche = 0.25 and triple_croche = 0.125
let ronde_pointee = 6. and blanche_pointee = 3. and noire_pointee = 1.5
and croche_pointee = 0.75 and double_croche_pointee = 0.375
let noire_en_triolet = 2. /. 3. and croche_en_triolet = 1. /. 3.
and blanche_en_triolet = 4. /. 3.

(* durees des silences *)
let pause = 4. and demi_pause = 2. and soupir = 1. and demi_soupir = 0.5
and quart_de_soupir = 0.25 and huitieme_de_soupir = 0.125
let soupir_pointe = 1.5 and demi_soupir_pointe = 0.75
and demi_pause_pointee = 3.

(* mouvements : nombre de noires par minute *)
let largo = 50 and larghetto = 60 and lento = 56 and adagio = 70
and andante = 85 and andantino = 95 and moderato = 110 and allegretto = 115
and allegro = 130 and vivace = 150 and presto = 175 and prestissimo = 200

(* nuances : volume de 1 a 9 *)
let pianississimo = 1 and pianissimo = 2 and piano = 3 and mezza_voce = 4
and mezzo_piano = 4 and mezzo_forte = 6 and forte = 7 and fortissimo = 8
and fortississimo = 9

let tempo = ref 100
let volume = ref 0.6

let metronome n = if n > 0 then tempo := n
let nuance n = volume := float_of_int (max 1 (min 9 n)) /. 10.

let duree_temps d = d *. 60. /. float_of_int !tempo

let note hauteur duree =
  let freq = 261.6256 *. (2. ** (float_of_int hauteur /. 12.)) in
  let d = duree_temps duree in
  (* note legerement detachee *)
  jouer_son freq (d *. 0.9) !volume;
  if afplay then ajouter_silence (d *. 0.1) else Unix.sleepf (d *. 0.1)

let silence duree =
  if afplay then ajouter_silence (duree_temps duree)
  else Unix.sleepf (duree_temps duree)

(*-----------------------------------------------------------------------*)
(* Ecriture de texte a la position du robot                              *)

let normal = 0 and gras = 1 and italique = 2 and souligne = 4
and contour = 8 and ombre = 16 and condense = 32 and etendu = 64

let style = ref normal

(* le style ne peut pas etre change avec Graphics : sans effet *)
let styleTexte s = style := s

(* policeTexte et tailleTexte sont sans effet sous XQuartz *)
let police = ref "courier"
let policeTexte p = police := p
let valPoliceTexte () = !police

let courier = "courier" and geneva = "geneva" and monaco = "monaco"
and chicago = "chicago" and newYork = "new york" and times = "times"
and helvetica = "helvetica"

(* Les chaines sont en UTF-8, Graphics affiche des octets latin-1. *)
let latin1 s =
  let b = Buffer.create (String.length s) in
  let d = String.get_utf_8_uchar in
  let rec boucle i =
    if i < String.length s then begin
      let u = d s i in
      let c = Uchar.to_int (Uchar.utf_decode_uchar u) in
      Buffer.add_char b (if c < 256 then Char.chr c else '?');
      boucle (i + Uchar.utf_decode_length u)
    end
  in
  boucle 0; Buffer.contents b

(* Le texte part de la position du robot ; si le robot regarde vers
   l'ouest (on ecrit a gauche d'un point : pw; lc; av; ecrire ...), il
   est aligne a droite et finit a la position du robot. La police de
   XQuartz est plus large que celle du Macintosh (Times 9) : sans cela
   le texte deborderait sur le point et sur son voisin. *)
let ecrire s =
  Principal.wait ();
  enreg (fun () ->
      let t = latin1 s in
      let x = Robot.pixel (valX ()) and y = Robot.pixel (valY ()) in
      let x = if valOrientation () = ouest then x - fst (text_size t) else x in
      Principal.draw false;
      let (cx, cy) = current_point () in
      moveto x y; draw_string t; moveto cx cy;
      Principal.draw true)

let message s = LeRobot.message (latin1 s)

(*-----------------------------------------------------------------------*)
(* Lectures (readln, lireEntier, ...) : sur le Macintosh, la question et *)
(* la reponse etaient dans la fenetre texte de Pascal. Ici la question   *)
(* (le texte ecrit par write sur la ligne en cours) s'affiche aussi dans *)
(* la barre du bas de la fenetre du robot, et la reponse peut etre tapee *)
(* dans cette fenetre (Entree pour valider, retour arriere pour          *)
(* corriger) ou dans le terminal : la premiere des deux est prise.       *)

let ligne_en_cours = Buffer.create 80

(* sortie_terminal := false : rien n'est ecrit dans le terminal (programme
   dont tout le dialogue est dans la fenetre du robot) *)
let sortie_terminal = ref true

(* lignes ecrites depuis la derniere lecture : elles s'affichent avec la
   question dans la barre du bas ("Erreur, ... Recommencer...", le bilan
   final suivi de "Terminer en tapant la touche 'Retour-chariot'.") *)
let lignes_ecrites = ref []

let write l =
  List.iter (fun t ->
      if !sortie_terminal then print_string t;
      Buffer.add_string ligne_en_cours t) l;
  if !sortie_terminal then flush stdout
let writeln l =
  if !sortie_terminal then begin List.iter print_string l; print_newline () end;
  Buffer.add_string ligne_en_cours (String.concat "" l);
  if Buffer.length ligne_en_cours > 0 then
    lignes_ecrites := Buffer.contents ligne_en_cours :: !lignes_ecrites;
  Buffer.clear ligne_en_cours

let entree_fermee = ref false
let fenetre_ouverte () = try ignore (size_x ()); true with _ -> false

(* caractere Latin-1 (read_key) -> UTF-8 *)
let utf8_car c =
  let n = Char.code c in
  if n < 128 then String.make 1 c
  else
    let b = Bytes.create 2 in
    Bytes.set b 0 (Char.chr (0xC0 lor (n lsr 6)));
    Bytes.set b 1 (Char.chr (0x80 lor (n land 0x3F)));
    Bytes.to_string b

let lire_ligne () =
  vider_sons ();
  if not (fenetre_ouverte ()) then
    (try read_line () with End_of_file -> exit 0)
  else begin
    let invite =
      (* au plus les deux dernieres lignes ecrites, puis la question *)
      let dernieres = match !lignes_ecrites with
        | a :: b :: _ -> [a; b] | l -> l in
      String.concat " " (List.rev (Buffer.contents ligne_en_cours
                                   :: dernieres)) in
    let tape = ref [] in              (* caracteres tapes, a l'envers *)
    let texte () = String.concat "" (List.rev !tape) in
    let rec attendre () =
      if key_pressed () then `Touche (read_key ())
      else if not !entree_fermee
           && (match Unix.select [Unix.stdin] [] [] 0.02 with
               | [], _, _ -> false | _ -> true
               (* interrompu par un signal (Graphics) : rien a lire *)
               | exception Unix.Unix_error (Unix.EINTR, _, _) -> false)
      then `Terminal
      else begin
        if !entree_fermee then Unix.sleepf 0.02;
        attendre ()
      end in
    let rec boucle () =
      message (invite ^ texte () ^ "_");
      match attendre () with
      | `Terminal ->
        (match read_line () with
         | l -> l
         | exception End_of_file -> entree_fermee := true; boucle ())
      | `Touche ('\r' | '\n' | '\003') ->
        let l = texte () in
        if !sortie_terminal then print_endline l;
        l
      | `Touche ('\b' | '\127') ->
        (match !tape with _ :: r -> tape := r | [] -> ()); boucle ()
      | `Touche c when Char.code c >= 32 -> tape := utf8_car c :: !tape; boucle ()
      | `Touche _ -> boucle ()
    in
    let l = boucle () in
    Buffer.clear ligne_en_cours;
    lignes_ecrites := [];
    message "";
    l
  end

let readln () = ignore (lire_ligne ())

(* nombres : les touches de la rangee du haut d'un clavier AZERTY (sans
   majuscule) valent les chiffres *)
let chiffres_azerty s =
  let table = [ "&", "1"; "\xc3\xa9", "2"; "\"", "3"; "'", "4"; "(", "5";
                "\xc2\xa7", "6"; "\xc3\xa8", "7"; "!", "8"; "\xc3\xa7", "9";
                "\xc3\xa0", "0" ] in
  let remplacer a b t =
    let la = String.length a and r = Buffer.create (String.length t) in
    let i = ref 0 in
    while !i < String.length t do
      if !i + la <= String.length t && String.sub t !i la = a
      then (Buffer.add_string r b; i := !i + la)
      else (Buffer.add_char r t.[!i]; incr i)
    done;
    Buffer.contents r in
  List.fold_left (fun t (a, b) -> remplacer a b t) s table

let rec lireEntier () =
  match int_of_string_opt (String.trim (chiffres_azerty (lire_ligne ()))) with
  | Some n -> n
  | None -> write ["Entrer un nombre entier : "]; lireEntier ()

let rec lireReel () =
  match float_of_string_opt (String.trim (chiffres_azerty (lire_ligne ()))) with
  | Some x -> x
  | None -> write ["Entrer un nombre : "]; lireReel ()

let lireChaine () = lire_ligne ()

let lireCaractere () =
  let s = lire_ligne () in if s = "" then '\r' else s.[0]

(*-----------------------------------------------------------------------*)
(* Entrees-sorties de Pascal (fenetre texte) : le terminal               *)

let modeTexte () = flush stdout
let modeDessin () = ()
let effacerTexte () = print_string "\027[2J\027[H"; flush stdout


(*-----------------------------------------------------------------------*)
(* Divers                                                                *)

let ecranNoirEtBlanc () = false

(*-----------------------------------------------------------------------*)
(* Interaction (Robot3)                                                  *)
(* interactionTP x y c coordonnees pivotements dessin finsouris sauver   *)
(* Le robot suit la souris case par case (les fleches le deplacent d'un  *)
(* carreau) ; l'interaction se termine par                              *)
(* un clic (si finsouris), par la touche Entree ou par toute touche qui  *)
(* n'est pas une commande du robot. Au retour, x et y                    *)
(* contiennent la translation totale du robot (en carreaux de grille) et *)
(* c le dernier caractere frappe.                                        *)

let interactionTP x y c coordonnees pivotements dessin finsouris sauver =
  let tx = ref 0 and ty = ref 0 in
  let vitesse = valVt () in
  vt 10;
  let ancien = !Principal.coord in
  Principal.coord := coordonnees;
  Principal.draw false; Principal.draw true;
  let deplace (a, b) =
    try translater (a, b); tx := !tx + a; ty := !ty + b
    with Principal.Range_error _ -> Son.bipbip ()   (* le robot proteste *)
  in
  let fin = ref false in
  c := ' ';
  while not !fin do
    let rxp = valX () +. valLgX () /. 2. and ryp = valY () +. valLgY () /. 2.
    and rxn = valX () -. valLgX () /. 2. and ryn = valY () -. valLgY () /. 2. in
    let e = Fleches.attendre () in
    if e.keypressed && Fleches.deplacement e.key <> (0, 0) then
      (* les fleches deplacent le robot d'un carreau *)
      deplace (Fleches.deplacement e.key)
    else if e.keypressed then begin
      c := e.key;
      match e.key with
      | '\r' | '\n' -> fin := true
      | '\027' -> fin := true
      | 'd' when pivotements -> phtd ()
      | '+' when pivotements -> pqtd ()
      | 'g' when pivotements -> phtg ()
      | '-' when pivotements -> pqtg ()
      | 'a' when pivotements && dessin -> av ()
      | ')' when pivotements && dessin -> vd ()
      | '(' when pivotements && dessin -> vg ()
      | 'l' when pivotements && dessin -> lc ()
      | 'b' when pivotements && dessin -> bc ()
      | 'p' when pivotements && dessin -> dp ()
      | 'c' when pivotements && dessin -> dc ()
      | '.' when pivotements && dessin -> dg ()
      (* toute autre touche termine l'interaction et est rendue dans c
         (Addition_A_Completer : on designe une case et on tape le chiffre) *)
      | _ -> fin := true
    end
    else if e.button && finsouris then begin
      (* attendre que le bouton soit relache *)
      while button_down () do Unix.sleepf 0.01 done;
      fin := true
    end
    else begin
      let mx = float_of_int e.mouse_x and my = float_of_int e.mouse_y in
      let dx = if mx > rxp then 1 else if mx < rxn then -1 else 0
      and dy = if my > ryp then 1 else if my < ryn then -1 else 0 in
      if dx <> 0 || dy <> 0 then deplace (dx, dy)
    end
  done;
  Principal.coord := ancien;
  Principal.draw false; Principal.draw true;
  vt vitesse;
  x := !tx; y := !ty

(*-----------------------------------------------------------------------*)
(* Ensembles de caracteres (set of char) : listes de caracteres          *)

let intervalle a b =
  List.init (max 0 (Char.code b - Char.code a + 1))
    (fun i -> Char.chr (Char.code a + i))

(*-----------------------------------------------------------------------*)
(* Deplacements absolus dans le repere cartesien de la grille, avec des  *)
(* coordonnees reelles (Deplacer et Tracer de Turbo Pascal) :            *)
(*   deplacerReel (x, y)  place le robot au point (x, y) sans tracer,    *)
(*   tracerReel (x, y)    l'y amene en tracant si le crayon est baisse.  *)
(* (le tracer de LeRobot prend des coordonnees en pixels)                *)

let point_reel x y =
  (float_of_int !Graph.centrex +. x *. valLgX (),
   float_of_int !Graph.centrey +. y *. valLgY ())

let aller trace (x, y) =
  Principal.wait ();
  enreg (fun () ->
      let (a, b) = point_reel x y in
      Principal.draw false;
      moveto (Robot.pixel (valX ())) (Robot.pixel (valY ()));
      set_line_width (valEc ());
      if trace && valBc ()
      then Principal.trait (Robot.pixel a) (Robot.pixel b)
      else moveto (Robot.pixel a) (Robot.pixel b);
      Robot.r_ce a b;
      Principal.draw true)

let deplacerReel = aller false
let tracerReel = aller true

(* rt (Turbo Pascal) : le robot tourne de t degres (sens direct) en
   gardant la longueur de son pas : lgY s'il regarde au nord ou au sud,
   lgX a l'est ou a l'ouest, la diagonale du carreau sinon. Le rt de
   LeRobot prend toujours la diagonale, sqrt 2 fois trop longue apres
   lg l (RTsuccessifs : lg 50; pe; av puis ce; rt 15; av doit tracer des
   rayons de longueur 50). En arrivant sur une direction cardinale, le
   pas dans cette direction est aussi garde (grille carree de cote r). *)
let rt t =
  let o = valOrientation () in
  let r = if o mod 4 = 0 then valLgY ()
          else if o mod 2 = 0 then valLgX ()
          else valLgR () in
  if r < 1e-6 then LeRobot.rt t
  else begin
    let lt = valLgT () in
    let a0 = [| 90.; lt; 0.; 360. -. lt; 270.; 180. +. lt; 180.; 180. -. lt |].(o) in
    let a = Float.rem (a0 +. t) 360. in
    let a = if a < 0. then a +. 360. else a in
    let a = if 360. -. a < 1e-9 then 0. else a in
    let proche x = abs_float (a -. x) < 1e-9 in
    if proche 0. then (lg r; pe ())
    else if proche 90. then (lg r; pn ())
    else if proche 180. then (lg r; pw ())
    else if proche 270. then (lg r; ps ())
    else if a < 90. then (lgRT (r, a); pne ())
    else if a < 180. then (lgRT (r, 180. -. a); pnw ())
    else if a < 270. then (lgRT (r, a -. 180.); psw ())
    else (lgRT (r, 360. -. a); pse ())
  end

(* dp : LeRobot ne dessine qu'un pixel, quelle que soit l'epaisseur du
   crayon. Le crayon du Macintosh est un carre : dp trace un carre de cote
   ec (PavageDiscretCarresCouleur : ec 15 sur une grille de 19, des carres
   separes). Avec le crayon normal (ec 1), un pixel (courbes tracees point
   par point : CourbeDeMoritz) ; avec ec 2, un disque un peu plus gros
   que le carre, pour que le point du Morse se voie (CodeMorse1). *)
let dp () =
  Principal.wait ();
  enreg (fun () ->
      Principal.draw false;
      let x = Robot.pixel (valX ()) and y = Robot.pixel (valY ()) in
      let e = valEc () in
      if e <= 1 then plot x y
      else if e = 2 then fill_circle x y 3
      else fill_rect (x - e / 2) (y - e / 2) e e;
      Principal.draw true)

(*-----------------------------------------------------------------------*)
(* Fin de programme : un programme Pascal qui se termine sans st (par    *)
(* exemple apres une chanson) laisserait la fenetre se fermer aussitot ; *)
(* on attend qu'une touche soit frappee ou que l'on clique.              *)

(* Mode verification (verifier.sh) : la variable LEROBOT_VERIFIER donne
   le fichier des remarques. A la fin du dessin (st, ou fin du programme)
   on repond dans la fenetre du robot :
     Entree        correct                  (code de sortie 0)
     r             relancer le programme    (code 11)
     q ou Echap    arreter la verification  (code 12)
     autre touche  debut d'une remarque, terminee par Entree, notee dans
                   le fichier                (code 10)                  *)

let verifie = ref false

let utf8_of_latin1 s =
  let b = Buffer.create (String.length s) in
  String.iter (fun c -> Buffer.add_utf_8_uchar b (Uchar.of_int (Char.code c))) s;
  Buffer.contents b

let verifier fichier =
  verifie := true;
  let consigne =
    "Entree : correct   r : relancer   q : quitter   autre touche : remarque" in
  Ecriture.message consigne;
  let rec touche () = (wait_next_event [Key_pressed]).key in
  let fin code = (try close_graph () with _ -> ()); exit code in
  match touche () with
  | '\r' | '\n' -> fin 0
  | 'r' -> fin 11
  | 'q' | '\027' -> fin 12
  | c ->
    let rem = Buffer.create 80 in
    let rec saisir c =
      (match c with
       | '\b' | '\127' ->
         if Buffer.length rem > 0 then Buffer.truncate rem (Buffer.length rem - 1)
       | c when Char.code c >= 32 -> Buffer.add_char rem c
       | _ -> ());
      Ecriture.message ("Remarque (Entree pour finir, Echap pour annuler) : "
                        ^ Buffer.contents rem);
      match touche () with
      | '\r' | '\n' -> ()
      | '\027' -> Buffer.clear rem
      | c -> saisir c
    in
    saisir c;
    if Buffer.length rem = 0 then begin
      (* remarque annulee : on redemande *)
      verifie := false; ()
    end else begin
      let nom = Option.value (Sys.getenv_opt "LEROBOT_PROGRAMME")
          ~default:Sys.executable_name in
      let oc = open_out_gen [Open_append; Open_creat] 0o644 fichier in
      output_string oc (nom ^ " : " ^ utf8_of_latin1 (Buffer.contents rem) ^ "\n");
      close_out oc;
      fin 10
    end

let rec st () =
  vider_sons ();
  match Sys.getenv_opt "LEROBOT_VERIFIER" with
  | Some fichier -> Principal.wait (); verifier fichier; st ()
  | None -> LeRobot.st ()

let () =
  at_exit (fun () ->
      (try vider_sons () with _ -> ());
      let ouverte = try ignore (size_x ()); true with _ -> false in
      if ouverte && not !verifie && not !interrompu then
        try
          if Sys.getenv_opt "LEROBOT_VERIFIER" <> None then st ();
          Ecriture.message "Fin du programme : taper une touche ou cliquer";
          while not (key_pressed () || button_down ()) do Unix.sleepf 0.02 done;
          close_graph ()
        with _ -> ())

(*-----------------------------------------------------------------------*)
(* La fenetre du robot s'ouvre des le debut du programme : un programme du
   livre commence directement par ses commandes (av (); pqtd (); ...). *)
let () = init_pict ()
