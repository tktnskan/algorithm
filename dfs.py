import sys

sys.stdin = open('sample_input.txt', 'r')


def dfs(li, ct):
    global a, arr, N
    if li == sorted(arr) or li == sorted(arr)[::-1]:
        # print('1')
        if ct < a:
            # print('2')
            a = ct
        return
    if ct >= 5 or ct >= a:
        return

    for i in range(N):
        send = []
        mid = int(N/2)
        L = li[:mid]
        R = li[mid:]
        # print('L', L)
        # print('R', R)

        if i < mid:
            # print('3', i)
            for j in range(mid - i - 1):
                send.append(L.pop())
            while len(R) > 0:
                if len(L) != 0:
                    send.append(L.pop())
                if len(R) != 0:
                    send.append(R.pop())
        else:
            # print('4', i)
            for j in range(i - mid):
                send.append(R.pop())
            while len(L) > 0:
                if len(R) != 0:
                    send.append(R.pop())
                if len(L) != 0:
                    send.append(L.pop())
        # print('5', send)
        dfs(send, ct + 1)


T = int(input())
for _ in range(T):
    N = int(input())
    arr = list(map(int, input().split()))
    cnt = 0
    a = 9999

    dfs(arr, cnt)

    if a == 9999:
        print(-1)
    else:
        print(a)
