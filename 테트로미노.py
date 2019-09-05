import sys

sys.stdin = open('tetromino.txt', 'r')

dx = [0, 0, -1, 1]
dy = [1, -1, 0, 0]
top = 0

def dfs(x, y, visited, count, pos):
    global top

    if count == 4:
        if top < pos:
            top = pos
        return

    for i in range(4):
        nx = x + dx[i]
        ny = y + dy[i]

        if 0 <= nx < N and 0 <= ny < M:
            if visited[nx][ny] == False:
                visited[nx][ny] = True
                dfs(nx, ny, visited, count + 1, pos + arr[nx][ny])
                visited[nx][ny] = False


arr = []
N, M = map(int, (input().split()))
for i in range(N):
    arr.append(list(map(int, input().split())))

ans = 0

visited = [[False]*M for i in range(N)]
for i in range(N):
    for j in range(M):
        if j < M-2:
            hi = arr[i][j] + arr[i][j+1] + arr[i][j+2]
            h1 = 0
            h2 = 0
            if i < N-1:
                h1 = arr[i+1][j+1]
            if i > 0:
                h2 = arr[i-1][j+1]
            hi += max(h1, h2)

        if i < N-2:
            wi = arr[i][j] + arr[i+1][j] + arr[i+2][j]
            w1 = 0
            w2 = 0
            if j < M-1:
                w1 = arr[i+1][j+1]
            if j > 0:
                w2 = arr[i+1][j-1]
            wi += max(w1, w2)
        # print(wi, hi)

        visited[i][j] = True
        dfs(i, j, visited, 1, arr[i][j])
        visited[i][j] = False

        if max(top, wi, hi) > ans:
            # print('answer', i, j, ans, max(good, wi, hi))
            ans = max(top, wi, hi)

print(ans)