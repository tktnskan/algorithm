dx = [0,0,1,-1]
dy = [1,-1,0,0]
def go(x, y, num, length):
    if length == 6:
        ans.add(num)
        return
    for k in range(4):
        nx,ny = x+dx[k],y+dy[k]
        if 0 <= nx < n and 0 <= ny < n:
            go(nx,ny,num*10+a[nx][ny],length+1)
n = 5
# a = [list(map(int,input().split())) for _ in range(n)]
a = [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 2, 1], [1, 1, 1, 1, 1]]
ans = set()
for i in range(n):
    for j in range(n):
        go(i,j,a[i][j],1)
print(ans)
print(len(ans))
