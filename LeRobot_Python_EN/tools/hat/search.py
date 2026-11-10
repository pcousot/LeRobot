# search.py RADIUS [HALF_WIDTH] -- finds a patch of hat tiling covering the
# kites of a disc (or of the rectangle |x| <= HALF_WIDTH, |y| <= RADIUS), by
# placing hats one after the other on the kite grid and going back when no
# hat fits; writes sol_RADIUS_HALF_WIDTH.json = [(o, i, j), ...], as used
# by book/tutorials_and_games/HatTiling.py (python3 search.py 21.6 25.6,
# about 7 minutes). kites.py: the hat and the kite grid.
import math, sys, json
from kites import *
A=hp(2,2); B=hp(-2,4)
def centre(i,j): return (i*A[0]+j*B[0], i*A[1]+j*B[1])
det=A[0]*B[1]-A[1]*B[0]
def ij(p):
    x,y=p
    i=(x*B[1]-y*B[0])/det; j=(A[0]*y-A[1]*x)/det
    return round(i),round(j)
def kcentroid(i,j,k):
    cx,cy=centre(i,j); a=math.radians(60*k)
    V=(cx+2*math.cos(a),cy+2*math.sin(a))
    M1=(cx+R3*math.cos(a-math.pi/6),cy+R3*math.sin(a-math.pi/6))
    M2=(cx+R3*math.cos(a+math.pi/6),cy+R3*math.sin(a+math.pi/6))
    return ((cx+V[0]+M1[0]+M2[0])/4,(cy+V[1]+M1[1]+M2[1])/4)
HATK=[(i,j,k) for i in range(-4,5) for j in range(-4,5) for k in range(6) if inside(HAT,kcentroid(i,j,k))]
assert len(HATK)==8, HATK
def transform(o,p):
    # o in 0..11: rotation r=o%6 by 60r degrees, mirror if o>=6 (reflect in x axis first)
    x,y=p
    if o>=6: y=-y
    a=math.radians(60*(o%6))
    return (x*math.cos(a)-y*math.sin(a), x*math.sin(a)+y*math.cos(a))
def kite_of_point(p):
    # kite containing point p (centroid): nearest hex centre, then angle
    i,j=ij(p)
    best=None
    for di in (-1,0,1):
        for dj in (-1,0,1):
            c=centre(i+di,j+dj); d=math.dist(c,p)
            if best is None or d<best[0]: best=(d,i+di,j+dj)
    _,i,j=best; c=centre(i,j)
    k=round(math.degrees(math.atan2(p[1]-c[1],p[0]-c[0]))/60)%6
    return (i,j,k)
ORI=[]
for o in range(12):
    ks=[kite_of_point(transform(o,kcentroid(*q))) for q in HATK]
    for q in HATK: assert True
    ORI.append(ks)
# region
Rad=float(sys.argv[1]) if len(sys.argv)>1 else 9
W=float(sys.argv[2]) if len(sys.argv)>2 else 0
region=set((i,j,k) for i in range(-14,15) for j in range(-14,15) for k in range(6) if ((abs(kcentroid(i,j,k)[0])<=W and abs(kcentroid(i,j,k)[1])<=Rad) if W else math.hypot(*kcentroid(i,j,k))<=Rad))
covered={}
sys.setrecursionlimit(100000)
def placements(q):
    res=[]
    for o,ks in enumerate(ORI):
        for p in ks:
            if p[2]!=q[2]: continue
            di,dj=q[0]-p[0],q[1]-p[1]
            cells=[(a+di,b+dj,c) for a,b,c in ks]
            if all(c not in covered for c in cells):
                res.append((o,di,dj,cells))
    return res
sol=[]
nodes=0
def dfs():
    global nodes
    nodes+=1
    if nodes>2000000: raise SystemExit('trop long')
    unc=[q for q in region if q not in covered]
    if not unc: return True
    # MRV: kite with fewest placements, ties: nearest centre
    best=None
    for q in sorted(unc,key=lambda q: math.hypot(*kcentroid(*q)))[:40]:
        pl=placements(q)
        if best is None or len(pl)<len(best[1]): best=(q,pl)
        if len(pl)==0: return False
    q,pl=best
    # prefer unmirrored (o<6)
    pl.sort(key=lambda t:(t[0]>=6))
    for o,di,dj,cells in pl:
        for c in cells: covered[c]=len(sol)
        sol.append((o,di,dj))
        if dfs(): return True
        sol.pop()
        for c in cells: del covered[c]
    return False
ok=dfs()
print('ok',ok,'hats',len(sol),'nodes',nodes,'mirrored',sum(1 for s in sol if s[0]>=6))
json.dump(sol,open('sol_%s_%s.json'%(Rad,W),'w'))
