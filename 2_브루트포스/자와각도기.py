n,m = map(int,input().split())
a = list(map(int,input().split()))
d = [False] * 360
d[0] = True
for i in range(n):
    for k in range(360):
        for j in range(360):
            if not d[j]:
                continue
            d[(j-a[i]+360)%360] = True
            d[(j+a[i])%360] = True
xx = list(map(int,input().split()))
for x in xx:
    print('YES' if d[x] else 'NO')