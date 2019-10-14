arr = "ABCDE"
pick = []
n = len(arr)
r = 3

def comb(k, start):
    if k == r:
        print(pick)
        return

    for i in range(start, n):
        pick.append(arr[i])
        comb(k+1, i+1)
        pick.pop()

comb(0,0)

print('-----------')
def perm(k, used):
    if k == r:
        print(" ".join(pick))
        return

    for i in range(n):
        if used & (1 << i):
            continue

        pick.append(arr[i])

        perm(k+1, used| (1 << i))
        pick.pop()

perm(0,0)