-- 圆形
function Circle(cx, cy, r)
    return function (x, y) --特征函数
        return (x-cx)^2 + (y-cy)^2 <= r^2 
    end
end

--[[
-- 矩形
function Rect(l, r, t, b)
    return function(x, y)
        return l <= x and r >= x and t >= y and b <= y
    end
end

-- 补集
function Outer(inShape)
    return function(x,y)
        return not inShape(x,y)
    end
end

-- 并集
function Union(r1, r2)
    return function(x,y)
        return r1(x,y) or r2(x,y)
    end
end

-- 交集
function Inter(r1, r2)
    return function(x,y)
        return r1(x,y) and r2(x,y)
    end
end
--]]

-- 差集
function Diff(r1, r2)
    return function(x,y)
        return r1(x,y) and not r2(x,y)
    end
end

--平移
function Trans(r, dx, dy)
    return function(x,y)
        return r(x - dx, y - dy)
    end
end

-- PBM位图
function Plot(r, M, N)
    io.write("P1\n", M, " ", N, "\n")
    for i = 1, N do
        local y = (N - i*2)/N
        for j =1, M do
            local x = (j*2 - M)/M
            io.write(r(x,y) and "." or " ")
        end
        io.write("\n")
    end
end

C1 = Circle(0,0,0.5)
Plot(Diff(C1, Trans(C1, 0.3, 0)), 100, 50)