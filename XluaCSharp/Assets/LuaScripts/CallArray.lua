local obj = CS.Lesson3()

-- -- 使用c#的规则
-- print(obj.arr.Length) -- 不能用#获取长度
-- print(obj.arr[0])
-- -- 遍历从0开始
-- for i = 0, obj.arr.Length - 1 do
--     print(obj.arr[i])
-- end

-- -- lua创建c#数组
-- local arr2 = CS.System.Array.CreateInstance(typeof(CS.System.Int32), 10)
-- print(arr2.Length)

--list
obj.list:Add(1)
obj.list:Add(2)
print(obj.list.Count)
for i = 0, obj.list.Count - 1 do
    print(obj.list[i])
end

-- 创建list
local lst_String = CS.System.Collections.Generic.List(CS.System.String)
local lst3 = lst_String()
lst3:Add("2123123")
print(lst3[0])

-- 字典
obj.dic:Add(1,"123")
print(obj.dic[1])

for k,v in pairs(obj.dic) do
    print(k,v)
end

-- 创建字典
local Dic_String_Vector3 = CS.System.Collections.Generic.Dictionary(CS.System.String, CS.UnityEngine.Vector3)
local dic2 = Dic_String_Vector3()
dic2:Add("123",CS.UnityEngine.Vector3.right)

for i,v in pairs(dic2) do
    print(i,v)
end

-- 自己创建的字典不能这么得到值
-- print(dic2["123"])
print(dic2:get_Item("123"))
print(dic2:TryGetValue("123"))
dic2:set_Item("123", nil)
print(dic2:get_Item("123"))
