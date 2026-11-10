#!/usr/bin/env python3
"""genere_unite.py : engendre unites/Robot1.pas (toutes les commandes du
robot) a partir de la table ci-dessous ; Robot2.pas et Robot3.pas sont
vides (les programmes de 1991 les citent dans leur clause uses).

Chaque commande envoie une ligne au serveur (serveur.py) :
    nom <TAB> argument1 <TAB> argument2 ...
et attend sa reponse : 'ok' pour une procedure, la valeur pour une
fonction ou un parametre var, 'stop' si le programme doit s'arreter."""
import os

I, R, S, B, C = 'integer', 'real', 'string', 'boolean', 'char'
# (nom Pascal, nom Python, [(param, type)], type rendu ou None)
P = []
for n in '''av vd vg pn pne pe pse ps psw pw pnw phtd pqtd p3htd phtg pqtg p3htg pdt
ce eh eb ad ag bc lc dc dp dg st peindre montrerRobot cacherRobot
autoriserSorties interdireSorties pp ex effacerMessage marquerUnePause bip biiip'''.split():
    P.append((n, n, [], None))
P += [
    ('avf', 'avf', [('n', I)], None),
    ('lg', 'lg', [('l', R)], None), ('lgX', 'lgX', [('l', R)], None),
    ('lgY', 'lgY', [('l', R)], None), ('lgRT', 'lgRT', [('r', R), ('t', R)], None),
    ('pivoter', 'pivoter', [('n', I)], None), ('rt', 'rt', [('a', R)], None),
    ('tl', 'tl', [('l', R)], None),
    ('tracer', 'tracerReel', [('x', R), ('y', R)], None),
    ('deplacerReel', 'deplacerReel', [('x', R), ('y', R)], None),
    ('translater', 'translater', [('x', I), ('y', I)], None),
    ('cc', 'cc', [('n', I)], None), ('cf', 'cf', [('n', I)], None),
    ('ec', 'ec', [('n', I)], None), ('vt', 'vt', [('n', I)], None),
    ('message', 'message', [('s', S)], None), ('ecrire', 'ecrire', [('s', S)], None),
    ('policeTexte', 'policeTexte', [('s', S)], None),
    ('tailleTexte', 'tailleTexte', [('n', I)], None),
    ('styleTexte', 'styleTexte', [('n', I)], None),
    ('delai', 'delai', [('t', R)], None),
    ('note', 'note', [('h', I), ('d', R)], None), ('silence', 'silence', [('d', R)], None),
    ('metronome', 'metronome', [('n', I)], None), ('nuance', 'nuance', [('n', I)], None),
]
F = [('valLgX', R), ('valLgY', R), ('valLgR', R), ('valLgT', R), ('valLgTl', R),
     ('valX', R), ('valY', R), ('valEc', I), ('valCc', I), ('valCf', I), ('valVt', I),
     ('valOrientation', I), ('valBc', B), ('valVisible', B), ('valAutoriserSorties', B),
     ('tb', B), ('tn', B), ('tne', B), ('te', B), ('tse', B), ('ts', B), ('tsw', B),
     ('tw', B), ('tnw', B), ('valMessage', S), ('valPoliceTexte', S),
     ('valTailleTexte', I), ('random', I), ('tickCount', I), ('ecranNoirEtBlanc', B)]
for n, t in F:
    P.append((n, n, [], t))
P += [('entierEnChaine', 'entierEnChaine', [('n', I)], S),
      ('reelEnChaine', 'reelEnChaine', [('x', R)], S),
      ('booleenEnChaine', 'booleenEnChaine', [('b', B)], S)]

CONST = '''  blanc = 0; jaune = 1; bleu = 2; violet = 3; vert = 4; rouge = 5;
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
  mezzo_forte = 6; forte = 7; fortissimo = 8; fortississimo = 9;'''


