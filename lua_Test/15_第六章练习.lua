t = {1,2,3,4,5}

function printElem(t)
    for i = 1, #t do
        print(t[i])
    end
end

function ArgFunc(...)
    print(select(2, ...))
end

function PrintExceptLast(...)
    local t = table.pack(...)
    for i = 1, t.n-1 do
        print(t[i])
    end
end

function RandomTab(t)
    math.randomseed(os.time())
    for i = #t, 2, -1 do
        local randNum = math.random(i)
        local sp = t[i]
        t[i] = t[randNum]
        t[randNum] = sp
    end
    for i = 1, #t do
        print(t[i])
    end
end

--printElem(t)

--ArgFunc(1,2,3,4,5)

--PrintExceptLast(1,2,3,4,5)

RandomTab(t)