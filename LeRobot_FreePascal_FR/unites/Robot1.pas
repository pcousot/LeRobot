{ Robot1.pas -- engendre par outils/genere_unite.py : ne pas modifier a la main.
  Les commandes du robot des unites Robot1, Robot2 et Robot3 de
  "Premieres lecons de programmation en Turbo Pascal" (Macintosh, 1991),
  pour Free Pascal. Le dessin est fait par la bibliotheque LeRobot_Python_FR :
  chaque commande est envoyee au serveur (serveur.py, qui lance le
  programme) par le descripteur 3, et sa reponse lue sur le descripteur 4. }
unit Robot1;
{$mode macpas}
{$H-}

interface

const
  blanc = 0; jaune = 1; bleu = 2; violet = 3; vert = 4; rouge = 5;
  indigo = 6; noir = 7;
  nord = 0; nordEst = 1; est = 2; sudEst = 3; sud = 4; sudOuest = 5;
  ouest = 6; nordOuest = 7;
  normal = 0; gras = 1; italique = 2; souligne = 4; contour = 8; ombre = 16;
  condense = 32; etendu = 64;
  courier = 'courier'; geneva = 'geneva'; monaco = 'monaco'; chicago = 'chicago';
  newYork = 'new york'; times = 'times'; helvetica = 'helvetica';
  mementoCommandesClavier = '- :pqtg + :pqtd g :phtg d :phtd a :av ( :vg ) :vd b :bc l :lc c :dc . :dg p :dp * :cc w :peindre  Entree :fin';
  { musique (Robot3) : hauteurs en demi-tons a partir du do du milieu }
  d0 = 0; do0 = 0; ut = 0; re = 2; mi = 4; fa = 5; sol = 7; la = 9; si = 11;
  octave = 12; diese = 1; bemol = -1; becarre = 0;
  { durees (noire = 1) }
  ronde = 4.0; blanche = 2.0; noire = 1.0; croche = 0.5; double_croche = 0.25;
  triple_croche = 0.125; ronde_pointee = 6.0; blanche_pointee = 3.0;
  noire_pointee = 1.5; croche_pointee = 0.75; double_croche_pointee = 0.375;
  noire_en_triolet = 0.6666666666666667; croche_en_triolet = 0.3333333333333333;
  blanche_en_triolet = 1.3333333333333333;
  pause = 4.0; demi_pause = 2.0; soupir = 1.0; demi_soupir = 0.5;
  quart_de_soupir = 0.25; huitieme_de_soupir = 0.125; soupir_pointe = 1.5;
  demi_soupir_pointe = 0.75; demi_pause_pointee = 3.0;
  { mouvements (noires par minute) et nuances }
  largo = 50; larghetto = 60; lento = 56; adagio = 70; andante = 85;
  andantino = 95; moderato = 110; allegretto = 115; allegro = 130; vivace = 150;
  presto = 175; prestissimo = 200;
  pianississimo = 1; pianissimo = 2; piano = 3; mezza_voce = 4; mezzo_piano = 4;
  mezzo_forte = 6; forte = 7; fortissimo = 8; fortississimo = 9;

