{$mode macpas} program MontreDigitale;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

 const
  CouleurDuFond = blanc;
  CouleurDesChiffres = noir;
 
 procedure Cfr(C : integer);
  { Dessiner le chiffre C, le robot partant en bas à gauche et terminant }
  { dans la même position }
 begin
  bc; pn;
  case C of
   0 : begin
        avf(2); pqtd; av; pqtd; avf(2); pqtd; av; pqtd; 
       end;
   1 : begin
        lc; pqtd; av; pqtg; avf(2); pdt; bc; avf(2); lc; pqtd; av; pqtd; 
       end;
   2 : begin
        lc; avf(2); pqtd; bc; av; pqtd; av; pqtd; av; pqtg; av; pqtg; av; pdt; av; pqtd; 
       end;
   3 : begin
        lc; avf(2); pqtd; bc; av; pqtd; av; pqtd; av; pdt; av; pqtd; av; pqtd; av; pqtd; 
       end;
   4 : begin
        lc; avf(2); pdt; bc; av; pqtg; av; pqtg; av; pdt; avf(2); lc; pqtd; av; pqtd;
       end;
   5 : begin
        pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; av; lc; pqtd; avf(2); pqtd; av; pqtd; 
       end;
   6 : begin
        av; pqtd; av; pqtd; av; pqtd; av; pqtd; avf(2); pqtd; av; lc; pqtd; avf(2); pqtd; av; pqtd; 
       end;
   7 : begin
        lc; avf(2); pqtd; bc; av; pqtd; avf(2); pqtd; lc; av; pqtd; 
       end;
   8 : begin
        av; pqtd; av; pdt; av; pqtd; av; pqtd; av; pqtd; avf(2); pqtd; av; pqtd; 
       end;
   9 : begin
        lc; av; bc; pqtd; av; pdt; av; pqtd; av; pqtd; av; pqtd; avf(2); pqtd; av; pqtd; 
       end;
  end;
 end;
 
 procedure Esp;
  { Laisser un espace entre deux nombres }
 begin
  lc; pe; avf(2);
 end;
 
 procedure Moins;
  { Dessiner un signe - }
 begin
  pn; lc; av; pqtd; bc; av; lc; pqtd; av; pqtd; av; pqtd;
 end;
 
 procedure Nbr(N : integer);
  { Dessiner le nombre N (en supposant -32767 <= N <= 32767) }
 begin
  if (0 <= N) and (N <= 9) then
   begin
    Cfr(N)
   end
  else
   begin
    if (N < 0) then
     begin
      Moins; Esp; Nbr(-N);
     end
    else
     begin
      Nbr(N div 10); Esp; Nbr(N mod 10);
     end;
   end;
 end;
 
 procedure DeuxPoints;
 begin
  lc; dp; pn; av; dp; pdt; av; 
 end;
  
 procedure EcrireDate(J, Mo, A: integer);
 begin
  { Ecrire le jour }    ce; ag; translater( 0,  2); Nbr(J);
  { Ecrire - }          ce; ag; translater( 4,  2); Moins;
  { Ecrire le mois }    ce; ag; translater( 6,  2); Nbr(Mo);
  { Ecrire - }          ce; ag; translater(10,  2); Moins;
  { Ecrire l'année }    ce; ag; translater(12,  2); Nbr(A);
 end;

 procedure EcrireSeconde(S : integer);
 begin
  { Ecrire la seconde } ce; ag; translater(10, -2); Nbr(S);
 end;

 procedure EcrireHeure(H, Mi, S : integer);
 begin
  { Ecrire l'heure }    ce; ag; translater( 0, -2); Nbr(H);
  { Ecrire : }          ce; ag; translater( 4, -2); DeuxPoints;
  { Ecrire la minute }  ce; ag; translater( 5, -2); Nbr(Mi);
  { Ecrire : }          ce; ag; translater( 9, -2); DeuxPoints;
  { Ecrire la seconde } EcrireSeconde(S);
 end;
 
 procedure Initialisation;
 begin
   cf(CouleurDuFond); cc(CouleurDesChiffres);
   cacherRobot; 
   message('Arrêter la montre en tapant sur l''une des touches ''esc'', ''§'' ou ''#''.');
   lg(24); ec(6);
 end;

 var
  AJ, AMo, AA, AH, AMi, AS, J, Mo, A, H, Mi, S : integer;
begin
 Date(AA, AMo, AJ); Heure(AH, AMi, AS);
 Initialisation; EcrireDate(AA, AMo, AJ); EcrireHeure(AH, AMi, AS);
 while true do
  begin
   repeat
    Date(A, Mo, J); Heure(H, Mi, S);
   until S <> AS;
   if AMi = Mi then
    begin
     cc(CouleurDuFond);       EcrireSeconde(AS); { Effacer l'ancienne seconde }
     cc(CouleurDesChiffres);  EcrireSeconde(S);  { Ecrire la nouvelle seconde }
    end
   else
    begin
     { Toutes les minutes, effacer l'écran et réécrire toute la date }
     Initialisation; EcrireDate(A, Mo, J); EcrireHeure(H, Mi, S);
    end;
   AA := A; AMo := Mo; AJ := J; AH := H; AMi := Mi; AS := S;
  end;
 st;
end.