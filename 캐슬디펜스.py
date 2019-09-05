import sys

sys.stdin = open('castleDefense.txt', 'r')

from copy import deepcopy
N, M, D = map(int, input().split())
arr = []
for _ in range(N):
    arr.append(list(map(int, input().split())))

ener = []
for i in range(N-1, -1, -1):
    for j in range(M):
        if arr[i][j] != 0:
            ener.append([i, j])
# print(ener)
top = 0
for i in range(M):
    for j in range(i+1, M):
        for k in range(j+1, M):
            enermy = deepcopy(ener)
            kill = 0
            arrows = [i, j, k]

            while len(enermy) != 0:
                killEnermy = []
                for a in range(3):
                    for b in range(1, D + 1):
                        count = 0
                        pos = []
                        for c in enermy:
                            if abs(arrows[a] - c[1]) + abs(N - c[0]) == b:
                                pos.append([count, c[1]])

                            count += 1

                        min_x = 999
                        count1 = -1
                        for c in pos:
                            if min_x > c[1]:
                                min_x = c[1]
                                count1 = c[0]

                        if count1 not in killEnermy and count1 != -1:
                            killEnermy.append(count1)

                        if len(pos) != 0:
                            break

                cnt = 0
                for a in sorted(killEnermy):
                    enermy.pop(a-cnt)
                    kill += 1
                    cnt += 1

                cnt = 0
                for a in range(len(enermy)):
                    enermy[a-cnt][0] += 1
                    if enermy[a-cnt][0] >= N:
                        enermy.pop(a-cnt)
                        cnt += 1
            if kill > top:
                top = kill

print(top)










