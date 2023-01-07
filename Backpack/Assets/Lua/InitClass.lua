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

Physics = CS.UnityEngine.Physics
Debug = CS.UnityEngine.Debug
-- Canvas
Canvas = GameObject.Find("Canvas").transform
QueryTriggerInteraction = CS.UnityEngine.QueryTriggerInteraction
Input = CS.UnityEngine.Input
Camera = CS.UnityEngine.Camera
ABMgr = CS.ABMgr.GetInstance()
LuaMonoMgr = CS.LuaMonoMgr
E_LifeFun_Type = CS.E_LifeFun_Type