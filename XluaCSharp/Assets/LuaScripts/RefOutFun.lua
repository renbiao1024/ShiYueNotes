Lesson5 = CS.Lesson5

local obj = Lesson5()

-- 接收的参数第一个是返回值后面是ref的一一对应
local a,b = obj:RefFun(1,0) --ref传参不可省略
print(a,b)

local a,b = obj:OutFun(1) -- out传参时可以省略
print(a,b)

local a,b,c = obj:RefOutFun(1,2)
print(a,b,c)
