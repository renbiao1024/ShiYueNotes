-- 1 2
-- 3 4
--goto语句不能跳出一个函数

goto room1

::room1::
do
    local move = io.read()
    if move == "S" then goto room3
    elseif move == "E" then goto room2
    else print("invalid move")
    goto room1
    end
end

::room2::
do
    local move = io.read()
    if move == "S" then goto room4
    elseif move == "W" then goto room1
    else print("invalid move")
    goto room2
    end
end

::room3::
do
    local move = io.read()
    if move == "N" then goto room1
    elseif move == "E" then goto room4
    else print("invalid move")
    goto room3
    end
end

::room4::
do
    print("Congratulations, you won")
end