def entete(n, ps, ret):
    sig = '; '.join('%s: %s' % (a, t) for a, t in ps)
    sig = '(%s)' % sig if ps else ''
    return ('function %s%s: %s;' % (n, sig, ret)) if ret else ('procedure %s%s;' % (n, sig))


def arg(a, t):
    return {I: 'ArgI(%s)', R: 'ArgR(%s)', S: 'ArgS(%s)', B: 'ArgB(%s)'}[t] % a


def corps(n, py, ps, ret):
    c = "'%s'" % py
    for a, t in ps:
        c += ' + ' + arg(a, t)
    if ret is None:
        return 'begin Commande(%s) end;' % c
    conv = {I: 'StrVersI', R: 'StrVersR', S: '', B: 'StrVersB'}[ret]
    return 'begin %s := %s(Fonction(%s)) end;' % (n, conv, c) if conv else \
        'begin %s := Fonction(%s) end;' % (n, c)


iface = [entete(n, ps, r) for n, _, ps, r in P]
iface += ['procedure deplacer(x, y: real);',
          'procedure lireCar(var c: char);',
          'procedure heure(var h, m, s: integer);',
          'procedure date(var j, m, a: integer);',
          'procedure interaction(var x, y: integer; var c: char; coordonnees, pivotements, dessin, finsouris, sauver: boolean);',
          'procedure modeTexte;', 'procedure modeDessin;', 'procedure effacerTexte;',
          'procedure copier;', 'function dessinDuRobotEngendre: boolean;']
impl = []
for n, py, ps, r in P:
    impl.append(entete(n, ps, r))
    impl.append(corps(n, py, ps, r))
impl += ['''{ Deplacer accepte des reels (Cosinus, Sinus) : avec des valeurs entieres,
  c'est le deplacer entier de la bibliotheque, sinon deplacerReel }
procedure deplacer(x, y: real);
begin
  if (Frac(x) = 0) and (Frac(y) = 0) then
    Commande('deplacer' + ArgI(Round(x)) + ArgI(Round(y)))
  else
    Commande('deplacerReel' + ArgR(x) + ArgR(y))
end;''',
'''procedure lireCar(var c: char);
var s: string;
begin s := Fonction('lireCar'); c := chr(StrVersI(s)) end;''',
'''procedure heure(var h, m, s: integer);
var r: string;
begin r := Fonction('heure'); Trois(r, h, m, s) end;''',
'''procedure date(var j, m, a: integer);
var r: string;
begin r := Fonction('date'); Trois(r, j, m, a) end;''',
'''procedure interaction(var x, y: integer; var c: char; coordonnees, pivotements, dessin, finsouris, sauver: boolean);
var r: string; k: integer;
begin
  r := Fonction('interactionTP' + ArgB(coordonnees) + ArgB(pivotements) + ArgB(dessin)
                + ArgB(finsouris) + ArgB(sauver));
  Trois(r, x, y, k); c := chr(k)
end;''',
'procedure modeTexte; begin end;', 'procedure modeDessin; begin end;',
'''procedure effacerTexte; begin write(chr(27), '[2J', chr(27), '[H') end;''',
'procedure copier; begin end;',
'function dessinDuRobotEngendre: boolean; begin dessinDuRobotEngendre := false end;']

TEXTE = '''{ Robot1.pas -- engendre par outils/genere_unite.py : ne pas modifier a la main.
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
%s

%s

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

%s

end.
'''
ici = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
with open(os.path.join(ici, 'unites', 'Robot1.pas'), 'w') as f:
    f.write(TEXTE % (CONST, '\n'.join(iface), '\n'.join(impl)))
for u in ('Robot2', 'Robot3'):
    with open(os.path.join(ici, 'unites', u + '.pas'), 'w') as f:
        f.write('{ %s.pas : vide ; toutes les commandes du robot sont dans Robot1. }\n'
                'unit %s;\n{$mode macpas}\ninterface\nimplementation\nend.\n' % (u, u))
print(len(P) + 9, 'commandes')
