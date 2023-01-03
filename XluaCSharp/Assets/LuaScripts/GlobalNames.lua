--全局存储节约性能
GameObject = CS.UnityEngine.GameObject
Rigidbody = CS.UnityEngine.Rigidbody
Vector3 = CS.UnityEngine.Vector3
UI= CS.UnityEngine.UI
PrimitiveType = CS.UnityEngine.PrimitiveType

WaitForSeconds = CS.UnityEngine.WaitForSeconds
-- 全局判空
function IsNull(obj)
    if obj == nil or obj:Equals(nil) then
        return true
    end
    return false
end