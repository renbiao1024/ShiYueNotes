-- 使用模块
local m = require "math"
print(m.sin(3.14))

local mod = require "mod"
local f = mod.math
f()
-- ==
local f = require "mod".math

local d = require "math"
local nums = d.sin(1)

-- require带着两个参数调用加载函数：模块名和加载函数所在文件的名称
-- 如果加载函数有返回值，那么函数require会返回这个值，
-- 然后将其保存在表package.loaded中，以便于将来在加载同一模块时返回相同的值。
-- 如果加载函数没有返回值且表中的package.loaded[@rep{modname}]为空，函数require就假设模块的返回值是true。
-- 如果没有这种补偿，那么后续调用函数require时将会重复加载模块。要强制函数require加载同一模块两次，可以先将模块从package.loaded中删除：
-- 下一次再加载这个模块时，函数require就会重新加载模块。

-- 创建模块
-- 方法1
local M = {}    -- 模块

local function new(r,i)
    return {r = r, i = i}
end
M.new = new     -- 把new添加到模块中，称为私有函数

function M.add(c1, c2)
    return new(c1.r+c2.r, c1.i + c2.i)
end

return M

-- 方法2
local M = {}

local function new(r,i)
    return {r = r, i = i}
end

local i = new(0,1)

function add(c1, c2)
    return new(c1.r+c2.r, c1.i + c2.i)
end

return {
    new = new,
    i = i,
    add = add
}