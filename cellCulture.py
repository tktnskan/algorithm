import sys

sys.stdin = open('cellCulture.txt', 'r')

T = int(input())
for tc in range(1):
    N, M, time = map(int, input().split())
    arr = [list(map(int, input().split())) for _ in range(N)]
    print(N, M, time)
    print(arr)


    for _ in range(time):
        for