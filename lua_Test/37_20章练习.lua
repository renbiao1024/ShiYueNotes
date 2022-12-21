-- local mt = {}
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


-- local s1 = new{1,2,3,4}
-- local s2 = new{2,4,6,7}
-- local s3 = s1 - s2
-- print(tostring(s3))
-- print(#s3)


-- 用一个函数作为__index元方法。这种方式使得访问的开销更大，但是创建只读表的开销更小。
local key = {}
local mt = { -- create metatable
    __index = function (t,k) return t[key][k] end,
    __newindex = function (t, k, v)
        error("attempt to update a read-only table", 2)
    end
}

local function readOnly (t)
    local proxy = {[key] = t}
    setmetatable(proxy, mt)
    return proxy
end

local days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday",
                     "Thursday", "Friday", "Saturday"}
print(days[2])
-- days[2] = "Noday"