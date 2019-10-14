import sys

sys.stdin = open('booster.txt', 'r')

N, Q = map(int, input().split())

checkpoint = []
for _ in range(N):
    checkpoint.append(list(map(int, input().split())))


dx = [0, 0, -1, 1]
dy = [1, -1, 0, 0]

arr = []
checkpoint.sort(key=lambda x: x[0])
for i in range(N-1):
    arr.append([checkpoint[i+1][0] - checkpoint[i][1], checkpoint[i][0], checkpoint[i+1][0]])
checkpoint.sort(key=lambda x: x[1])
for i in range(N-1):
    arr.append([checkpoint[i + 1][1] - checkpoint[i][1], checkpoint[i][0], checkpoint[i + 1][0]])



for _ in range(Q):
    A, B, X = map(int, input().split())
    HP = X
    start_x = checkpoint[A-1][0]
    start_y = checkpoint[A-1][1]
    li = [[start_x, start_y]]
    visit = []
    boost = True
    check = False

    while li:
        a, b = li.pop(0)
        visit.append([a, b])

        if [a, b] == [checkpoint[B-1][0], checkpoint[B-1][1]]:
            check = True
            break

        if [a, b] in checkpoint:
            boost = True
            HP = X

        if boost:
            for i in checkpoint:
                if i not in visit:
                    if a == i[0] or b == i[1]:
                        li.append([i[0], i[1]])

        if HP > 0:
            for i in range(4):
                na = a + dx[i]
                nb = b + dy[i]
                if [na, nb] not in visit:
                    HP -= 1
                    li.append([na, nb])

    if check:
        print('YES')
    else:
        print('NO')






