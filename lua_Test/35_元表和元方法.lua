Set = {}

    local mt = {}

    function Set.new(l)
        local set = {}
        setmetatable(set, mt) -- 在此之后，所有由Set.new创建的集合都具有了一个相同的元表
        for _, v in ipairs(l) do set[v] = true end
        return set
    end

    function Set.intersection(a,b)
        local res = Set.new{}
        for i = 1, #a do
            res[i] = a[i] * b[i]
        end
        return res
    end

    mt.__mul = Set.intersection

    function Set.tostring(set)
        local l = {}
        for e in pairs(set) do
            l[#l + 1] = tostring(e)
        end
        return "{"..table.concat(l, ", ").."}"
    end

    mt.__tostring = Set.tostring

    mt.__le = function (a,b)
        for k,v in pairs(a) do
            if not b[k] then return false end -- b[k] 不为空
        end
        return true
    end

    mt.__lt = function (a,b)
        return a <= b and not(b <= a)
    end

    mt.__eq = function (a,b)
        return a <= b and b <= a
    end

    s1 = Set.new{2,4}
    s2 = Set.new{4,10,2}
    print(s1 <= s2)
    print(s1 < s2)
    print(s1 == s2)
    print(s1 > s2)
    print(s1 >= s2)
return Set

