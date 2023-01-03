Lesson7 = CS.Lesson7
local obj = Lesson7()

local fun = function()
    print("luafunction")
end

-- 第一次往委托加函数要先=
obj.del = fun
obj.del = obj.del + function()
    print("临时函数") -- 最好先声明，这样不好移除
end
-- obj.del()

obj.del = obj.del - fun
obj.del()

obj.del = nil -- 清空

-- 事件的写法
local fun2 = function()
    print("fun2") -- 最好先声明，这样不好移除
end
obj:eventAction("+",fun2)
obj:DoEvent()
obj:eventAction("-",fun2)
obj:DoEvent()
-- 在c#清空
obj:ClearEvent()