import  sys

sys.stdin = open('papers.txt', 'r')


def dfs(a):
    global ans, plusAll

    if ans > 0 and ans <= a:
        return

    if plusAll == 0:
        if ans == -1 or ans > a:
            ans = a
        return

    for i in range(10):
        for j in range(10):
            if arr[i][j]:
                break
        if arr[i][j]:
            break

    if arr[i][j]:
        for size in range(5):
            if papers[size]:
                tmp = []

                check = True
                for y in range(i, i + size + 1):
                    for x in range(j, j + size + 1):
                        if 0 <= y < 10 and 0 <= x < 10:
                            if arr[y][x] == 0:
                                check = False
                        else:
                            check = False

                if check == True:
                    for next_y in range(i, i + size + 1):
                        for next_x in range(j, j + size + 1):
                            arr[next_y][next_x] = 0
                            tmp.append((next_y, next_x))

                    square = (size+1)*(size+1)
                    plusAll -= square
                    papers[size] -= 1
                    dfs(a+1)
                    papers[size] += 1
                    plusAll += square

                    for y_x in tmp:
                        arr[y_x[0]][y_x[1]] = 1


arr = []
plusAll = 0
for _ in range(10):
    a = list(map(int, input().split()))
    plusAll += sum(a)
    arr.append(a)

papers = [5, 5, 5, 5, 5]
ans = -1

dfs(0)
print(ans)
