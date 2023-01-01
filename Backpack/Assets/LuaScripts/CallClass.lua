print("Call Class")

-- 使用c#的类的套路
    -- CS.命名空间.类名

local obj1 = GameObject() --()即可默认实例化
local obj2 = GameObject("obj2")  -- 命名实例化

--类中的静态对象可以直接.调用
local obj3 = GameObject.Find("obj2")
--对象的成员变量.调用
print(obj3.transform.position)
Debug = CS.UnityEngine.Debug.Log
Debug(obj3.transform.position)

-- 对象中的成员方法用:
obj3.transform:Translate(Vector3.right)
Debug(obj3.transform.position)

--使用自己的类
local t = CS.Test()
t:Speak("test1")

local t2 = CS.R.Test2()
t2:Speak("test2")

-- 使用继承自mono的类
-- xlua不支持无参泛型函数，要用type的重载
local obj5 = GameObject("添加脚本测试")
obj5:AddComponent(typeof(CS.LuaCallCSharp))

