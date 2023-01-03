local obj = CS.Lesson12()
local child = CS.Lesson12.TestChild()
local father = CS.Lesson12.TestFather()

-- lua支持有参数有约束的泛型函数
obj:TestFun1(father,child)
obj:TestFun1(child,father)

-- lua不支持有参数没有约束的泛型
--obj:TestFun2(child)

-- lua不支持有约束没有参数的泛型
--obj:TestFun3()

-- lua不支持非class的约束
--obj:TestFun4(child)

-- 使用上述不支持的函数，mono打包支持，但是il2cpp不支持
-- 得到通用函数，设置泛型类型，再使用
local testFun2 = xlua.get_generic_method(CS.Lesson12, "TestFun2")
local testFun2_Int32 = testFun2(CS.System.Int32)
testFun2_Int32(obj, 1)