procedure av;
procedure vd;
procedure vg;
procedure pn;
procedure pne;
procedure pe;
procedure pse;
procedure ps;
procedure psw;
procedure pw;
procedure pnw;
procedure phtd;
procedure pqtd;
procedure p3htd;
procedure phtg;
procedure pqtg;
procedure p3htg;
procedure pdt;
procedure ce;
procedure eh;
procedure eb;
procedure ad;
procedure ag;
procedure bc;
procedure lc;
procedure dc;
procedure dp;
procedure dg;
procedure st;
procedure peindre;
procedure montrerRobot;
procedure cacherRobot;
procedure autoriserSorties;
procedure interdireSorties;
procedure pp;
procedure ex;
procedure effacerMessage;
procedure marquerUnePause;
procedure bip;
procedure biiip;
procedure avf(n: integer);
procedure lg(l: real);
procedure lgX(l: real);
procedure lgY(l: real);
procedure lgRT(r: real; t: real);
procedure pivoter(n: integer);
procedure rt(a: real);
procedure tl(l: real);
procedure tracer(x: real; y: real);
procedure deplacerReel(x: real; y: real);
procedure translater(x: integer; y: integer);
procedure cc(n: integer);
procedure cf(n: integer);
procedure ec(n: integer);
procedure vt(n: integer);
procedure message(s: string);
procedure ecrire(s: string);
procedure policeTexte(s: string);
procedure tailleTexte(n: integer);
procedure styleTexte(n: integer);
procedure delai(t: real);
procedure note(h: integer; d: real);
procedure silence(d: real);
procedure metronome(n: integer);
procedure nuance(n: integer);
function valLgX: real;
function valLgY: real;
function valLgR: real;
function valLgT: real;
function valLgTl: real;
function valX: real;
function valY: real;
function valEc: integer;
function valCc: integer;
function valCf: integer;
function valVt: integer;
function valOrientation: integer;
function valBc: boolean;
function valVisible: boolean;
function valAutoriserSorties: boolean;
function tb: boolean;
function tn: boolean;
function tne: boolean;
function te: boolean;
function tse: boolean;
function ts: boolean;
function tsw: boolean;
function tw: boolean;
function tnw: boolean;
function valMessage: string;
function valPoliceTexte: string;
function valTailleTexte: integer;
function random: integer;
function tickCount: integer;
function ecranNoirEtBlanc: boolean;
function entierEnChaine(n: integer): string;
function reelEnChaine(x: real): string;
function booleenEnChaine(b: boolean): string;
procedure deplacer(x, y: real);
procedure lireCar(var c: char);
procedure heure(var h, m, s: integer);
procedure date(var j, m, a: integer);
procedure interaction(var x, y: integer; var c: char; coordonnees, pivotements, dessin, finsouris, sauver: boolean);
procedure modeTexte;
procedure modeDessin;
procedure effacerTexte;
procedure copier;
function dessinDuRobotEngendre: boolean;

implementation

uses SysUtils;

var
  versServeur, duServeur: text;
  pret: boolean = false;

procedure Ouvrir;
begin
  if not pret then
  begin
    if not FileExists('/dev/fd/3') then
    begin
      writeln('Ce programme doit etre lance par robot.sh (il faut le serveur du robot).');
      halt(1)
    end;
    Assign(versServeur, '/dev/fd/3'); Rewrite(versServeur);
    Assign(duServeur, '/dev/fd/4'); Reset(duServeur);
    pret := true
  end
end;

{ une valeur par champ, separes par des tabulations }
function ArgI(n: longint): string;
begin ArgI := chr(9) + IntToStr(n) end;

function ArgR(x: real): string;
var s: string;
begin Str(x:0:15, s); ArgR := chr(9) + s end;

function ArgS(s: string): string;
var i: integer; r: string;
begin
  r := '';
  for i := 1 to length(s) do
    if s[i] = chr(9) then r := r + ' '
    else if (s[i] = chr(10)) or (s[i] = chr(13)) then r := r + ' '
    else r := r + s[i];
  ArgS := chr(9) + r
end;

function ArgB(b: boolean): string;
begin if b then ArgB := chr(9) + '1' else ArgB := chr(9) + '0' end;

{ envoie la commande et rend la reponse ; 'stop' : fin du programme }
function Fonction(c: string): string;
var r: string;
begin
  Ouvrir;
  writeln(versServeur, c); Flush(versServeur);
  if eof(duServeur) then halt(0);
  readln(duServeur, r);
  if r = 'stop' then halt(0);
  Fonction := r
end;

procedure Commande(c: string);
begin
  if Fonction(c) <> 'ok' then ;
end;

function StrVersI(s: string): longint;
begin StrVersI := StrToIntDef(Trim(s), 0) end;

function StrVersR(s: string): real;
var x: real; code: integer;
begin Val(Trim(s), x, code); StrVersR := x end;

function StrVersB(s: string): boolean;
begin StrVersB := Trim(s) = '1' end;

procedure Trois(r: string; var a, b, c: integer);
var p: integer;
begin
  p := Pos(chr(9), r); a := StrVersI(Copy(r, 1, p - 1)); Delete(r, 1, p);
  p := Pos(chr(9), r); b := StrVersI(Copy(r, 1, p - 1)); Delete(r, 1, p);
  c := StrVersI(r)
end;

