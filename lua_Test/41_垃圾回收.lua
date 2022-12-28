-- 弱引用表，只要有一个键或值被回收了，那么对应的整个键值对都会被从表中删除。
-- 一个表是否为弱引用表是由其元表中的__mode字段所决定的。
-- 当这个字段存在时，其值应为一个字符串：如果这个字符串是"k"，那么这个表的键是弱引用的；
-- 如果这个字符串是"v"，那么这个表的值是弱引用的；如果这个字符串是"kv"，那么这个表的键和值都是弱引用的。

a = {}
mt = {__mode = "k"}
setmetatable(a,mt)
key = {}
a[key] = 1
key = {} -- 覆盖了指向第一个键的索引
collectgarbage()
for k,v in pairs(a) do print(v) end

-- 析构
o = {x = "hi"}
mt = {__gc = true} -- 在设置元表后，很少会改变元方法。如果真的需要在后续设置元方法，那么可以给字段__gc先赋一个任意值作为占位符
setmetatable(o,mt)
mt.__gc = function(o) print(o.x)end
print(o.x)
o = nil
-- print(o.x)
collectgarbage()