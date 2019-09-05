from collections import deque

dx = [0, 0, 1, -1]
dy = [1, -1, 0, 0]


def bfs(sx, sy):
    q = deque()
    q.append((sx, sy))
    check[sx][sy] = True
    cnt = [0, 0]
    while q:
        x, y = q.popleft()
        if a[x][y] == 'v':
            cnt[0] += 1
        elif a[x][y] == 'o':
            cnt[1] += 1

        for k in range(4):
            nx, ny = x + dx[k], y + dy[k]
            if nx < 0 or nx >= n or ny < 0 or ny >= m:
                continue
            if a[nx][ny] == '#':
                continue
            if check[nx][ny]:
                continue
            q.append((nx, ny))
            check[nx][ny] = True
    return cnt


n, m = map(int, input().split())
a = [input() for _ in range(n)]
check = [[False] * m for _ in range(n)]
d = []
for i in range(n):
    for j in range(m):
        if a[i][j] != '#' and not check[i][j]:
            d.append(bfs(i, j))
v, o = 0, 0
for cnt in d:
    if cnt[0] >= cnt[1]:
        v += cnt[0]
    else:
        o += cnt[1]
print(f"{o} {v}")