procedure av;
begin Commande('av') end;
procedure vd;
begin Commande('vd') end;
procedure vg;
begin Commande('vg') end;
procedure pn;
begin Commande('pn') end;
procedure pne;
begin Commande('pne') end;
procedure pe;
begin Commande('pe') end;
procedure pse;
begin Commande('pse') end;
procedure ps;
begin Commande('ps') end;
procedure psw;
begin Commande('psw') end;
procedure pw;
begin Commande('pw') end;
procedure pnw;
begin Commande('pnw') end;
procedure phtd;
begin Commande('phtd') end;
procedure pqtd;
begin Commande('pqtd') end;
procedure p3htd;
begin Commande('p3htd') end;
procedure phtg;
begin Commande('phtg') end;
procedure pqtg;
begin Commande('pqtg') end;
procedure p3htg;
begin Commande('p3htg') end;
procedure pdt;
begin Commande('pdt') end;
procedure ce;
begin Commande('ce') end;
procedure eh;
begin Commande('eh') end;
procedure eb;
begin Commande('eb') end;
procedure ad;
begin Commande('ad') end;
procedure ag;
begin Commande('ag') end;
procedure bc;
begin Commande('bc') end;
procedure lc;
begin Commande('lc') end;
procedure dc;
begin Commande('dc') end;
procedure dp;
begin Commande('dp') end;
procedure dg;
begin Commande('dg') end;
procedure st;
begin Commande('st') end;
procedure peindre;
begin Commande('peindre') end;
procedure montrerRobot;
begin Commande('montrerRobot') end;
procedure cacherRobot;
begin Commande('cacherRobot') end;
procedure autoriserSorties;
begin Commande('autoriserSorties') end;
procedure interdireSorties;
begin Commande('interdireSorties') end;
procedure pp;
begin Commande('pp') end;
procedure ex;
begin Commande('ex') end;
procedure effacerMessage;
begin Commande('effacerMessage') end;
procedure marquerUnePause;
begin Commande('marquerUnePause') end;
procedure bip;
begin Commande('bip') end;
procedure biiip;
begin Commande('biiip') end;
procedure avf(n: integer);
begin Commande('avf' + ArgI(n)) end;
procedure lg(l: real);
begin Commande('lg' + ArgR(l)) end;
procedure lgX(l: real);
begin Commande('lgX' + ArgR(l)) end;
procedure lgY(l: real);
begin Commande('lgY' + ArgR(l)) end;
procedure lgRT(r: real; t: real);
begin Commande('lgRT' + ArgR(r) + ArgR(t)) end;
procedure pivoter(n: integer);
begin Commande('pivoter' + ArgI(n)) end;
procedure rt(a: real);
begin Commande('rt' + ArgR(a)) end;
procedure tl(l: real);
begin Commande('tl' + ArgR(l)) end;
procedure tracer(x: real; y: real);
begin Commande('tracerReel' + ArgR(x) + ArgR(y)) end;
procedure deplacerReel(x: real; y: real);
begin Commande('deplacerReel' + ArgR(x) + ArgR(y)) end;
procedure translater(x: integer; y: integer);
begin Commande('translater' + ArgI(x) + ArgI(y)) end;
procedure cc(n: integer);
begin Commande('cc' + ArgI(n)) end;
procedure cf(n: integer);
begin Commande('cf' + ArgI(n)) end;
procedure ec(n: integer);
begin Commande('ec' + ArgI(n)) end;
procedure vt(n: integer);
begin Commande('vt' + ArgI(n)) end;
procedure message(s: string);
begin Commande('message' + ArgS(s)) end;
procedure ecrire(s: string);
begin Commande('ecrire' + ArgS(s)) end;
procedure policeTexte(s: string);
begin Commande('policeTexte' + ArgS(s)) end;
procedure tailleTexte(n: integer);
begin Commande('tailleTexte' + ArgI(n)) end;
procedure styleTexte(n: integer);
begin Commande('styleTexte' + ArgI(n)) end;
procedure delai(t: real);
begin Commande('delai' + ArgR(t)) end;
procedure note(h: integer; d: real);
begin Commande('note' + ArgI(h) + ArgR(d)) end;
procedure silence(d: real);
begin Commande('silence' + ArgR(d)) end;
procedure metronome(n: integer);
begin Commande('metronome' + ArgI(n)) end;
procedure nuance(n: integer);
begin Commande('nuance' + ArgI(n)) end;
function valLgX: real;
begin valLgX := StrVersR(Fonction('valLgX')) end;
function valLgY: real;
begin valLgY := StrVersR(Fonction('valLgY')) end;
function valLgR: real;
begin valLgR := StrVersR(Fonction('valLgR')) end;
function valLgT: real;
begin valLgT := StrVersR(Fonction('valLgT')) end;
function valLgTl: real;
begin valLgTl := StrVersR(Fonction('valLgTl')) end;
function valX: real;
begin valX := StrVersR(Fonction('valX')) end;
function valY: real;
begin valY := StrVersR(Fonction('valY')) end;
function valEc: integer;
begin valEc := StrVersI(Fonction('valEc')) end;
function valCc: integer;
begin valCc := StrVersI(Fonction('valCc')) end;
function valCf: integer;
begin valCf := StrVersI(Fonction('valCf')) end;
function valVt: integer;
begin valVt := StrVersI(Fonction('valVt')) end;
function valOrientation: integer;
begin valOrientation := StrVersI(Fonction('valOrientation')) end;
function valBc: boolean;
begin valBc := StrVersB(Fonction('valBc')) end;
function valVisible: boolean;
begin valVisible := StrVersB(Fonction('valVisible')) end;
function valAutoriserSorties: boolean;
begin valAutoriserSorties := StrVersB(Fonction('valAutoriserSorties')) end;
function tb: boolean;
begin tb := StrVersB(Fonction('tb')) end;
function tn: boolean;
begin tn := StrVersB(Fonction('tn')) end;
function tne: boolean;
begin tne := StrVersB(Fonction('tne')) end;
function te: boolean;
begin te := StrVersB(Fonction('te')) end;
function tse: boolean;
begin tse := StrVersB(Fonction('tse')) end;
function ts: boolean;
begin ts := StrVersB(Fonction('ts')) end;
function tsw: boolean;
begin tsw := StrVersB(Fonction('tsw')) end;
function tw: boolean;
begin tw := StrVersB(Fonction('tw')) end;
function tnw: boolean;
begin tnw := StrVersB(Fonction('tnw')) end;
function valMessage: string;
begin valMessage := Fonction('valMessage') end;
function valPoliceTexte: string;
begin valPoliceTexte := Fonction('valPoliceTexte') end;
function valTailleTexte: integer;
begin valTailleTexte := StrVersI(Fonction('valTailleTexte')) end;
function random: integer;
begin random := StrVersI(Fonction('random')) end;
function tickCount: integer;
begin tickCount := StrVersI(Fonction('tickCount')) end;
function ecranNoirEtBlanc: boolean;
begin ecranNoirEtBlanc := StrVersB(Fonction('ecranNoirEtBlanc')) end;
function entierEnChaine(n: integer): string;
begin entierEnChaine := Fonction('entierEnChaine' + ArgI(n)) end;
function reelEnChaine(x: real): string;
begin reelEnChaine := Fonction('reelEnChaine' + ArgR(x)) end;
function booleenEnChaine(b: boolean): string;
begin booleenEnChaine := Fonction('booleenEnChaine' + ArgB(b)) end;
{ Deplacer accepte des reels (Cosinus, Sinus) : avec des valeurs entieres,
  c'est le deplacer entier de la bibliotheque, sinon deplacerReel }
procedure deplacer(x, y: real);
begin
  if (Frac(x) = 0) and (Frac(y) = 0) then
    Commande('deplacer' + ArgI(Round(x)) + ArgI(Round(y)))
  else
    Commande('deplacerReel' + ArgR(x) + ArgR(y))
end;
procedure lireCar(var c: char);
var s: string;
begin s := Fonction('lireCar'); c := chr(StrVersI(s)) end;
procedure heure(var h, m, s: integer);
var r: string;
begin r := Fonction('heure'); Trois(r, h, m, s) end;
procedure date(var j, m, a: integer);
var r: string;
begin r := Fonction('date'); Trois(r, j, m, a) end;
procedure interaction(var x, y: integer; var c: char; coordonnees, pivotements, dessin, finsouris, sauver: boolean);
var r: string; k: integer;
begin
  r := Fonction('interactionTP' + ArgB(coordonnees) + ArgB(pivotements) + ArgB(dessin)
                + ArgB(finsouris) + ArgB(sauver));
  Trois(r, x, y, k); c := chr(k)
end;
procedure modeTexte; begin end;
procedure modeDessin; begin end;
procedure effacerTexte; begin write(chr(27), '[2J', chr(27), '[H') end;
procedure copier; begin end;
function dessinDuRobotEngendre: boolean; begin dessinDuRobotEngendre := false end;

end.
