local inp = assert(io.open("16_data.txt", "rb"))
-- local out = assert(io.open("16_data.txt", "wb"))

local data = inp:read("a")
-- data = string.gsub(data, "\r\n", "\n")
-- out:write(data)
-- assert(out:close())

local chars = "[%g%s]"
local pattern = "("..string.rep(chars, 6).. "+)\0"
for w in string.gmatch(data, pattern) do
    print(w)
end
