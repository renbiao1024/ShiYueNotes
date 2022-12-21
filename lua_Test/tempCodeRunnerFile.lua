local mt = {}
-- local function new(l)
--     local newSet = {}
--     setmetatable(newSet,mt)
--     for _, v in ipairs(l) do newSet[v] = true end
--     return newSet
-- end

-- mt.__tostring = function (set)
--     local l = {}
--     for e in pairs(set) do
--         l[#l + 1] = tostring(e)
--     end
--     return "{" .. table.concat(l,", ") .."}"
-- end

-- -- 定义一个元方法__sub，该元方法用于计算两个集合的差集
-- mt.__sub = function(a,b)
--     local s = new{}
--     for k in pairs(a) do
--         if not b[k] then 
--             s[k] = true
--         end
--     end
--     return s
-- end

-- -- 定义一个元方法__len，该元方法用于实现使用#s计算集合s中的元素个数
-- mt.__len = function(set)
--     local n = 0
--     for i in pairs(set) do
--         n = n + 1
--     end
--     return n
-- end

