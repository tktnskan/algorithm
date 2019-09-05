import sys

sys.stdin = open('maze.txt', 'r')

from itertools import permutations
arr1 = [list(map(int, input().split())) for _ in range(5)]
arr2 = [list(map(int, input().split())) for _ in range(5)]
arr3 = [list(map(int, input().split())) for _ in range(5)]
arr4 = [list(map(int, input().split())) for _ in range(5)]
arr5 = [list(map(int, input().split())) for _ in range(5)]

dx = [-1, 1, 0, 0, 0, 0]
dy = [0, 0, 1, -1, 0, 0]
dz = [0, 0, 0, 0, 1, -1]


def rotate(ar, a):
    arr = [[0] * 5 for _ in range(5)]
    if a == 0:
        for i in range(5):
            for j in range(5):
                arr[i][j] = ar[i][j]
        return arr
    elif a == 1:
        for i in range(5):
            for j in range(5):
                arr[i][j] = ar[4-j][i]
        return arr
    elif a == 2:
        for i in range(5):
            for j in range(5):
                arr[i][j] = ar[4-i][4-j]
        return arr
    elif a == 3:
        for i in range(5):
            for j in range(5):
                arr[i][j] = ar[j][4-i]
        return arr

a = rotate(arr1, 2)
for i in arr1:
    print(i)
print('-------------')
for i in a:
    print(i)

def bfs(start_info):
    while start_info:
        x, y, z = start_info.pop(0)

        if x == 4 and y == 4 and z == 4:
            break

        v = visited[x][y][z]
        for p in range(6):
            nx = x + dx[p]
            ny = y + dy[p]
            nz = z + dz[p]

            if 0 <= nx < 5 and 0 <= ny < 5 and 0 <= nz < 5:
                if threeDmap[nx][ny][nz] == 1 and visited[nx][ny][nz] == -1:
                    # print(visited[0][0][0])
                    # print(threeDmap[0][0][0])
                    visited[nx][ny][nz] = v + 1
                    start_info.append([nx, ny, nz])


ans = []


per = list(permutations([0, 1, 2, 3, 4], 5))
check = False
for a in range(4):
    for b in range(4):
        for c in range(4):
            for d in range(4):
                for e in range(4):
                    ar1 = rotate(arr1, a)
                    ar2 = rotate(arr2, b)
                    ar3 = rotate(arr3, c)
                    ar4 = rotate(arr4, d)
                    ar5 = rotate(arr5, e)

                    threeDmap = [0, 0, 0, 0, 0]
                    for f in per:
                        # print(f,g,h,i,j)
                        threeDmap[f[0]] = ar1
                        threeDmap[f[1]] = ar2
                        threeDmap[f[2]] = ar3
                        threeDmap[f[3]] = ar4
                        threeDmap[f[4]] = ar5
                        visited = [[[-1] * 5 for _ in range(5)] for _ in range(5)]
                        # print(visited[0][0][0])
                        # print(threeDmap[0][0][0])
                        if threeDmap[0][0][0] == 1:
                            visited[0][0][0] = threeDmap[0][0][0]
                            bfs([[0, 0, 0]])

                        if visited[4][4][4] >= 13:
                            ans.append(visited[4][4][4])
                            if visited[4][4][4] == 13:
                                check = True
                                break
                    if check:
                        break
            if check:
                break
        if check:
            break
    if check:
        break

if ans:
    print(min(ans)-1)
else:
    print(-1)