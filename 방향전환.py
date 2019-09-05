import sys

sys.stdin = open('changeDir.txt', 'r')

T = int(input())
for tc in range(T):
    x1, y1, x2, y2 = map(int, input().split())
    ans = 0

    x_dis = abs(x1 - x2)
    y_dis = abs(y1 - y2)
    diff = abs(x_dis - y_dis)
    if diff <= 1:
        ans = x_dis + y_dis
    else:
        if diff % 2 == 1:
            ans = diff * 2 - 1
        else:
            ans = diff * 2
        ans += x_dis



    print('#{} {}'.format(tc+1, ans))