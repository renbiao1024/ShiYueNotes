--[[随机数
print(math.random(2,5))
--]]

--取整
--[[
N = 4.32
print(math.floor(N))
print(math.ceil(N))
print(math.modf(N)) --对0取整  返回整数 和 小数 部分
--]]

--最值
--[[
print(math.maxinteger)
print(0x7fffffffffffffff)
print(math.mininteger)
print(0x8000000000000000)
--]]

--整型和浮点型转换
--[[
N = 1
M = N + 0.0
P = M | 0
print(math.type(N))
print(math.type(M))
print(math.type(P))
--]]

