--[[
-- 数组
    -- 使用整数来索引表即可实现数组
    local a = {}
    for i = -5, 100 do
        a[i] = i
    end
    -- 数组的大小不用非得是固定的，而是可以按需增长的
    -- #arrName为 以1作为数组的起始索引 的数组长度
    print(#a)
    -- 可以使用0、1或其他任何值来作为数组的起始索引
    print(a[-5])
    -- 可以通过表构造器在一句表达式中同时创建和初始化数组，而且大小不受限制
    local b = {2,4,2,1,4}
    print(b[1])


local N = 8
local M = 8
-- 矩阵
    -- 方法1：一个所有元素均是另一个表的表
    local mt1 = {}
    for i = 1, N do
        local row = {}
        mt1[i] = row
        for j = 1, M do
            row[j] = 0
        end
    end
    -- 方法2：将两个索引合并为一个。将第一个索引乘以一个合适的常量再加上第二个索引来实现这种效果
    local mt2 = {}
    for i = 1, N do
        local aux = (i-1) * M
        for j = 1, M do
            mt2[aux + j] = 0
        end
    end
    --无论哪种实现，都只有非nil的元素才占用空间。不会有稀疏矩阵的空间浪费问题
    --由于在有效元素之间存在空洞（nil值），因此不能对稀疏矩阵使用长度运算符。
    --可以使用pairs来只遍历非nil的元素。

    --稀疏矩阵相乘
    function mult (a, b)
        local c = {}                                        -- 结果矩阵
        for i = 1, #a do
            local resLine = {}                              -- c[i]
            for k, va in pairs(a[i]) do                     -- va:a[i][k]
                for j, vb in pairs(b[k]) do                 -- vb:b[k][j]
                    local res = (resLine[j] or 0) + va * vb 
                    resLine[j] = (res ~= 0) and res or nil
                end
            end
            c[i] = resLine
        end
        return c
    end

--]]

-- 链表
    local list = nil
    -- 头插
    list = {next = list, value = 12}
    -- 遍历
    local l = list
    while l do
        print(l.value)
        l = l.next
    end

-- 双端队列
    -- 使用两个索引，一个指向第一个元素，另一个指向最后一个元素。
    queue = {first = 0, last = -1}
    -- 头插
    local first = queue.first - 1
    queue.first = first
    queue[first] = 2
    -- 尾插
    local last = queue.last - 1
    queue.last = last
    queue[last] = 2
    -- 头删
    local first = queue.first
    if first > queue.last then error("queue is empty") end
    local value = queue[first]
    queue[first] = nil
    queue.first = first + 1
    -- 尾删
    local last = queue.last
    if queue.first > last then error("queue is empty") end
    local value = queue[last]
    queue[last] = nil
    queue.last = last - 1

-- 反向表
    days = {Sun, Mon, Tue, Wed, Thu, Fri, Sat}
    revDays = {}
    for k,v in pairs(days) do
        revDays[v] = k
    end

-- 字符串缓冲区
    local t = {}
    for line in io.lines("16_data.txt") do
        t[#t + 1] = line .. "\n"
    end
    local s = table.concat(t, "\n") .. "\n"

-- 图
    -- 构建图:使用一个由两个字段组成的表来表示每个节点，即name（节点的名称）和adj（与此节点邻接的节点的集合）
    local function name2node(graph, name)
        local node = graph[name]
        if not node then
            node = {name = name, adj = {}}
            graph[name] = node
        end
        return node
    end

    -- 从文件中加载图：每行两个节点 表示 A->B
    function readGraph()
        local graph = {}
        for line in io.lines() do
            local nameFrom, nameTo = string.match(line, "(%S+)%s+(%S+)")
            local from = name2node(graph, nameFrom)
            local to = name2node(graph, nameTo)
            from.adj[to] = true
        end
        return graph
    end

    -- 寻找两个节点之间的路径：深度优先遍历
    local function findPath(cur, to, path, visited) -- 最后一个参数为所有已被访问节点的集合（用于避免回路）
        path = path or {}
        visited = visited or {}
        if visited[cur] then return nil end
        visited[cur] = true
        path[#path + 1] = cur
        if cur == to then return path end
        for node in pairs(cur.adj) do
            local p = findPath(node, to, path, visited)
            if p then return p end
        end
        table.remove(path)
    end
    