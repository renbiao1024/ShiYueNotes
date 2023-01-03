local obj = CS.Lesson6()

-- lua 不支持写重载函数，但支持调用c#的重载函数
print(obj:Calc())
print(obj:Calc(15,1))

-- 但是由于lua只有number，对c#的多精度重载函数支持不好
--print(obj:Calc(10))
--print(obj:Calc(10.2))
-- 解决方法,效率低

local m1 = typeof(CS.Lesson6):GetMethod("Calc",{typeof(CS.System.Int32)})
local m2 = typeof(CS.Lesson6):GetMethod("Calc",{typeof(CS.System.Single)})
-- 转一次记录下来重复使用

local f1 = xlua.tofunction(m1)
local f2 = xlua.tofunction(m2)
-- 成员函数第一个参数传对象，静态方法不需要
print(f1(obj, 10))
print(f2(obj, 10.2))
