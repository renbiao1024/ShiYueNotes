
Object:subClass("ItemGrid")
    -- 成员变量
ItemGrid.obj = nil
ItemGrid.imgIcon = nil
ItemGrid.txtNum = nil

    -- 成员函数
function ItemGrid:Init(father, posX, posY)
    -- 实例化格子对象
    self.obj = ABMgr:LoadRes("ui", "ItemGrid")          -- 从AB包加载格子
    self.obj.transform:SetParent(father, false)   -- 设置父类
    self.obj.transform.localPosition = Vector3(posX, posY, 0)  -- 设置格子位置
    self.imgIcon = self.obj.transform:Find("ItemImg"):GetComponent(typeof(Image))               -- 获取到图片组件和文本组件
    self.txtNum = self.obj.transform:Find("numTxt"):GetComponent(typeof(Text))
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