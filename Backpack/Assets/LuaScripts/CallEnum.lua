-- CS.namespace.EnumName.data

local obj = GameObject.CreatePrimitive(PrimitiveType.Cube)

--使用自定义枚举
local c = CS.E_MyEnum.Idle
print(c)

-- 数值转枚举
local a = CS.E_MyEnum.__CastFrom(1)
-- 字符串转枚举
local b = CS.E_MyEnum.__CastFrom("Atk")
print(a,b)