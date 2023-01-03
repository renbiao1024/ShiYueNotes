util = require("xlua.util")
local obj = GameObject("Coroutine")
local mono = obj:AddComponent(typeof(CS.LuaCallCSharp))

-- 希望开始的协程函数
fun = function ()
    local a = 1
    while true do
        coroutine.yield(WaitForSeconds(1))
        print(a)
        a = a + 1
    end
end

--lua函数如果要作为协程函数，必须先调用xlua.util.cs_generator
-- mono:StartCoroutine(util.cs_generator(fun))--xlua提供的一个工具表