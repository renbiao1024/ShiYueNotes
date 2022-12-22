-- -- 全局变量
-- -- for n in pairs (_G) do print(n) end

-- -- 由于全局环境是一个普通的表，因此可以简单地使用对应的键（变量名）直接进行索引。
-- _G["skr"] = "wyf"
-- print(_G["skr"])

-- -- 直接使用_G["io.read"]，显然是不能从表io中得到字段read的。
-- -- 但我们可以编写一个函数getfield让getfield（"io.read"）返回想要的结果。
-- function getfield(f)
--     local v = _G -- 从全局表开始
--     for w in string.gmatch(f, "[%a_[%w_]*") do
--         v = v[w]
--     end
--     return v
-- end

-- -- 函数setfield完成了这个需求，并且同时创建了路径中不存在路径对应的中间表
-- function setfield(f,v)
--     local t = _G
--     for w, d in string.gmatch(f, "([%a_[%w_]*)(%.?)") do
--         if d == "." then
--             t[w] = t[w] or {}
--             t = t[w]
--         else
--             t[w] = v    -- 对最后一个名字赋值
--         end
--     end
-- end

-- a = 15
-- _ENV = {g = _G}
-- a = 1
-- g.print(_ENV.a, a, g.a) --> 1 1 15

local M = {}
local _G = _G
-- 之后的全局变量或者函数都是M下
_ENV = M
function Add(c1,c2)
    return c1 + c2
end
_ENV = nil

_G.print(M.Add(1,2))

