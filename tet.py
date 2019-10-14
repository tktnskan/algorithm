


lock = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
for i in lock:
    print(i)
print('-============')
lock = list(map(list, zip(*lock)))[::-1]

for i in lock:
    print(i)
print('-============')

lock = list(map(list, zip(*lock)))[::-1]
for i in lock:
    print(i)
print('-============')
