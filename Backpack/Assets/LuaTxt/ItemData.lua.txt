local txt = ABMgr:LoadRes("json","ItemData", typeof(TextAsset))
local itemList = Json.decode(txt.text)
-- print(txt.text)

-- 使用新表转存itemList
ItemData = {} -- 根据json的id存储信息

for _, value in pairs(itemList) do
    ItemData[value.id] = value
end

-- print(ItemData[1].tips)

