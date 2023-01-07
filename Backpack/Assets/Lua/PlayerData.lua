PlayerData = {}

PlayerData.equips = {}
PlayerData.items = {}
PlayerData.gems = {}

function PlayerData:Init()
    -- 存道具ID和数量
    table.insert(self.equips, {id = 1, num = 4})
    table.insert(self.equips, {id = 2, num = 3})
    table.insert(self.items, {id = 3, num = 22})
    table.insert(self.items, {id = 4, num = 13})
    table.insert(self.gems, {id = 5, num = 2})
    table.insert(self.gems, {id = 6, num = 12})
end

-- print(PlayerData.equips[1].id)