{$mode macpas} program FriseMetMinverse;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;  
begin 
 ag; phtd; 
 for I := 1 to 10 do 
  begin
  { Dessiner un motif |    }
  {                   |/\  }
   p3htd; av; av; p3htg; av; pqtd; av;
  { Dessiner un motif |\/  }
  {                   |    }
   p3htg; av; av; p3htd; av; pqtg; av;
  end;
 { Terminer la dernière branche |  }
 {                              |  }
 p3htd; av; av; 
 st; 
end.