Object:subClass("BasePanel")

BasePanel.panelObject = nil
BasePanel.controls = {}
BasePanel.isInitEvent = false

function BasePanel:Init(name)
    if self.panelObject == nil then
        self.panelObject = ABMgr:LoadRes("ui", name, typeof(GameObject))          -- 从AB包加载格子
        self.panelObject.transform:SetParent(Canvas, false)   -- 设置父类
        -- 所有UI控件都继承自UIBehavior，可通过指定的命名规则避免存入无需的控件
        local allControls = self.panelObject:GetComponentsInChildren(typeof(UIBehavior))
        for i = 0, allControls.Length - 1 do
            local controlName = allControls[i].name
            if string.find(controlName, "btn") ~= nil or
                string.find(controlName, "toggle") ~= nil or
                string.find(controlName, "img") ~= nil or
                string.find(controlName, "sv") ~= nil then
                local typeName = allControls[i]:GetType().Name
                -- 创建一个类似下图的表
                -- {
                --  btnRole = {Image = XXX, Button = XXX}
                --  toggleItem = {Toggle = XXX}
                -- }
                if self.controls[controlName] ~= nil then
                    self.controls[controlName][typeName] = allControls[i]
                else
                    self.controls[allControls[i].name] = {[typeName] = allControls[i]}
                end
            end
        end
    end
end

function BasePanel:GetControl(name, typeName)
    if self.controls[name] ~= nil then
        local sameNameControls = self.controls[name]
        if sameNameControls[typeName] ~= nil then
            return sameNameControls[typeName]
        end
    end
    return nil
end

function BasePanel:ShowMe(name)
    self:Init(name)
    self.panelObject:SetActive(true)
end

function BasePanel:HideMe()
    self.panelObject:SetActive(false)
end