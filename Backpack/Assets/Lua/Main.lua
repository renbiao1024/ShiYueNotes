require("InitClass")
require("ItemData")
require("PlayerData")

require("BasePanel")
require("MainPanel")
require("BagPanel")
require("ItemGrid")
require("WorldObj")

-- print("Lua")
worldObj:Init()
PlayerData:Init()
MainPanel:ShowMe("MainPanel")