N = 8
IsFinish = false

--检查 n,c 是否合理
function IsOK(a, n, c)
    for i = 1, n - 1 do
        if (a[i] == c) or (a[i] - i == c - n) or (a[i] + i == c + n ) then -- 确保当前行的皇后不和之前行的皇后在同列，对角线
            return false
        end
    end
    return true
end

function PrintSolution(a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i] == j and "X" or "-", " ") -- a[i] == j ? X : -
        end
        io.write("\n")
    end
    io.write('\n')
end

function AddQueen(a,n)
    if n > N then
        IsFinish = true
        PrintSolution(a)
    else
        for c = 1, N do
            if IsOK(a, n, c) and (not IsFinish) then
                a[n] = c
                AddQueen(a, n+1)
            end
        end
    end
end

AddQueen({}, 1)