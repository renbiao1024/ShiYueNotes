--[[
function MyCounter()
    local count = 0
    return function() 
        -- 函数作为第一类值，能够逃逸（escape）出它们变量的原始定界范围。
        count = count + 1
        return count
    end
end

--c1和c2是不同的闭包。它们建立在相同的函数之上，但是各自拥有局部变量count的独立实例。
c1 = MyCounter()
print(c1())
print(c1())

c2 = MyCounter()
print(c2())
print(c1())
print(c2())
--]]


do
    --将原来不安全的版本保存为闭包的一个私有变量，该变量无法从外部访问。
    local oldOpen = io.open
    
    local access_OK = function(fileName, mode)
        --check access
        if(mode == "r") then return true
        else return false
        end
    end

    io.open = function(filename, mode)
        if access_OK(filenamem, mode) then
            return oldOpen(filename, mode)
        else
            return nil, "access denied"
        end
    end
end

print(io.open("16_data.txt", "r"))