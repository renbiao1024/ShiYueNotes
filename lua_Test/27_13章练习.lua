-- 无符号整型数的取模运算
local function umod(a, b)
    if a < 0 then
       if b > 0 then
          return ((a>>1)%b*2+(a&1)-b)%b
       else
          if math.ult(a,b) then 
            return a 
          else 
            return b - a 
          end
       end
    else
       if b > 0 then return a % b 
       else return a end
    end
 end

-- 计算Lua语言中整型数所占用位数
local function countDigit(n)
    local cnt = 0
    n = n < 0 and -n or n
    while n ~= 0 do
        n = n >> 1
        cnt = cnt + 1
    end
    return cnt
end

-- 判断一个给定的整数是2的幂次方
local function check2pow1(n)
    if n == 1 then return true 
    elseif n % 2 == 0 then
        return check2pow(n/2)
    else return false
    end
end
-- 更好解法
local function check2pow2(n)
    assert(isinteger(n))
    return  n > 0 and n & (n - 1) == 0
end

-- 计算指定整数的汉明权重（一个数的汉明权重（Hamming weight）是其二进制表示中1的个数）
local function hanming(n)
    cnt = 0
    while n ~= 0 do
        if n & 1 == 1 then
            cnt = cnt + 1
        end
        n = n >> 1
    end
end
--更好解法，使用 n&(n-1)的转折
local function hammingweight(n)
    local iCount = 0
    while n ~= 0 do
        n = n & (n - 1)
        iCount = iCount + 1
    end
    return iCount
end

-- 判断指定整数的二进制表示是否为回文数。
local function isPali(n)
    local arr
    arr[32] = 0
    if n < 0 then
        arr[#arr] = 1
    end
    n = math.abs(n)
    local idx = 1
    while n ~= 0 do
        arr[idx] = math.fmod(n,2)
        idx = idx + 1
        n = n // 2
    end
    local mid = #arr // 2
    for i = 1, mid do
        if arr[i] ~= arr[#arr - i + 1] then 
            return false
        end
    end
    return true
end

--[[
    实现一个比特数组（bit array），
    该数组应支持如下的操作。
        •newBitArray（n）（创建一个具有n个比特的数组）。
        •setBit（a,n,v）（将布尔值v赋值给数组a的第n位）。
        •testBit（a,n）（将第n位的值作为布尔值返回）。
--]]

local function newBitArray(n)
    assert(type(n) == "integer")
    local arr = {}
    for i = 1, n do arr[i] = false end
    return arr
end

local function setBit(a, n, v)
    a[n] = v
end

local function testBit(a, n)
    return a and a[n]
end

