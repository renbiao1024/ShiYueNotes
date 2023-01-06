require("Object")
require("SplitTools")
Json = require("JsonUtility")

-- 常用别名
GameObject = CS.UnityEngine.GameObject
Resources = CS.UnityEngine.Resources
Transform = CS.UnityEngine.Transform
RectTransform = CS.UnityEngine.RectTransform
SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas
Vector3 = CS.UnityEngine.Vector3
Vector2 = CS.UnityEngine.Vector2
TextAsset = CS.UnityEngine.TextAsset

UI = CS.UnityEngine.UI
Image = UI.Image
Button = UI.Button
Text = UI.Text
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect
UIBehavior = CS.UnityEngine.EventSystems.UIBehaviour
-- Canvas
Canvas = GameObject.Find("Canvas").transform


--得到AB包资源管理器的单例对象
ABMgr = CS.ABMgr.GetInstance()
