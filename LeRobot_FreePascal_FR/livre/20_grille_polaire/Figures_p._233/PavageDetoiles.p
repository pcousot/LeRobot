{$mode macpas} program PavageDetoiles;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage du plan avec des étoiles, page 233.          *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleQuadrillage = 9;
  LgLigne = 6;
  NbLignes = 6;
  N = 8; { Nombre de branches de l'étoile, supposé multiple de 4 }
  alpha = 30; { 0 < alpha < ((N - 2) * 180) / N }
 
 procedure QuartDetoile;
  var I : integer;
 begin
  for I := 1 to (N div 4) do
   begin
    av; pdt; rt(((2 * (N - 1)) * 180) / N - alpha);
    av; pdt; rt(alpha);
   end;
 end;
 
 procedure Etoile;
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    QuartDetoile;
   end;
 end;
 
 procedure EtoileSuivanteEst;
  var I : integer;
 begin
  lc;
  for I := 1 to 2 do
   begin
    QuartDetoile;
   end;
  pdt; bc;
 end;
 
 procedure EtoileSuivanteSud;
  var
   I : integer;
   J : integer;
 begin
  lc;
  for J := 1 to 2 do
   begin
    pdt; QuartDetoile;
   end;
  bc;
 end;
 
 procedure Ligne;
  var C : integer;
 begin
  lg(1); ag; lg(TailleQuadrillage); pe; rt(alpha / 2);
  for C := 1 to LgLigne do
   begin
    Etoile; EtoileSuivanteEst;
   end;
  EtoileSuivanteSud;
 end;
 
 procedure EnHaut;
 begin
  lc; lg(1); eh; lg(TailleQuadrillage); ps; rt(alpha / 2);
  QuartDetoile; bc; 
 end;
 
 procedure Pavage;
  var L : integer;
 begin
  EnHaut;
  for L := 1 to NbLignes do
   begin
    Ligne;
   end;
 end;
 
begin
 Pavage; st;
end.