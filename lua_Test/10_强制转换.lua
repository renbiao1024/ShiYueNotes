--自动转换
--[[
A = 10
B = 11
C = "12"
D = "13.5"
print(A .. B .. C .. D) -- A B 被转换成字符串处理
print(A + B + C + D)    -- C D 被转换成浮点数处理
--]]

-- 显示转换
--[[
A = 10
C = "12"
E = tonumber(C)
F = tostring(A)
--print(E .. F)

--print(string.format("A = %d, C = %s", A, C))

s = "testStr"

print(string.sub(s, 1, 2))
print(s:sub(1,2))
--]]