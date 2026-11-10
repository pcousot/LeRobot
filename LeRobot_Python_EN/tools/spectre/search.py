# (tools/spectre) usage: python3 search.py 20.2 17.1   (about 30 minutes),
# then: python3 gen.py spectres_20.2_17.1.json ../../book/tutorials_and_games \
#   ../../../LeRobot_Python_FR/livre/Didactitiels_et_jeux \
#   ../../../LeRobot_OCaml_FR/livre/Didactitiels_et_jeux \
#   ../../../LeRobot_FreePascal_FR/livre/Didactitiels_et_jeux

# search.py HALF_WIDTH HALF_HEIGHT -- finds a patch of a tiling by the
# Spectre (Tile(1,1), unflipped copies only) covering the rectangle
# |x| <= HALF_WIDTH, |y| <= HALF_HEIGHT; writes spectres_W_H.json =
# [(r, a, b, c, d), ...]: rotation r * 30 degrees, then translation
# x = (a + b sqrt 3) / 2, y = (c + d sqrt 3) / 2.
import math, sys, json
R3=math.sqrt(3)
U=[(2,0,0,0),(0,1,1,0),(1,0,0,1),(0,0,2,0),(-1,0,0,1),(0,-1,1,0)]
U=U+[tuple(-v for v in u) for u in U]          # unit vector of direction k*30
D=[7,10,0,0,2,11,1,4,6,3,5,8,6,9]   # edge directions of the Spectre (k * 30 degrees)
N=len(D)
def add(p,q): return tuple(a+b for a,b in zip(p,q))
def sub(p,q): return tuple(a-b for a,b in zip(p,q))
def fl(p): return ((p[0]+p[1]*R3)/2,(p[2]+p[3]*R3)/2)
def corners(r):
    # vertices (exact) of the Spectre rotated by r*30, corner 0 at origin
    p=(0,0,0,0); out=[]
    for k in range(N):
        out.append(p); p=add(p,U[(D[k]+r)%12])
    assert p==(0,0,0,0)
    return out
CORN=[corners(r) for r in range(12)]
def wedge(i,r):
    # sectors (start, count) of the interior angle at corner i
    a=(D[i]+r)%12; b=(D[i-1]+6+r)%12
    m=(b-a)%12
    return a,m
def mask(a,m):
    v=0
    for k in range(m): v|=1<<((a+k)%12)
    return v
FULL=(1<<12)-1
W=float(sys.argv[1]); H=float(sys.argv[2])
cover={}            # vertex -> mask
tiles=[]            # (r, translation, float polygon)
buckets={}          # (bx,by) -> list of tile indices
def bkey(x,y): return (int(math.floor(x/4)),int(math.floor(y/4)))
def segcross(p1,p2,q1,q2):
    def o(a,b,c): return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])
    e=1e-9
    d1=o(q1,q2,p1); d2=o(q1,q2,p2); d3=o(p1,p2,q1); d4=o(p1,p2,q2)
    return ((d1>e and d2<-e) or (d1<-e and d2>e)) and ((d3>e and d4<-e) or (d3<-e and d4>e))
def inside(P,q):
    c=False;n=len(P)
    for i in range(n):
        a,b=P[i],P[(i+1)%n]
        if (a[1]>q[1])!=(b[1]>q[1]):
            x=a[0]+(q[1]-a[1])*(b[0]-a[0])/(b[1]-a[1])
            if x>q[0]: c=not c
    return c
def centroid(P): return (sum(p[0] for p in P)/len(P), sum(p[1] for p in P)/len(P))
def dseg(P,q):
    m=1e9;n=len(P)
    for i in range(n):
        a,b=P[i],P[(i+1)%n]
        ax,ay=b[0]-a[0],b[1]-a[1]
        u=max(0,min(1,((q[0]-a[0])*ax+(q[1]-a[1])*ay)/(ax*ax+ay*ay)))
        m=min(m,math.dist(q,(a[0]+u*ax,a[1]+u*ay)))
    return m
P0=[fl(v) for v in CORN[0]]
INNER=max(((x/20,y/20) for x in range(-20,80) for y in range(-20,50) if inside(P0,(x/20,y/20))),key=lambda q:dseg(P0,q))
print('point interieur',INNER,dseg(P0,INNER))
def rotf(q,r):
    a=math.radians(30*r); return (q[0]*math.cos(a)-q[1]*math.sin(a), q[0]*math.sin(a)+q[1]*math.cos(a))
def candidate(r,t):
    vs=[add(c,t) for c in CORN[r]]
    ms=[]
    for i,v in enumerate(vs):
        a,m=wedge(i,r); mk=mask(a,m)
        if cover.get(v,0)&mk: return None
        ms.append((v,mk))
    P=[fl(v) for v in vs]
    tx,ty=fl(t); ix,iy=rotf(INNER,r); cx,cy=(ix+tx,iy+ty)
    bx,by=bkey(cx,cy)
    near=[tiles[k] for dx in (-2,-1,0,1,2) for dy in (-2,-1,0,1,2) for k in buckets.get((bx+dx,by+dy),())]
    for (r2,t2,Q,qc) in near:
        if abs(qc[0]-cx)>6 or abs(qc[1]-cy)>6: continue
        for i in range(N):
            for j in range(N):
                if segcross(P[i],P[(i+1)%N],Q[j],Q[(j+1)%N]): return None
        # an interior point of one inside the other
        if inside(Q,(cx,cy)) or inside(P,qc): return None
    return ms,P,(cx,cy)
def place(r,t,c):
    ms,P,cen=c
    for v,mk in ms: cover[v]=cover.get(v,0)|mk
    tiles.append((r,t,P,cen))
    buckets.setdefault(bkey(*cen),[]).append(len(tiles)-1)
def unplace(c):
    ms,P,cen=c
    for v,mk in ms:
        cover[v]&=~mk
        if not cover[v]: del cover[v]
    buckets[bkey(*cen)].pop()
    tiles.pop()
def inregion(v):
    x,y=fl(v); return abs(x)<=W and abs(y)<=H
sys.setrecursionlimit(100000)
nodes=0
def options(v):
    m=cover[v]
    s=next(k for k in range(12) if not m>>k&1 and m>>((k-1)%12)&1)
    res=[]
    for i in range(N):
        r=(s-D[i])%12
        t=sub(v,CORN[r][i])
        c=candidate(r,t)
        if c: res.append((r,t,c))
    return res
def dfs():
    global nodes
    nodes+=1
    if nodes>3000000: raise SystemExit('too long')
    if nodes%20000==0: print('nodes',nodes,'tiles',len(tiles),flush=True)
    open_=[v for v,m in cover.items() if m!=FULL and inregion(v)]
    if not open_: return True
    best=None
    for v in sorted(open_,key=lambda v: math.hypot(*fl(v)))[:12]:
        o=options(v)
        if best is None or len(o)<len(best[1]): best=(v,o)
        if not o: return False
    for r,t,c in best[1]:
        place(r,t,c)
        if dfs(): return True
        unplace(c)
    return False
c=candidate(0,(0,0,0,0)); place(0,(0,0,0,0),c)
ok=dfs()
print('ok',ok,'tiles',len(tiles),'nodes',nodes)
from collections import Counter
print(sorted(Counter(t[0] for t in tiles).items()))
json.dump([(r,)+tuple(t) for r,t,P,c in tiles],open('spectres_%s_%s.json'%(sys.argv[1],sys.argv[2]),'w'))
