local obj = GameObject("测试添加脚本")
local rig = obj:GetComponent(typeof(Rigidbody))

-- nil 和 null 不等价

-- 方法1：在lua实现
-- if IsNull(rig) then
--     rig = obj:AddComponent(typeof(Rigidbody))
-- end

--方法2：在c#实现
if rig:IsNull() then
    rig = obj:AddComponent(typeof(Rigidbody))
end