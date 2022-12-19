local function printMatrix(matrix)
    for i = 1,#matrix do
        print(table.concat(matrix[i]," "),"\n")
    end
end

-- 两个稀疏矩阵相加
-- 如果不用pairs遍历，开销会很大，应为稀疏矩阵中的空隙很多
local function addition(a,b)
    assert(type(a) == "table")
    assert(type(b) == "table")
    assert(#a == #b,"a and b are not the same dimension!")
    local c = {}
    for i = 1,#a do
        c[i] = {}
        for j,va in pairs(a[i]) do
            c[i][j] = va  + (b[i][j] or 0)
        end
        for k,vb in pairs(b[i]) do
            c[i][k] = vb  + (a[i][k] or 0)
        end
    end
    return c
end

-- 改写示例14.2中队列的实现，使得当队列为空时两个索引都返回0
queue = {first = 0, last = 0}
-- 头插
local first = queue.first - 1
queue.first = first
queue[first] = 2
-- 尾插
local last = queue.last + 1
queue.last = last
queue[last] = 2
-- 头删
local first = queue.first
if first == queue.last then error("queue is empty") end
local value = queue[first]
queue[first] = nil
queue.first = first + 1
if queue.last == queue.first then 
    queue.last = 0
    queue.first = 0
end
-- 尾删
local last = queue.last
if queue.first == last then error("queue is empty") end
local value = queue[last]
queue[last] = nil
queue.last = last - 1
if queue.last == queue.first then 
    queue.last = 0
    queue.first = 0
end