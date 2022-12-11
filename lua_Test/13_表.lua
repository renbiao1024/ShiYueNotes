--[[
a = {}
b = a
a["x"] = 10
print(b["x"])
b = nil
print(a["x"])
--]]

--[[
a = {}
for i = 1, 100 do a[i] = i end
a['x'] = 2
a["sdf"] = 3
a[3] = 4
a.sdf = 2
a.x = 2
b = {x = 1, y = 2}
b.x = 2
b.y = 1
--]]

--[[
t = {
    10, print, [5] = "x", "k"
}

-- pairs遍历 不能保证顺序
print("pairs")
for k,v in pairs(t) do
    print(k, v)
end

--ipairs遍历 能保证顺序，但不能自定义下标，否则无输出
print("ipairs")
for k,v in ipairs(t) do
    print(k, v)
end
-- 和ipairs等价
for k = 1, #t do
    print(k, t[k])
end
--]]

--使用 insert remove 模拟 栈/队列
t = {1,2,3,4,5,6}
t:insert(7)
t:remove()
t:move(2, #t, 1)
a[#t] = nil

m = {}
t:move(1, #a, #m, m) -- 把a的元素复制到m的末尾