print("test.lua")
testNumber = 1
testBool = true
testFloat = 1.2
testString =  "123"
local testLocalNum = 231


-- 函数
testFun = function()
    print("无参无返回")
end

testFun2 = function(a)
    print("有参有返回")
    return a + 1
end

testFun3 = function(a)
    print("多返回值")
    return 1,2,false, "123",a
end

testFun4 = function(a, ...)
    print("变长参数")
    print(a)
    arg = {...}
    for k,v in pairs(arg) do
        print(k,v)
    end
end


testList = {1,2,3,4,5,6}
testList2 = {"123", "234", true, 1, 1.2}

testDic = {
    ["1"] = 1,
    ["2"] = 2,
    ["3"] = 3
}

testDic2 = {
    ["1"] = 1,
    [true] = 1,
    [false] = false,
    ["123"] = 1.2
}

testClass = {
    testInt = 2,
    testBool = true,
    testFloat = 1.2,
    testString = "123",
    testFunc = function()
        print("123")
    end
}