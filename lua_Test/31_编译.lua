-- 从一个字符串或函数中读取代码段
    -- 函数g像我们所预期地那样操作局部变量i，但函数f操作的却是全局变量i，
    -- 这是由于函数load总是在全局环境中编译代码段。
i = 1
local i = 0
f = load("i = i + 1;print(i)")
g= function() i = i + 1; print(i) end

f()
g()

-- loadfile 等价表达
f = load(io.lines(filename, "*L"))

-- 函数assert检查其第1个参数是否为真，如果该参数为真则返回该参数；如果该参数为假则引发一个错误。
-- 该函数的第2个参数是一个可选的错误信息
n = io.read()
assert(tonumber(n), "n is not a number")

-- 函数pcall会以一种保护模式（protected mode）来调用它的第1个参数，
-- 以便捕获该函数执行中的错误。
-- 无论是否有错误发生，函数pcall都不会引发错误。
-- 如果没有错误发生，那么pcall返回true及被调用函数（作为pcall的第1个参数传入）的所有返回值；
-- 否则，则返回false及错误信息。
local status, err = pcall(function() error({code=121}) end)
-- 通过error来抛出异常（throw an exception），然后用函数pcall来捕获（catch）异常，而错误信息则用来标识错误的类型。