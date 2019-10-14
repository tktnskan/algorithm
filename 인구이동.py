import sys

sys.stdin = open('movepeople.txt', 'r')

N, L, R = map(int, input().split())
arr = []
for i in range(N):
    arr.append(list(map(int, input().split())))

cnt = 0
dx = [0, 0, -1, 1]
dy = [1, -1, 0, 0]
while True:
    visit = [[False] * N for _ in range(N)]
    check = True
    for i in range(N):
        for j in range(N):
            if visit[i][j] == False:
                add = []
                li = [[i, j]]
                sum_pol = 0
                visit[i][j] = True

                while li:
                    x, y = li.pop(0)

                    sum_pol += arr[x][y]
                    add.append([x, y])

                    for di in range(4):
                        nx = x + dx[di]
                        ny = y + dy[di]

                        if 0 <= nx < N and 0 <= ny < N and visit[nx][ny] == False:
                            if L <= abs(arr[x][y] - arr[nx][ny]) <= R:
                                visit[nx][ny] = True
                                li.append([nx, ny])

                if len(add) >= 2:
                    check = False

                new_pol = sum_pol // len(add)

                for a in add:
                    arr[a[0]][a[1]] = new_pol

    if check:
        break

    cnt += 1

print(cnt)