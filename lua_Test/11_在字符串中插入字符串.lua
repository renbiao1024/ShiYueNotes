function InsertStr(s, a, p)
    local s1 = s:sub(1,p)
    local s2 = s:sub(p+1,-1)
    local res = s1..a..s2
    return res
end

Res = InsertStr("Hello World", "My ", 6)

print(Res)