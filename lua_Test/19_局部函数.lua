--局部递归函数两种写法aa
local fact1
fact1= function (n)
    if n == 0 then return 1
    else return n * fact1(n-1)
    end
end

local function fact2(n)
    if n == 0 then return 1
    else return n * fact2(n-1)
    end
end

print(fact1(3))
print(fact2(3))

-- 在间接递归的情况下，必须使用与明确的前向声明
local f
local function g()
    print("g")
    f()
end
function f()
    print("f")
    g()
end

--f()