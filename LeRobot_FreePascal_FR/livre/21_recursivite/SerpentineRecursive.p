{$mode macpas} program SerpentineRecursive;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* SerpentineRecursive, page 251-252.                  *}
 {*                                                     *}
 {*******************************************************}

 procedure SerpentineW (N : integer);
 forward;

 procedure SerpentineE (N : integer);
  { Construire une serpentine de hauteur N en partant de son coin }
  { inférieur ouest.                                              }
 begin
  if N > 0 then
   begin
    { Construire la base de largeur N, d'ouest en est. }
    pe; avf(N); pn; av;
    { Construire la serpentine supérieure de hauteur  (N - 1)  en }
    { partant de son coin inférieur est.                          }
    SerpentineW(N - 1);
   end;
 end;
    
 procedure SerpentineW;
  { Construire une serpentine de hauteur N en partant de son coin }
  { inférieur est.                                                }
 begin
  if N > 0 then
   begin
    { Construire la base de largeur N, d'est en ouest. }
    pw; avf(N); pn; av; 
    { Construire la serpentine supérieure de hauteur  (N - 1)  en }
    { partant de son coin inférieur ouest.                        }
    SerpentineE(N - 1);
   end;  
 end;
    
begin
 lg(6); eb; ad; SerpentineW(18); eb; ag; SerpentineE(18); st; 
end.

