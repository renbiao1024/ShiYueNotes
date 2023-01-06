--MainPanel = {}
BasePanel:subClass("MainPanel")
--[[
-- 面板对象
-- MainPanel.panelObj = nil
-- -- 控件
-- MainPanel.btnRole = nil
-- MainPanel.btnSkill = nil
--]]
function MainPanel:Init(name)
    self.base.Init(self,name)
    if self.isInitEvent == false then
        self:GetControl("btnRole", "Button").onClick:AddListener(function()
            self:BtnRoleClick()
        end)
        self.isInitEvent = true
    end
--[[
    -- if self.panelObj == nil then
    --     -- 实例化面板对象
    --     self.panelObj = ABMgr:LoadRes("ui", "MainPanel", typeof(GameObject))
    --     self.panelObj.transform:SetParent(Canvas, false)
    --     -- 找到对应控件,再找到挂载的脚本
    --     self.btnRole = self.panelObj.transform:Find("btnRole"):GetComponent(typeof(Button))
    --     -- 为控件添加监听事件,如果直接.调用不能获取到self
    --     --self.btnRole.onClick:AddListener(self.BtnRoleClick)
    --     self.btnRole.onClick:AddListener(function()
    --         self:BtnRoleClick()
    --     end)
    -- end
--]]
end

--[[
-- function MainPanel:ShowMe()
--     self:Init()
--     self.panelObj:SetActive(true)
-- end

-- function MainPanel:HideMe()
--     self.panelObj:SetActive(false)
-- end
--]]
function MainPanel:BtnRoleClick()
    --print(123)
    BagPanel:ShowMe("BagPanel")
end