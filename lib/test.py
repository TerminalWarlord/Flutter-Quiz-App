
for _ in range(int(input())):
    s = list(input())
    s.sort()
    str_set = set(s)
    if len(str_set)==1:
        print("NO")
        continue
    print("YES")
    s[0],s[-1]=s[-1], s[0]
    ans = "".join(s)
    print(ans)
    