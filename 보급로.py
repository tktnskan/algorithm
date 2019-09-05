import sys

sys.stdin = open('supplyRoute.txt', 'r')
#
# def dfs(x, y, route, visited):
#     global ans
#
#     if [x, y] == [N-1, N-1]:
#         if ans > route:
#             ans = route
#             print(ans)
#         return
#
#     if route > ans:
#         return
#
#     for i in range(4):
#         nx = x + dx[i]
#         ny = y + dy[i]
#
#         if 0 <= nx < N and 0 <= ny < N and visited[ny][nx] == False:
#             visited[ny][nx] = True
#             dfs(nx, ny, route + arr[ny][nx], visited)
#             visited[ny][nx] = False
#

T = int(input())

dx = [0, 1, 0, -1]
dy = [1, 0, -1, 0]

for tc in range(1, T + 1):
    N = int(input())
    arr = [list(map(int, list(input()))) for _ in range(N)]
    ans = 9999999
    visited = [[-1] * N for _ in range(N)]
    visited[0][0] = arr[0][0]
    # dfs(0, 0, 0, visited)

    li = [[0, 0]]
    while li:
        x, y = li.pop(0)

        if x == N-1 and y == N-1:
            continue

        v = visited[x][y]
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]

            if 0 <= nx < N and 0 <= ny < N:
                if visited[nx][ny] == -1 or v + arr[nx][ny] < visited[nx][ny]:
                    visited[nx][ny] = v + arr[nx][ny]
                    li.append([nx, ny])

    print('#{} {}'.format(tc, visited[N-1][N-1]))
    # for i in range(1, N):
    #     arr[0][i] += arr[0][i-1]
    # for i in range(1, N):
    #     arr[i][0] += arr[i-1][0]
    #
    #
    # for i in range(1, N):
    #     for j in range(1, N):
    #         arr[j][i] += min(arr[j-1][i], arr[j][i-1])
    # print(arr[N-1][N-1])
