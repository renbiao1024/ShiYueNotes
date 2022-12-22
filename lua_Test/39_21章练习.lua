-- 实现一个类Stack，该类具有方法push、pop、top和isempty
local stack = {}
stack.__index = stack

function stack:new(o)
    o = o or {}
    setmetatable(o,self)
    o.list = {}
    return o
end

function stack:isempty()
    return #self.list == 0
end

function stack:push(v)
    assert(v,"push data is nil")
    self.list[#self.list + 1] = v
end

function stack:top()
    if self:isempty() then error("cannot get top,stack is empty") end
    return self.list[#self.list]
end

function stack:pop()
    if self:isempty() then error("pop error,stack is empty") end
    local v =  self.list[#self.list]
    table.remove(self.list)
    return v
end

-- 实现类Stack的子类StackQueue。除了继承的方法外，还给这个子类增加一个方法insertbottom，该方法在栈的底部插入一个元素
local StackQueue = stack:new()
StackQueue.__index = StackQueue
function StackQueue:insertbottom(v)
    assert(v,"insert value is nil")
    table.insert(self.list,1,v)
end

-- 使用对偶表示重新实现类Stack
local DualStack = {}
local stackContainer = {}
DualStack.__index = DualStack

function DualStack:new(o)
    o = o or {}
    setmetatable(o,self)
    stackContainer[o] = {}
    return o
end

function DualStack:isempty()
    return #stackContainer[self] == 0
end

function DualStack:push(v)
    assert(v,"push data is nil")
    table.insert(stackContainer[self],v)
end

function DualStack:top()
    if self:isempty() then error("cannot get top,stack is empty") end
    return stackContainer[self][#stackContainer[self]]
end

function DualStack:pop()
    if self:isempty() then error("pop error,stack is empty") end
    local v =  stackContainer[self][#stackContainer[self]]
    table.remove(stackContainer[self])
    return v
end

