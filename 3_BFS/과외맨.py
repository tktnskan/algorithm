from collections import deque
dx0 = [-1,-1,0,0,1,1]
dy0 = [-1,0,-1,1,-1,0]
dx1 = [-1,-1,0,0,1,1]
dy1 = [0,1,-1,1,0,1]
dx = [dx0,dx1]
dy = [dy0,dy1]

def ok(x, y):
    if x < 0 or x >= n:
        return False
    if x%2 == 0:
        return 0 <= y < n
    else:
        return 0 <= y < n-1

def go(x1, y1, x2, y2):
    if x1 == x2:
        if y1 < y2:
            return a[x1][y1][1] == a[x2][y2][0]
        else:
            return a[x1][y1][0] == a[x2][y2][1]
    else:
        if x1%2 == 0:
            if y1 == y2:
                return a[x1][y1][1] == a[x2][y2][0]
            else:
                return a[x1][y1][0] == a[x2][y2][1]
        else:
            if y1 == y2:
                return a[x1][y1][0] == a[x2][y2][1]
            else:
                return a[x1][y1][1] == a[x2][y2][0]

def num(x, y):
    ans = x//2*(n*2-1)
    if x%2 == 1:
        ans += n
    ans += y+1
    return ans

n = int(input())
a = [[] for _ in range(n)]
for i in range(n):
    lim = n if i%2 == 0 else n-1
    for j in range(lim):
        a[i].append(tuple(map(int,input().split())))

q = deque()
check = [[False]*n for _ in range(n)]
dist = [[False]*n for _ in range(n)]
via = [[-1]*n for _ in range(n)]
check[0][0] = True
dist[0][0] = 1
q.append((0,0))

while q:
    x,y = q.popleft()
    for k in range(6):
        nx,ny = x+dx[x%2][k], y+dy[x%2][k]
        if not ok(nx,ny):
            continue
        if not go(x, y, nx, ny):
            continue
        if check[nx][ny]:
            continue
        check[nx][ny] = True
        dist[nx][ny] = dist[x][y] + 1
        via[nx][ny] = (x,y)
        q.append((nx,ny))

x = n-1
y = n-1

while not check[x][y]:
    y -= 1
    if y < 0:
        x -= 1
        y = n-1
        if x%2 == 1:
            y -= 1

print(dist[x][y])
s = []
while not (x == 0 and y == 0):
    s.append((x,y))
    x, y = via[x][y]
s.append((x,y))

while s:
    print(num(*s[-1]),end=' ')
    s.pop()
print()
