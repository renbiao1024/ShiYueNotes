require("InitClass")
print("准备工作完成")
require("ItemData")
require("PlayerData")

PlayerData:Init()

require("BasePanel")
require("MainPanel")
require("BagPanel")
require("ItemGrid")

MainPanel:ShowMe("MainPanel")