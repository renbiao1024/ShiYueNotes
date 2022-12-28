-- 创建协程
co = coroutine.create(function() print("hi") end)
print(type(co))

-- 一个协程有以下四种状态，即挂起（suspended）、运行（running）、正常（normal）和死亡（dead）。
-- 我们可以通过函数coroutine.status来检查协程的状态
print(coroutine.status(co)) --刚创建时是挂起态

coroutine.resume(co)-- resume 变成运行态
print(coroutine.status(co)) -- 运行完变成死亡态

-- yield函数可以让一个运行中的协程挂起自己，然后在后续恢复运行。
co2 = coroutine.create(function()
    for i =1, 3 do
        print("co",i)
        coroutine.yield()
    end
end)

coroutine.resume(co2)
coroutine.resume(co2)
coroutine.resume(co2)
print(coroutine.status(co2))
coroutine.resume(co2)
print(coroutine.status(co2)) -- dead

-- 当协程A唤醒协程B时，协程A既不是挂起状态（因为不能唤醒协程A），也不是运行状态（因为正在运行的协程是B）。
-- 所以，协程A此时的状态就被称为正常状态。

-- 通过一对resume–yield来交换数据
-- resume函数（没有对应等待它的yield）会把所有的额外参数传递给协程的主函数
co3 = coroutine.create(function(a,b,c)
    print(a..b..c)
end)

coroutine.resume(co3,1,2,3)
-- 在函数coroutine.resume的返回值中，第一个返回值为true时表示没有错误，之后的返回值对应函数yield的参数
co4 = coroutine.create(function (a,b)
    coroutine.yield(a+b,a-b)
end)
print(coroutine.resume(co4,20,10))

-- 与之对应的是，函数coroutine.yield的返回值是对应的resume的参数
co5 = coroutine.create(function(x)
    print("co1", x)
    print("co2",coroutine.yield())
end)
coroutine.resume(co5,1)
coroutine.resume(co5,2,3)

-- 当一个协程运行结束时，主函数所返回的值都将变成对应函数resume的返回值
co6 = coroutine.create(function()
    return 6,7
end)
print(coroutine.resume(co6))

-- 生产者消费者问题
producer = coroutine.create(producer)

function receive()
    local status, value = coroutine.resume(producer)
    return value
end

function send(x)
    coroutine.yield(x)
end