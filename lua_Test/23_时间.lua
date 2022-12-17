print(os.time()) -- 不带参数返回当前流逝的时间
print(os.time({year = 2022, month = 12, day = 17, hour = 9, min = 45, sec = 3})) -- 输出指定的时间 年月日必须有
print(os.date("%Y-%m-%d", 1671241503)) -- 相当于time的反函数 ISO格式
print(os.date("!%c",os.time())) -- !表示UTC格式

t = os.date("*t") -- 获取当前的时间
print(os.date("%Y-%m-%d", os.time(t)))
t.day = 40 + t.day
print(os.date("%Y-%m-%d", os.time(t)))

--计算两个时间的差值
local t1 = os.time({year = 2022, month = 12, day = 17})
local t2 = os.time({year = 2031, month = 4, day = 12})
local d = os.difftime(t2,t1)
print(d)

-- 计算代码运行时间一般用精度更高的os.clock
local x = os.clock()
local s = 0
for i = 1, 10000 do s = s + i end
print(string.format("elapsed time: %.2f\n", os.clock() - x))