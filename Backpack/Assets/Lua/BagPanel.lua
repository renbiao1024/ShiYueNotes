--BagPanel = {}
BasePanel:subClass("BagPanel")

--[[
-- 成员变量
-- BagPanel.panelObj = nil
-- BagPanel.btnClose = nil
-- BagPanel.togEquip = nil
-- BagPanel.togItem = nil
-- BagPanel.togGem = nil
-- BagPanel.svBag = nil
-- BagPanel.content = nil
-- BagPanel.items = {} -- 存储当前显示的格子
-- BagPanel.nowType = -1
--]]
BagPanel.content = nil
BagPanel.items = {} -- 存储当前显示的格子
BagPanel.nowType = -1

-- 成员方法
function BagPanel:Init(name)
    --[[
    -- if self.panelObj == nil then
    --     -- 实例化面板对象
    --     self.panelObj = ABMgr:LoadRes("ui", "BagPanel", typeof(GameObject))
    --     self.panelObj.transform:SetParent(Canvas, false)
    --     -- 找到对应控件,再找到挂载的脚本
    --     self.btnClose = self.panelObj.transform:Find("btnClose"):GetComponent(typeof(Button))
    --     local group = self.panelObj.transform:Find("ToggleGroup")
    --     self.togEquip = group:Find("toggleEquip"):GetComponent(typeof(Toggle))
    --     self.togItem = group:Find("toggleProp"):GetComponent(typeof(Toggle))
    --     self.togGem = group:Find("toggleJewel"):GetComponent(typeof(Toggle))
    --     self.svBag = self.panelObj.transform:Find("bk2"):Find("svBag"):GetComponent(typeof(ScrollRect))
    --     self.content = self.svBag.transform:Find("Viewport"):Find("Content")

    --     -- 添加事件
    --     self.btnClose.onClick:AddListener(function()
    --         self:HideMe()
    --     end)
    --     self.togEquip.onValueChanged:AddListener(function(value)
    --         if value == true then
    --             self:ChangeType(1)
    --         end
    --     end)
    --     self.togItem.onValueChanged:AddListener(function(value)
    --         if value == true then
    --             self:ChangeType(2)
    --         end
    --     end)
    --     self.togGem.onValueChanged:AddListener(function(value)
    --         if value == true then
    --             self:ChangeType(3)
    --         end
    --     end)
    -- end
    --]]
    self.base.Init(self,name)

    if self.isInitEvent == false then
        self.content = self:GetControl("svBag", "ScrollRect").transform:Find("Viewport"):Find("Content")

        self:GetControl("btnClose", "Button").onClick:AddListener(function()
            self:HideMe()
        end)
        self:GetControl("toggleEquip", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(1)
            end
        end)
        self:GetControl("toggleProp", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(2)
            end
        end)
        self:GetControl("toggleJewel", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(3)
            end
        end)
        self.isInitEvent = true
    end
end

function BagPanel:ShowMe(name)
    self.base.ShowMe(self,name)

    if self.nowType == -1 then
        self:ChangeType(1)
    end
end

--[[
-- function BagPanel:HideMe()
--     self.panelObj:SetActive(false)
-- end
--]]

function BagPanel:ChangeType(type) --1装备 2道具 3宝石
    --print(type)

    if type == self.nowType then return end
    self.nowType = type

    --删除旧格子
    for i = 1, #self.items do
        self.items[i]:Destroy()
    end
    self.items = {}

    --创建新格子
    local nowItems = nil
    if type == 1 then
        nowItems = PlayerData.equips
    elseif type == 2 then
        nowItems = PlayerData.items
    else
        nowItems = PlayerData.gems
    end

    for i = 1, #nowItems do
        --[[
        -- local grid = {}
        -- grid.obj = ABMgr:LoadRes("ui", "ItemGrid")          -- 从AB包加载格子
        -- grid.obj.transform:SetParent(self.content, false)   -- 设置父类
        -- grid.obj.transform.localPosition = Vector3((i-1)%4 * 170, -math.floor((i-1) / 4) * 170, 0)  -- 设置格子位置
        -- grid.imgIcon = grid.obj.transform:Find("ItemImg"):GetComponent(typeof(Image))               -- 获取到图片组件和文本组件
        -- grid.txtNum = grid.obj.transform:Find("numTxt"):GetComponent(typeof(Text))
        -- grid.txtNum.text = nowItems[i].num                      -- 设置数量
        -- local data = ItemData[nowItems[i].id]                   -- 获取item信息
        -- local strs = string.split(data.icon, "_")    -- 获取到icon信息 strs[1] = Icon, strs[2] = 数字
        -- local spriteAtlas = ABMgr:LoadRes("ui", strs[1], typeof(SpriteAtlas))    --从AB包的spriteAtlas加载sprite
        -- grid.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])
        --]]
        local grid = ItemGrid:new()
        grid:Init(self.content, (i-1)%4 * 170, -math.floor((i-1) / 4) * 170)
        grid:InitData(nowItems[i])
        table.insert(self.items, grid)                  -- 将获取到的图记录在表中
    end
end
