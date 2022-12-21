-- 迭代器实现
function values(t)
    local i = 0
    return function() i = i + 1; return t[i] end
end

t = {1,2,3,4,5}
iter = values(t)
while true do
    local e = iter()
    if e == nil then break end
    print(e)
end

-- 泛型for循环
for e in values(t) do
    print(e)
end

-- 顺序迭代器
function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do
        a[#a + 1] = n
    end
    table.sort(a,f)
    local i = 0
    return function()
        i = i + 1
        return a[i], t[a[i]]
    end
end

for k, v in pairsByKeys(t) do
    print(k,v)
end

-- 传入函数的迭代器
function allwords(f)
    for line in io.lines() do
        for word in string.gmatch(line, "%w+") do
            f(word)
        end
    end
end

allwords(print)

local count = 0
allwords(
    function (w)
        if w == "hello" then count = count + 1 end
    end
)
print(count)