import sys

sys.stdin = open('atomExtinction.txt', 'r')

T = int(input())
arr = [[0] * 4001 for _ in range(4001)]
for tc in range(T):
    N = int(input())
    atoms = []
    for _ in range(N):
        x, y, dir, power = map(int, input().split())
        atoms.append([2*x, 2*y, dir, power])

    ans = 0
    while True:
        atoms_des = []
        for i in range(N):
            a = atoms[i][0]
            b = atoms[i][1]
            if atoms[i][2] == 0:
                b += 1
            elif atoms[i][2] == 1:
                b -= 1
            elif atoms[i][2] == 2:
                a -= 1
            elif atoms[i][2] == 3:
                a += 1

            if abs(a) > 2000 or abs(b) > 2000:
                atoms_des.append(i)
            else:
                arr[a+2000][b+2000] += 1

            atoms[i][0] = a
            atoms[i][1] = b

        for i in range(N):
            if abs(atoms[i][0]) <= 2000 and abs(atoms[i][1]) <= 2000:
                if arr[atoms[i][0]+2000][atoms[i][1]+2000] >= 2:
                    atoms_des.append(i)
                    ans += atoms[i][3]

        for i in range(N):
            if abs(atoms[i][0]) <= 2000 and abs(atoms[i][1]) <= 2000:
                arr[atoms[i][0]+2000][atoms[i][1]+2000] = 0

        cnt = 0
        for i in sorted(atoms_des, reverse=True):
            atoms.pop(i)
            cnt += 1
        N -= cnt

        if N <= 1:
            break

    print('#{} {}'.format(tc+1, ans))