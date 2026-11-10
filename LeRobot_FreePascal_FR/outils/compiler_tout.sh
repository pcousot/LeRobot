#!/bin/zsh
# compiler_tout.sh : compile tous les programmes de livre/ (dans _build/),
# en parallele ; les erreurs sont resumees dans _build/erreurs.txt
cd ${0:A:h:h}
mkdir -p _build/unites
fpc -Mmacpas -FU_build/unites unites/Robot1.pas >/dev/null 2>&1 || { echo "Robot1.pas ne compile pas"; exit 1; }
fpc -Mmacpas -FU_build/unites unites/Robot2.pas >/dev/null 2>&1
fpc -Mmacpas -FU_build/unites unites/Robot3.pas >/dev/null 2>&1
compiler() {
  f=$1; rel=${f#livre/}; out=_build/bin/${rel%.p}
  mkdir -p ${out:h} _build/obj/${rel:h}
  if fpc -Fu_build/unites -FU_build/obj/${rel:h} -o$out $f > _build/obj/${rel%.p}.log 2>&1
  then echo "OK $rel"; else echo "ECHEC $rel"; fi
}
find livre -name '*.p' | sort | while read f; do compiler "$f"; done > _build/resultats.txt
grep -c '^OK' _build/resultats.txt
grep '^ECHEC' _build/resultats.txt | while read e rel; do
  echo "== $rel"; grep -E 'Error|Fatal' _build/obj/${rel%.p}.log | head -3
done > _build/erreurs.txt
grep -c '^ECHEC' _build/resultats.txt
