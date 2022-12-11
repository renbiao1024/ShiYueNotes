function add(...)

    local s = 0
    for _, v in ipairs(...) do
        s = s+v
    end

    for i = 1, select("#", ...) do
        s = s+select(i, ...)
    end

    local arg = table.pack(...) -- 将变长参数 都存到一个表中，多一个参数n表示长度
    for i = 1, arg.n do
        if arg[i] == nil then return false end
    end

    return s, true
end

