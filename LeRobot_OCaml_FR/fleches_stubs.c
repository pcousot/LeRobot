/* fleches_stubs.c -- les touches fleches pour LeRobot (OCaml).

   Graphics ne rend que les touches qui donnent un caractere : les fleches
   sont perdues. On ouvre une seconde connexion au serveur X (XQuartz) et
   on y demande les evenements KeyPress de la fenetre de Graphics (plusieurs
   clients peuvent les demander pour une meme fenetre), ainsi que
   ButtonRelease (pour ne pas manquer un clic tres bref, que l'interrogation
   de l'etat de la souris ne verrait pas). X ne les envoie que si la fenetre
   du robot a le clavier : les fleches tapees dans une autre fenetre ne la
   concernent pas. */

#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/keysym.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>

static Display *dpy = NULL;
static Window fenetre = 0;

/* fleches_ouvrir id : id = Graphics.window_id () ; rend true si c'est
   possible */
value lerobot_fleches_ouvrir(value id)
{
  CAMLparam1(id);
  if (dpy == NULL) {
    dpy = XOpenDisplay(NULL);
    if (dpy == NULL) CAMLreturn(Val_false);
  }
  fenetre = (Window) strtoul(String_val(id), NULL, 0);
  if (fenetre == 0) CAMLreturn(Val_false);
  XSelectInput(dpy, fenetre, KeyPressMask | ButtonReleaseMask);
  XFlush(dpy);
  CAMLreturn(Val_true);
}

/* fleches_lire () : (genre, x, y) du prochain evenement en attente,
   genre = 0 rien, 1 gauche, 2 droite, 3 haut, 4 bas, 5 bouton relache en
   (x, y) (coordonnees X : y vers le bas). Ne bloque pas. */
value lerobot_fleches_lire(value unit)
{
  CAMLparam1(unit);
  CAMLlocal1(res);
  int genre = 0, x = 0, y = 0;
  XEvent e;
  if (dpy != NULL) {
    while (genre == 0 && XPending(dpy) > 0) {
      XNextEvent(dpy, &e);
      if (e.type == KeyPress) {
        KeySym k = XLookupKeysym(&e.xkey, 0);
        if (k == XK_Left || k == XK_KP_Left) genre = 1;
        else if (k == XK_Right || k == XK_KP_Right) genre = 2;
        else if (k == XK_Up || k == XK_KP_Up) genre = 3;
        else if (k == XK_Down || k == XK_KP_Down) genre = 4;
      } else if (e.type == ButtonRelease && e.xbutton.button == Button1) {
        genre = 5; x = e.xbutton.x; y = e.xbutton.y;
      }
    }
  }
  res = caml_alloc_tuple(3);
  Store_field(res, 0, Val_int(genre));
  Store_field(res, 1, Val_int(x));
  Store_field(res, 2, Val_int(y));
  CAMLreturn(res);
}
