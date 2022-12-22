--[[
Account = {balance = 0}

function Account.withdraw(self,v)
    self.balance = self.balance-v
    print(self.balance)
end

-- local a1 = Account
-- a1.withdraw(a1,100.00)
-- -- 新的实例
-- local a2 = {balance = 0, withdraw = Account.withdraw}
-- a2.withdraw(a2, 200.00)

function Account:deposit(v)
    self.balance = self.balance + v
    print(self.balance)
end

-- Account.deposit(Account, 10)
-- Account:deposit(20)

-- 如果有两个对象A和B，要让B成为A的一个原型，只需要：
    -- 方法1：
-- local mt = {__index = Account}
-- function Account.new(o)
--     o = o or {}
--     setmetatable(o,mt)
--     return o
-- end

    -- 方法2:Account 直接作为自己的index和o的元表
function Account:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

-- 当我们调用Account:new（）时，隐藏的参数self得到的实参是Account，
-- Account.__index等于Account，并且Account被用作新对象的元表。

SpecialAccount = Account:new()

s = SpecialAccount:new{limit = 1000.00}
-- SpecialAccount就像继承其他方法一样从Account继承了new。
-- 不过，现在执行new时，它的self参数指向的是SpecialAccount。
-- 因此，s的元表会是SpecialAccount，其中字段__index的值也是SpecialAccount。
-- 因此，s继承自SpecialAccount，而SpecialAccount又继承自Account。
-- 之后，当执行s:deposit（100.00）时，Lua语言在s中找不到deposit字段，就会查找SpecialAccount，
-- 仍找不到deposit字段，就查找Account并最终会在Account中找到deposit的最初实现。

function SpecialAccount:withdraw(v)
    if v - self.balance >= self:getLimit() then
        print("insufficient funds")
    end
    self.balance = self.balance - v
end

function SpecialAccount:getLimit()
    return self.limit or 0
end
-- 现在，当调用s:withdraw（200.00）时，
-- 因为Lua语言会在SpecialAccount中先找到新的withdraw方法，所以不会再从Account中查找。

function s:getLimit()
    return self.balance * 0.10
end

s:withdraw(1.0)
-- 调用s:withdraw（200.00）还是会执行SpecialAccount的withdraw方法，
-- 但当withdraw调用self:getLimit时，调用的是s中最新的定义

--]]

-- 多重继承的实现
local function search(k, plist)
    for i = 1, #plist do
        local v = plist[i][k]
        if v then return v end
    end
end

function createClass(...) -- 传入父类列表
    local c = {}
    local parents = {...}
    setmetatable(c, {__index = function(t,k)
        return search(k,parents) end
    })

    c.__index = c

    function c:new(o)
        o = o or {}
        setmetatable(o,c)
        return o
    end

    return c
end