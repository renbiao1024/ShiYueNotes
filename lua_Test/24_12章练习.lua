-- 指定时间一个月后的时间
local function exercise12_1(tab)
    tab.month = tab.month+1
    print(os.date("%m",os.time(tab)))
end

-- 返回星期
local function exercise12_2(tab)
    local t = math.tointeger(os.date("%w", os.time(tab)) + 1) -- 0-6 --> 1-7
    print(t)
end

-- 返回当天已经过的秒数
local function exercise12_3(tab)
    local t = os.date("*t")
    t.hour = 0
    t.min = 0
    t.sec = 0
    print(os.difftime(os.time(tab),os.time(t)))
end

-- 返回指定年的第一个星期五是这一年的第几天
local function exercise12_4(year)
    local curYear = {year = year, month = 1, day = 1}
    local tmp = os.date("%w", os.time(curYear))
    local res = 5 - tmp < 0 and 11 - tmp or 5 - tmp + 1
    print(res)
end

-- 计算指定日期相差的天数
local function exercise12_5(tab1, tab2)
    local t = os.difftime(os.time(tab1),os.time(tab2))//(24*3600)
    print(t)
end

-- 计算指定日期相差的月数
local function exercise12_6(tab1, tab2)
    print(tab1.year * 12 + tab1.month - tab2.year * 12 - tab2.month)
end

-- 给指定的时间先加月再加日和先加日再加月的结果一样吗？ 月份天数不同就会导致不一样，如8月31日，结果是10月1日和10月2日

--输出操作系统的时区
local function exercise12_8()
    print(os.date("%z"))
end


--测试
--local tab1 = os.date("*t")
--local tab2 = {year = 2021, month = 11, day = 3}
--exercise12_1(tab1)
--exercise12_2(tab1)
--exercise12_3(tab1)
--exercise12_4(tab1.year)
--exercise12_5(tab1, tab2)
--exercise12_6(tab1,tab2)
--exercise12_8()

