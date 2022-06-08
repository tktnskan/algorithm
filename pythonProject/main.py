# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press ⌘F8 to toggle the breakpoint.
    print(.1 + .1 == .2)


class FunEvent:
    def __init__(self, tags, year):
        self.tags = tags
        self.year = year

    def __str__(self):
        return f"FunEvent(tags={self.tags}, year={self.year})"


tags = ["google", "ml"]
year = 2022
bootcamp = FunEvent(tags, year)
tags.append("bootcamp")
year = 2023
print(bootcamp)

a = ["1", 1]
# print(id(a))     # a의 고유 주소 값 출력
# a = a + ("ㄱ",)
print(a)
# print(id(a))     # (4,) 값이 더해 진 후 a의 고유 주소 값 출력

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
