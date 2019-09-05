import sys

sys.stdin = open('wireless.txt', 'r')

T = int(input())
for tc in range(T):
    M, A = map(int, input().split())
    A_arr = list(map(int, input().split()))
    B_arr = list(map(int, input().split()))
    BC = []
    for i in range(A):
        BC.append(list(map(int, input().split())))

    sum_final = 0

    A_start_x, A_start_y = 1, 1
    B_start_x, B_start_y = 10, 10

    for i in range(M + 1):
        A_ok = [False] * A
        B_ok = [False] * A
        if i == 0:
            pass
        else:
            if A_arr[i - 1] == 1:
                A_start_y = A_start_y - 1
            elif A_arr[i - 1] == 2:
                A_start_x = A_start_x + 1
            elif A_arr[i - 1] == 3:
                A_start_y = A_start_y + 1
            elif A_arr[i - 1] == 4:
                A_start_x = A_start_x - 1

            if B_arr[i - 1] == 1:
                B_start_y = B_start_y - 1
            elif B_arr[i - 1] == 2:
                B_start_x = B_start_x + 1
            elif B_arr[i - 1] == 3:
                B_start_y = B_start_y + 1
            elif B_arr[i - 1] == 4:
                B_start_x = B_start_x - 1

        for j in range(A):
            current_BC = BC[j]
            D1 = abs(current_BC[0] - A_start_x) + abs(current_BC[1] - A_start_y)
            D2 = abs(current_BC[0] - B_start_x) + abs(current_BC[1] - B_start_y)

            if D1 <= current_BC[2]:
                A_ok[j] = True
            if D2 <= current_BC[2]:
                B_ok[j] = True

        A_max, B_max = 0, 0
        sum_max = 0

        for a in range(A):
            for b in range(A):
                if a == b:
                    if A_ok[a] == True and B_ok[b] == True:
                        if sum_max < BC[a][3]:
                            sum_max = BC[a][3]
                    else:
                        if A_ok[a] == True:
                            A_max = BC[a][3]
                        else:
                            A_max = 0

                        if B_ok[b] == True:
                            B_max = BC[b][3]
                        else:
                            B_max = 0

                        if sum_max < A_max + B_max:
                            sum_max = A_max + B_max

                else:
                    if A_ok[a] == True:
                        A_max = BC[a][3]
                    else:
                        A_max = 0

                    if B_ok[b] == True:
                        B_max = BC[b][3]
                    else:
                        B_max = 0

                    if sum_max < A_max + B_max:
                        sum_max = A_max + B_max

        sum_final += sum_max

    print('#{} {}'.format(tc+1, sum_final))
