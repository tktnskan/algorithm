input = [[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]



input = sorted(input, key=lambda s : s[1], reverse=True)
y = []
max_y = 0
for i in input:
    if max_y < i[1]:
        max_y = i[1]

    if i[1] not in y:
        y.append(i[1])

print(input)
print(y)

arr = [[[], [], []] for _ in range(max_y+1)]
cnt = 1
for i in y:
    y_cnt = 0
    while i == input[cnt][1]:
        arr[i][0] = input[cnt]
        cnt += 1
        y_cnt += 1

print(arr)
        # else:
        #     if input[cnt][1]:
