prototype = {x=0, y=0, width=100, height=100}

local mt = {}

function new(o)
    setmetatable(o,mt)
    return o
end

-- mt.__index = function(_, key)
--     return prototype[key]
-- end

mt.__index = prototype

-- Lua语言会以w（表）和"width"（不存在的键）为参数来调用这个__index元方法。
-- 元方法随后会用这个键来检索原型并返回结果。
-- 当Lua语言查找元表的__index字段时，会发现字段的值是表prototype。
-- 因此，Lua语言就会在这个表中继续查找，即等价地执行prototype["width"]，并得到预期的结果。
w = new{x = 10, y = 20}
--print(w.width)

-- 调用rawget（t,i）会对表t进行原始（raw）的访问，即在不考虑元表的情况下对表进行简单的访问。

-- 元方法__newindex与__index类似，不同之处在于前者用于表的更新而后者用于表的查询。
-- 当对一个表中不存在的索引赋值时，解释器就会查找__newindex元方法：
-- 如果这个元方法存在，那么解释器就调用它而不执行赋值。
-- 像元方法__index一样，如果这个元方法是一个表，解释器就在此表中执行赋值，而不是在原始的表中进行赋值。
-- 此外，还有一个原始函数允许我们绕过元方法：调用rawset（t,k,v）来等价于t[k]=v，但不涉及任何元方法。

-- 具有默认值的表
local function setDefault(t,d)
    local mt = {__index = function() return d end}
    setmetatable(t,mt)
end
-- 如果不担心命名冲突的话，我们可以使用形如"___"这样的键作为额外的字段：
local mt = {__index = function(t) return t.___ end}
local function setDefault(t,d)
    t.___ = d
    setmetatable(t,mt)
end
-- 如果担心命名冲突，要确保这个特殊键的唯一性也很容易，只需要创建一个新的排除表，然后将它作为键
local key = {}
local mt = {__index = function(t) return t.[key] end}

local function setDefault(t,d)
    t[key] = d
    setmetatable(t,mt)
end

local tab = {x = 10, y = 20}
print(tab.z)
setDefault(tab, 2)
print(tab.z)