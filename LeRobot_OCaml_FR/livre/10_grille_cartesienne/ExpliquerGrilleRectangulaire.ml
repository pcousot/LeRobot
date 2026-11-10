open LibRobot

(* Figure du livre : effet de av, vd et vg dans les
   huit directions avec une grille 30 x 60 *)

let () =
  lgX 30.; lgY 60.; dg ();
  message "Grille rectangulaire 30 x 60";
  marquerUnePause ();
  message "AV dans la direction N"; marquerUnePause ();
  av (); ce (); phtd ();
  message "AV dans la direction NE"; marquerUnePause ();
  av (); ce (); phtd ();
  message "AV dans la direction E"; marquerUnePause ();
  av (); ce (); phtd ();
  message "AV dans la direction SE"; marquerUnePause ();
  av (); ce (); phtd ();
  message "AV dans la direction S"; marquerUnePause ();
  av (); ce (); phtd ();
  message "AV dans la direction SW"; marquerUnePause ();
  av (); ce (); phtd ();
  message "AV dans la direction W"; marquerUnePause ();
  av (); ce (); phtd ();
  message "AV dans la direction NW"; marquerUnePause ();
  av ();
  ce (); translater (-3, 0);
  message "VD dans la direction N"; pn ();
  marquerUnePause (); vd (); ce (); translater (-3, 0);
  message "VD dans la direction NE"; pne ();
  marquerUnePause (); vd (); ce (); translater (-3, 0);
  message "VD dans la direction E"; pe ();
  marquerUnePause (); vd (); ce (); translater (-3, 0);
  message "VD dans la direction SE"; pse ();
  marquerUnePause (); vd (); ce (); translater (-3, 0);
  message "VD dans la direction S"; ps ();
  marquerUnePause (); vd (); ce (); translater (-3, 0);
  message "VD dans la direction SW"; psw ();
  marquerUnePause (); vd (); ce (); translater (-3, 0);
  message "VD dans la direction W"; pw ();
  marquerUnePause (); vd (); ce (); translater (-3, 0);
  message "VD dans la direction NW"; pnw ();
  marquerUnePause (); vd ();
  ce (); translater (3, 0);
  message "Grille rectangulaire 30 x 60";
  marquerUnePause ();
  message "VG dans la direction N"; pn ();
  marquerUnePause (); vg (); ce (); translater (3, 0);
  message "VG dans la direction NE"; pne ();
  marquerUnePause (); vg (); ce (); translater (3, 0);
  message "VG dans la direction E"; pe ();
  marquerUnePause (); vg (); ce (); translater (3, 0);
  message "VG dans la direction SE"; pse ();
  marquerUnePause (); vg (); ce (); translater (3, 0);
  message "VG dans la direction S"; ps ();
  marquerUnePause (); vg (); ce (); translater (3, 0);
  message "VG dans la direction SW"; psw ();
  marquerUnePause (); vg (); ce (); translater (3, 0);
  message "VG dans la direction W"; pw ();
  marquerUnePause (); vg (); ce (); translater (3, 0);
  message "VG dans la direction NW"; pnw ();
  marquerUnePause (); vg (); st ()
