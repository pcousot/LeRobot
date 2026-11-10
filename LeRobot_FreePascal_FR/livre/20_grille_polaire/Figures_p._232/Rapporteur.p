{$mode macpas} program Rapporteur;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rapporteur gradué en degré, page 232.               *}
 {*                                                     *}
 {*******************************************************}

 const
  Longueur = 16;
 var
  I : integer;
begin
 eb; pe; lc; 
 for I := 0 to 180 do
  begin
   if (I = 0) or (I = 90) or (I = 180) then
    begin
     bc; avf(Longueur - 7); lc; avf(2); ecrire(EntierEnChaine(I)); av; bc; avf(4); lc; 
    end
   else if ((I mod 10) = 5) then
    begin
     avf(Longueur - 2); bc; avf(2); lc; 
    end
   else if ((I mod 10) = 0) then
    begin
     avf(Longueur - 5); ecrire(EntierEnChaine(I)); avf(2); bc; avf(3); lc; 
    end
   else
    begin
     avf(Longueur - 1); bc; av; lc; 
    end;
   pdt; avf(Longueur); pdt; rt(1);
  end;
 st;
end.