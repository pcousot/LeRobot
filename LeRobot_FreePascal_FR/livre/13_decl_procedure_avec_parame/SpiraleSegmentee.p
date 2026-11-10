{$mode macpas} program SpiraleSegmentee;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* SpiraleSegmentee, page 145.                         *}
 {*                                                     *}
 {*******************************************************}

 procedure Quart_De_Tour (L : integer);
  { Tourner à gauche puis avancer le }
  { robot tout droit de  L  fois  la }
  { taille  de la grille pour former }
  { un quart de tour.    }
 begin {Quart_De_Tour}
  pqtg; avf(L);
 end; {Quart_De_Tour}

 procedure Demi_Tour (L : integer);
  { Tracer deux quarts de tour succes- }
  { sifs pour former un demi-tour.     }
 begin {Demi_Tour}
   Quart_De_Tour (L);
   Quart_De_Tour (L);
 end; {Demi_Tour}

 procedure Spirale (N : integer);
 { Tracer une spirale de N demi-tours }
  var L : integer;
 begin {Spirale}
  for L := 1 to N do
   begin
    Demi_Tour (L);
   end;
 end; {Spirale}

begin
 lg(6); Spirale(19); st; 
end.