-- 数值序列化
function serialize_1(o)
    if type(o) == "number" then
        io.write(tostring(o))
    end
end
    -- 考虑浮点型和整型的区别
function serialize_2(o)
    if type(o) == "number" then
        io.write(string.format(math.type(o) == "integer" and "%d" or "%a",o))
    end
end

-- 字符串序列化
function serialize_3(o)
    if type(o) == "number" then
        serialize_2(o)
    elseif type(o) == "string" then
        io.write(string.format("%q",o))
    end
end

-- Lua 5.3.3对格式选项"%q"进行了扩展，使其也可以用于数值、nil和Boolean类型，进而使它们能够正确地被序列化和反序列化。
function serialize_4(o)
    local t = type(o)
    if t == "number" or t == "string" or t == "boolean" or t == "nil" then
        io.write(string.format("%q",o))
    end
end

-- 保存不带循环的表
function serialize_5(o)
    serialize_4(o)

    if t == "table" then
        io.write("{\n")
        for k,v in pairs(o) do
            io.write("  ", k, " = ")
            serialize_5(v)
            io.write(",\n")
        end
        io.write("}\n")
    end
end

-- 保存带有循环的表
