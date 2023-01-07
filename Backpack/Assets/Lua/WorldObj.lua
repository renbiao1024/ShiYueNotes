Object:subClass("worldObj")

worldObj.luaMgr = nil
worldObj.ray = nil
worldObj.hit = nil
function worldObj.onFixedUpdate()
    -- print("lua update")

    if Input.GetMouseButtonDown(0) then
        worldObj.ray = Camera.main:ScreenPointToRay(Input.mousePosition)
        Debug.DrawLine(worldObj.ray.origin, worldObj.ray:GetPoint(1000),CS.UnityEngine.Color.green, 2)
        local ok = Physics.Raycast(worldObj.ray, 1000, 1 << 8,QueryTriggerInteraction.Ignore)
        if ok then
            worldObj.hit = Physics.RaycastAll(worldObj.ray)[0];
            --print("ok")
            worldObj:Pickup()
        end
    end
end

function worldObj:Init()
    self.luaMgr = GameObject.Find("Main Camera"):AddComponent(typeof(LuaMonoMgr))
    self.luaMgr:AddOrRemoveListener(self.onFixedUpdate,E_LifeFun_Type.FixedUpdate)
end

function worldObj:Pickup()
    local type = -1
    if self.hit == nil then print("nill hit")
    elseif self.hit.collider.gameObject:CompareTag("Glove") then
        type = 1
        GameObject.Destroy(self.hit.collider.gameObject)
        --table.insert(PlayerData.equips,{id = 1, num = 1})
        for i = 1, #PlayerData.equips do
            if PlayerData.equips[i].id == 1 then
                PlayerData.equips[i].num = PlayerData.equips[i].num + 1
                break
            end
        end
    elseif self.hit.collider.gameObject:CompareTag("Bow") then
        type = 1
        GameObject.Destroy(self.hit.collider.gameObject)
        for i = 1, #PlayerData.equips do
            if PlayerData.equips[i].id == 2 then
                PlayerData.equips[i].num = PlayerData.equips[i].num + 1
                break
            end
        end
    elseif self.hit.collider.gameObject:CompareTag("BlueWater") then
        type = 2
        GameObject.Destroy(self.hit.collider.gameObject)
        for i = 1, #PlayerData.items do
            if PlayerData.items[i].id == 3 then
                PlayerData.items[i].num = PlayerData.items[i].num + 1
                break
            end
        end
    elseif self.hit.collider.gameObject:CompareTag("RedWater") then
        type = 2
        GameObject.Destroy(self.hit.collider.gameObject)
        for i = 1, #PlayerData.items do
            if PlayerData.items[i].id == 4 then
                PlayerData.items[i].num = PlayerData.items[i].num + 1
                break
            end
        end
    elseif self.hit.collider.gameObject:CompareTag("RedGem") then
        type = 3
        GameObject.Destroy(self.hit.collider.gameObject)
        for i = 1, #PlayerData.gems do
            if PlayerData.gems[i].id == 5 then
                PlayerData.gems[i].num = PlayerData.gems[i].num + 1
                break
            end
        end
    elseif self.hit.collider.gameObject:CompareTag("BlueGem") then
        type = 3
        GameObject.Destroy(self.hit.collider.gameObject)
        for i = 1, #PlayerData.gems do
            if PlayerData.gems[i].id == 6 then
                PlayerData.gems[i].num = PlayerData.gems[i].num + 1
                break
            end
        end
    end

    BagPanel:PickupUpdate(type)
end

