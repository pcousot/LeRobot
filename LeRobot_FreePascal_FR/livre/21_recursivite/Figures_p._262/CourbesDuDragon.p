{$mode macpas} program CourbesDuDragon;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbes  du  dragon d'ordre 1, 2, ..., 8, 10 et 12, *}
 {* page 262.                                           *}
 {*                                                     *}
 {*******************************************************}

 procedure SegmentGauche (N : integer);
 forward;

 procedure SegmentDroit (N : integer);
 begin
  if N = 0 then
   begin
    av; 
   end
  else if N > 0 then
   begin
    SegmentDroit(N - 1);
    pqtg;
    SegmentGauche(N - 1);
   end;
 end;
    
 procedure SegmentGauche;
 begin
  if N = 0 then
   begin
    av; 
   end
  else if N > 0 then
   begin
    SegmentDroit(N - 1);
    pqtd;
    SegmentGauche(N - 1);
   end;
 end;

 procedure Grille(I : integer);
 begin
  message(concat('Courbe du dragon d''ordre ', EntierEnChaine(I)));
  if I <= 6 then
   begin
    lg(12); 
   end
  else if I <= 8 then
   begin
    lg(6); 
   end
  else if I <= 10 then
   begin
    lg(3); 
   end
  else
   begin
    lg(2); 
   end; 
 end;
 
 var I : integer;
    
begin
 pe; Grille(1); SegmentDroit(1); MarquerUnePause;
 for I := 1 to 6 do
  begin
   cf(blanc); pe; Grille(2 * I); SegmentDroit(2 * I); MarquerUnePause;
  end;
 st;
end.

