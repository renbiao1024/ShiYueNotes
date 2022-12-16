-- S = "this is a test text"
-- T = "is"
-- U = "this"
-- V = "that"
-- print(string.find(S, "is", 1, true))

-- print(string.match(S,T))

-- print(string.gsub(S,U,V, 1))

-- for w in string.gmatch(S,T) do
--     print(w)
-- end

-- 替换
name = "Lua"
status = "Great"

function expand(s)
    return (string.gsub(s, "$(%w+)", _G))
end

print(expand("$name is $status"))