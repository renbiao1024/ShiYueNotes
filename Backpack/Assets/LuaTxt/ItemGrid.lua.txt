
Object:subClass("ItemGrid")
    -- 成员变量
ItemGrid.obj = nil
ItemGrid.imgIcon = nil
ItemGrid.txtNum = nil
ItemGrid.dragObj = nil --拖拽事件

ItemGrid.startPos = nil

    -- 成员函数
function ItemGrid:Init(father, posX, posY)
    -- 实例化格子对象
    self.obj = ABMgr:LoadRes("ui", "ItemGrid")          -- 从AB包加载格子
    self.obj.transform:SetParent(father, false)   -- 设置父类
    self.obj.transform.localPosition = Vector3(posX, posY, 0)  -- 设置格子位置
    self.imgIcon = self.obj.transform:Find("ItemImg"):GetComponent(typeof(Image))               -- 获取到图片组件和文本组件
    self.txtNum = self.obj.transform:Find("numTxt"):GetComponent(typeof(Text))

    self.dragObj = self.obj:AddComponent(typeof(DragObj))
    self.dragObj:AddOrRemoveListener(function (eventData)
        self:onBeginDrag(eventData)
        end, E_DragFun_Type.OnBeginDrag)
    self.dragObj:AddOrRemoveListener(function (eventData)
        self:onDrag(eventData)
        end, E_DragFun_Type.OnDrag)
    self.dragObj:AddOrRemoveListener(function (eventData)
        self:onEndDrag(eventData)
        end, E_DragFun_Type.OnEndDrag)

end

function ItemGrid:InitData(data)
    local itemData = ItemData[data.id]                   -- 获取item信息
    local strs = string.split(itemData.icon, "_")    -- 获取到icon信息 strs[1] = Icon, strs[2] = 数字
    local spriteAtlas = ABMgr:LoadRes("ui", strs[1], typeof(SpriteAtlas))    --从AB包的spriteAtlas加载sprite
    self.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])
    self.txtNum.text = data.num
end

function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end

function ItemGrid:onBeginDrag(eventData)
    self.StartPos = self.obj.transform.position
end

function ItemGrid:onDrag(eventData)
    local isInRec, globalMousePos = RectTransformUtility.ScreenPointToWorldPointInRectangle(self.obj.transform, eventData.position, eventData.pressEventCamera)
    self.obj.transform.position = globalMousePos
    print("onDrag")
end

function ItemGrid:onEndDrag(eventData)
    print("onEndDrag")
    self.obj.transform.position = self.StartPos
end