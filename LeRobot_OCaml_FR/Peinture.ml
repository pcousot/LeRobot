open Graphics
open Utile
open Graph

(* Remplissage par germes (seeds) d'une zone de couleur `fond`.
   (Les traces de mise au point commentees de la version Caml Light
   n'ont pas ete reprises.)                                               *)

(*------------------------------------------------------------------------*)
let seed_left = ref ([]: ((int*int*int*int)list))
let seed_right= ref ([]: ((int*int*int*int)list))
let seed_left_d = ref ([]: ((int*int*int*int)list))
let seed_right_d = ref ([]: ((int*int*int*int)list))
let boolup =ref (false : bool)
and booldown = ref (false : bool)
let boolupg =ref (false : bool)
and booldowng = ref (false : bool)

(* sequence test d'arret *)
let test_arret () =
    if (key_pressed())
    then
      let char = int_of_char (read_key())
      in
          begin
            if ((char = 27) || (char = 167) || (char = 35))
            then raise Stop
            else    ()
          end
    else    ()

let test_up a bp lg ld fond =

    test_arret ();

    if (point_color a bp = fond)
    then                        (* zone blanche *)
      begin
        if !boolup
        then                    (* on vient de quitter une zone noire *)
          begin
            boolup:= false;
            a
          end
        else                    (* on n'a pas encore atteint une z.n. *)
          begin
            lg
          end
      end
    else                        (* zone noire *)
      begin
        if !boolup
        then                    (* on evolue deja dans une zone noire *)
          begin
            a
          end
        else                    (* on atteint une zone noire *)
          begin
            if testbornes a bp
            then
              begin
                seed_left := (a-1,bp,lg,a-1)::(!seed_left);
                boolup:=true;         (* on indique l'entree en zone noire *)
                lg
              end
            else
              lg
          end
      end

let test_upg a bp lg ld fond =

    test_arret ();

    if (point_color a bp = fond)
    then                        (* zone blanche *)
      begin
        if !boolupg
        then                    (* on vient de quitter une zone noire *)
          begin
            boolupg:= false;
            a
          end
        else                    (* on n'a pas encore atteint une z.n. *)
          begin
            ld
          end
      end
    else                        (* zone noire *)
      begin
        if !boolupg
        then                    (* on evolue deja dans une zone noire *)
          begin
            boolupg:=true;
            a
          end
        else                    (* on atteint une zone noire *)
          begin
            if (testbornes a bp)
            then
              begin
                boolupg:=true;
                seed_right := (a+1,bp,a+1,ld)::(!seed_right);
                ld
              end
            else
              ld
          end
        (*boolupg:=true;*)         (* on indique l'entree en zone noire *)
      end

let test_down a bm lg ld fond =

    test_arret ();

    if (point_color a bm = fond) (*&& (testbornes a bm)*)
    then                        (* zone blanche *)
      begin
        if !booldown
        then                    (* on vient de quitter une zone noire *)
          begin
            booldown:= false;
            a
          end
        else                    (* on n'a pas encore atteint une z.n. *)
          begin
            lg
          end
      end
    else                        (* zone noire *)
      begin
        if !booldown
        then                    (* on evolue deja dans une zone noire *)
          begin
          end
        else                    (* on atteint une zone noire *)
          begin
            seed_left_d := (a-1,bm,lg,a-1)::(!seed_left_d);
            booldown:=true;         (* on indique l'entree en zone noire *)
          end;
          lg
      end

let test_downg a bm lg ld fond =

    test_arret ();

    if (point_color a bm = fond) (*&& (testbornes a bm)*)
    then                        (* zone blanche *)
      begin
        if !booldowng
        then                    (* on vient de quitter une zone noire *)
          begin
            booldowng:= false;
            a
          end
        else                    (* on n'a pas encore atteint une z.n. *)
          begin
            ld
          end
      end
    else                        (* zone noire *)
      begin
        if !booldowng
        then                    (* on evolue deja dans une zone noire *)
          begin
          end
        else                    (* on atteint une zone noire *)
          begin
            seed_right_d := (a+1,bm,a+1,ld)::(!seed_right_d)
          end;
        booldowng:=true;         (* on indique l'entree en zone noire *)
        ld
      end

(*------------------------------------------------------------------------*)
(*########################################################################*)
(*------------------------------------------------------------------------*)

let rec ad a b lg ld fond =

let rec cautious_ad a b lg lgd =     (* on evolue hors des limites *)

    if (point_color a b <> fond) || (not (testbornes a b))
    then                             (* on est dans un bord *)
      begin
          if (point_color a (b+1) = fond) && (not !boolup)
          then  (* on ne sort pas d'une zone noire *)
            begin
              if testbornes (a-1) (b+1) then
              seed_left := (a,b+1,lg ,a)::(!seed_left);
            end
          else  (* on sort d'une zone noire *)
            begin
              if !boolup
              then (* sortie effective *)
                begin
                end
              else (* noir au-dessus et le seed n'est pas place *)
                begin
                  seed_left := (a-1,b+1,lg,a-1)::(!seed_left);
                  boolup:= true
                end
          end; (*%%%%%%%%%%%%%%%%%*)
          if (point_color a (b-1) = fond) && (not !booldown)
          then  (* on ne sort pas d'une zone noire *)
            begin
              seed_left_d := (a,b-1,lgd ,a)::(!seed_left_d);
            end
          else  (* on sort d'une zone noire *)
            begin
              if !booldown
              then (* sortie effective *)
                begin
                end
              else (* noir au-dessus et le seed n'est pas place *)
                begin
                  seed_left_d := (a-1,b-1,lgd,a-1)::(!seed_left_d);
                  booldown:= true
                end
          end  (*%%%%%%%%%%%%%%%%%%%%*)
      end
    else                             (* on est en zone blanche *)
      begin
        plot a b;
        let tulg =  test_up a (b+1) lg a fond in
        let tdlg =  test_down a (b-1) lgd a fond in
        cautious_ad (a+1) b (*lg*) tulg tdlg;
      end

in

let rec fast_ad a b lg ld =
    let bp = b+1
    and ap = a+1
    in
        begin
              plot a b;
              if point_color a bp = fond   (* au-dessus c'est blanc *)
              then
                begin
                  if !boolup
                  then                     (* on vient de passer une noire *)
                    begin
                      boolup := false;
                      ad ap b a ld fond
                    end
                  else
                    begin
                      ad ap b lg ld fond   (* on continue normalement *)
                    end
                end
              else                         (* au-dessus c'est peint *)
                begin
                  if !boolup
                  then                     (* le seed est deja place *)
                    begin
                      ad ap b lg ld fond
                    end
                  else                     (* s'il faut placer le seed *)
                    begin
                      seed_left := (a-1,bp,lg,a-1)::(!seed_left);
                      boolup:=true;
                      ad ap b lg ld fond
                    end
                end
        end
in
begin
    test_arret ();
    if (a < ld)
    then begin fast_ad a b lg ld end
    else begin cautious_ad a b lg lg end
end
(*------------------------------------------------------------------------*)
let rec ag a b  lg ld fond =

let rec cautious_ag a b ld ldd =     (* on evolue hors des limites *)
    if (point_color a b <> fond) || (not (testbornes a b))
    then                             (* on est dans un bord *)
      begin
          if (point_color a (b+1) = fond) && (not !boolupg)
          then  (* on ne sort pas d'une zone noire *)
            begin
              if testbornes (a+1) (b+1) then
              seed_right := (a,b+1,a ,ld)::(!seed_right);
            end
          else  (* on sort peut-etre d'une zone noire *)
            begin
              if !boolupg
              then (*sortie effective *)
                begin
                end
              else (* noir au-dessus et le seed n'est pas place *)
                begin
                  seed_right := (a+1,b+1,a+1,ld)::(!seed_right);
                  boolupg:= true;
                end
            end; (*%%%%%%%%%%%%%%%%*)
          if (point_color a (b-1) = fond) && (not !booldowng)
          then  (* on ne sort pas d'une zone noire *)
            begin
              seed_right_d := (a,b-1,a ,ldd)::(!seed_right_d);
            end
          else  (* on sort peut-etre d'une zone noire *)
            begin
              if !booldowng
              then (*sortie effective *)
                begin
                end
              else (* noir au-dessus et le seed n'est pas place *)
                begin
                  seed_right_d := (a+1,b-1,a+1,ldd)::(!seed_right_d);
                  booldowng:= true;
                end
            end   (*%%%%%%%%%%%%%%%%%%%%%%%*)
      end
else
begin
      plot a b;
      let tuld =        test_upg a (b+1) a ld fond in
      let tdld =        test_downg a (b-1) a ldd fond in
      cautious_ag (a-1) b (*ld*) tuld tdld
end

in

let rec fast_ag a b (*bool*) lg ld =
    let bp = b+1
    and am = a-1
    in
        begin
              plot a b;
              if point_color a bp = fond   (* au-dessus c'est blanc *)
              then
                begin
                  if !boolupg
                  then                 (* on vient de passer sous une noire *)
                    begin
                      boolupg :=false;
                      ag am b lg a fond
                    end
                  else
                    begin
                      boolupg := false;
                      ag am b lg ld fond   (* on continue normalement *)
                    end
                end
              else                         (* au-dessus c'est peint *)
                begin
                  if !boolupg
                  then                     (* le seed est deja place *)
                    begin
                      boolupg:=true;
                      ag am b (*true false*) lg ld fond
                    end
                  else                     (* s'il faut placer le seed *)
                    begin
                      seed_right := (a+1,bp,a+1,ld)::(!seed_right);
                      boolupg:=true;
                      ag am b (*true*) lg (*am*) ld fond
                    end
                end
        end
in
begin
    test_arret ();
    if (a > lg)
    then begin fast_ag a b (*bool*) lg ld end
    else begin cautious_ag a b ld ld end
end

(*------------------------------------------------------------------------*)
let rec add a b lg ld fond =

let rec cautious_add a b lg lgd =     (* on evolue hors des limites *)
    if (point_color a b <> fond) || (not (testbornes a b))
    then                             (* on est dans un bord *)
      begin
          if (point_color a (b+1) = fond) && (not !boolup)
          then  (* on ne sort pas d'une zone noire *)
            begin
              seed_left := (a,b+1,lg ,a)::(!seed_left);
            end
          else  (* on sort d'une zone noire *)
            begin
              if !boolup
              then (* sortie effective *)
                begin
                end
              else (* noir au-dessus et le seed n'est pas place *)
                begin
                  seed_left := (a-1,b+1,lg,a-1)::(!seed_left);
                  boolup:= true
                end
          end; (*%%%%%%%%%%%%%%%%%*)
          if (point_color a (b-1) = fond) && (not !booldown)
          then  (* on ne sort pas d'une zone noire *)
            begin
              seed_left_d := (a,b-1,lgd ,a)::(!seed_left_d);
            end
          else  (* on sort d'une zone noire *)
            begin
              if !booldown
              then (* sortie effective *)
                begin
                end
              else (* noir au-dessus et le seed n'est pas place *)
                begin
                  seed_left_d := (a-1,b-1,lgd,a-1)::(!seed_left_d);
                  booldown:= true
                end
            end
      end
    else                             (* on est en zone blanche *)
      begin
        plot a b;
        let tulg =  test_up a (b+1) lg a fond in
        let tdlg =  test_down a (b-1) lgd a fond in
        cautious_add (a+1) b (*lg*) tulg tdlg;
      end

in

let rec fast_add a b lg ld =
    let bm = b-1
    and ap = a+1
    in
        begin
              plot a b;
              if point_color a bm = fond   (* au-dessus c'est blanc *)
              then
                begin
                  if !booldown
                  then                     (* on vient de passer une noire *)
                    begin
                      booldown := false;
                      add ap b a ld fond
                    end
                  else
                    begin
                      add ap b lg ld fond   (* on continue normalement *)
                    end
                end
              else                         (* au-dessus c'est peint *)
                begin
                  if !booldown
                  then                     (* le seed est deja place *)
                    begin
                      add ap b lg ld fond
                    end
                  else                     (* s'il faut placer le seed *)
                    begin
                      seed_left_d := (a-1,bm,lg,a-1)::(!seed_left_d);
                      booldown:=true;
                      add ap b lg ld fond
                    end
                end
        end
in
begin
    test_arret ();
    if (a < ld)
    then begin fast_add a b lg ld end
    else begin cautious_add a b lg lg end
end

(*-----------------------------------------------------------------------*)
let rec agd a b lg ld fond =

let rec cautious_agd a b ld ldd =     (* on evolue hors des limites *)
    if (point_color a b <> fond) || (not (testbornes a b))
    then                             (* on est dans un bord *)
      begin
          (*%%%%%%%%%%%%%%%%%%%%%%*)
          if (point_color a (b+1) = fond) && (not !boolupg)
          then  (* on ne sort pas d'une zone noire *)
            begin
              seed_right := (a,b+1,a ,ld)::(!seed_right);
            end
          else  (* on sort peut-etre d'une zone noire *)
            begin
              if !boolupg
              then (*sortie effective *)
                begin
                end
              else (* noir au-dessus et le seed n'est pas place *)
                begin
                  seed_right := (a+1,b+1,a+1,ld)::(!seed_right);
                  boolupg:= true;
                end
            end; (*%%%%%%%%%%%%%%%%*)
          if (point_color a (b-1) = fond) && (not !booldowng)
          then  (* on ne sort pas d'une zone noire *)
            begin
              seed_right_d := (a,b-1,a ,ldd)::(!seed_right_d);
              (*seed_left_d := (a,b-1,a ,ld)::(!seed_left_d);*)
            end
          else  (* on sort peut-etre d'une zone noire *)
            begin
              if !booldowng
              then (*sortie effective *)
                begin
                end
              else (* noir au-dessus et le seed n'est pas place *)
                begin
                  seed_right_d := (a+1,b-1,a+1,ldd)::(!seed_right_d);
                  booldowng:= true;
                end
            end
      end
else
begin
      plot a b;
      let tuld =        test_upg a (b+1) a ld fond in
      let tdld =        test_downg a (b-1) a ldd fond in
      cautious_agd (a-1) b (*ld*) tuld tdld
end

in

let rec fast_agd a b lg ld =
    let bm = b-1
    and am = a-1
    in
        begin
              plot a b;
              if point_color a bm = fond   (* en dessous c'est blanc *)
              then
                begin
                  if !booldowng
                  then                 (* on vient de passer sous une noire *)
                    begin
                      booldowng :=false;
                      agd am b lg a fond
                    end
                  else
                    begin
                      booldowng := false;
                      agd am b lg ld fond   (* on continue normalement *)
                    end
                end
              else                         (* au-dessus c'est peint *)
                begin
                  if !booldowng
                  then                     (* le seed est deja place *)
                    begin
                      booldowng:=true;
                      agd am b lg ld fond
                    end
                  else                     (* s'il faut placer le seed *)
                    begin
                      seed_right_d := (a+1,bm,a+1,ld)::(!seed_right_d);
                      booldowng:=true;
                      ag am b lg (*am*) ld fond   (* sic : ag, comme l'original *)
                    end
                end
        end
in
begin
    test_arret ();
    if (a > lg)
    then begin fast_agd a b lg ld end
    else begin cautious_agd a b ld ld end
end

(*#######################################################################
*)

let peindre fond robx roby =

let rec my_peindre (*a b*) ()  =

    if (!seed_right) <> []
    then
      let (x,y,xg,xd) = List.hd (!seed_right)
      in
          begin
            seed_right := List.tl (!seed_right);
            boolup := true; (* *) booldown := true;
            (*en_haut_a_droite*)ad  x y xg xd fond;
            my_peindre (*a b*) ()
          end
    else
      begin
        if (!seed_left) <> []
        then
          let (x,y,xg,xd) = List.hd (!seed_left)
          in
              begin
                seed_left := List.tl (!seed_left);
                boolupg := true; (* *) booldowng := true;
                (*en_haut_a_gauche*) ag x y xg xd fond;
                my_peindre (*a b*) ()
              end
        else
          begin
                if (!seed_right_d) <> []
                then
                  let (x,y,xg,xd) = List.hd (!seed_right_d)
                  in
                      begin
                        seed_right_d := List.tl (!seed_right_d);
                        boolup := true; (* *) booldown := true;
                        (*en_bas_a_droite*)add  x y xg xd fond;
                        my_peindre (*a b*) ()
                      end
                else
                  if (!seed_left_d) <> []
                  then
                  let (x,y,xg,xd) = List.hd (!seed_left_d)
                  in
                      begin
                        seed_left_d := List.tl (!seed_left_d);
                        boolupg := true; (* *) booldowng := true;
                        (*en_bas_a_gauche*)agd  x y xg xd fond;
                        my_peindre (*a b*) ()
                      end
          end
      end
in
begin
boolup := false;
boolupg:= false;
booldown := false;
booldowng:= false;
seed_left :=(if point_color (robx-1) roby = fond
             then  [robx-1 ,roby,robx-1,robx-1]
             else  []);
seed_right:= [robx,roby,robx,robx];
seed_left_d := [];
seed_right_d := [];
my_peindre (*0 0*) ()
end

(*------------------------------------------------------------------------*)
(* Remplissage par lignes (remplace l'algorithme par germes ci-dessus, qui
   laissait passer des zones : une ouverture sous une ligne deja peinte
   n'etait pas toujours suivie). L'image de la fenetre est lue une fois,
   le remplissage se fait en memoire, puis chaque segment est trace.      *)
let remplir fond x0 y0 =
  let w = size_x () and h = size_y () in
  let m = dump_image (get_image 0 0 w h) in     (* m.(ligne).(colonne)   *)
  let lit x y = m.(h - 1 - y).(x) in
  let peut x y =
    x >= 0 && x < w && y >= 0 && y < h && testbornes x y && lit x y = fond in
  (* on peint avec la couleur courante de Graphics (comme l'ancien
     algorithme) ; en memoire, les points peints sont marques d'une valeur
     differente du fond *)
  let marque = fond lxor 1 in
  (* le point courant (position du robot) est remis a la fin : sinon le
     trait suivant partirait du bout de la derniere ligne peinte *)
  let (px, py) = current_point () in
  set_line_width 1;
  let pile = Stack.create () in
  Stack.push (x0, y0) pile;
  while not (Stack.is_empty pile) do
    let (x, y) = Stack.pop pile in
    if peut x y then begin
      let g = ref x and d = ref x in
      while peut (!g - 1) y do decr g done;
      while peut (!d + 1) y do incr d done;
      for i = !g to !d do m.(h - 1 - y).(i) <- marque done;
      moveto !g y; lineto !d y;
      (* germes des lignes au-dessus et au-dessous *)
      List.iter (fun y' ->
          let dedans = ref false in
          for i = !g to !d do
            if peut i y' then
              (if not !dedans then (Stack.push (i, y') pile; dedans := true))
            else dedans := false
          done) [y + 1; y - 1]
    end
  done;
  moveto px py
