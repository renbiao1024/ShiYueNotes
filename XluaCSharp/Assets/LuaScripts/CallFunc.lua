Lesson4 = CS.Lesson4

Lesson4.Eat()

local obj = Lesson4()
obj:Speak("hhhh")

-- 使用拓展方法,需要在c#侧添加[LuaCallCSharp]
-- 其他类添加这个[LuaCallCSharp]会提升性能
obj:Move()