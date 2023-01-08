/****************************************************
    文件：DragObj.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    功能：添加拖拽物体的逻辑
*****************************************************/

using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using XLua;


[CSharpCallLua]
public class DragObj : MonoBehaviour,IBeginDragHandler,IEndDragHandler,IDragHandler,ICanvasRaycastFilter
{
    public delegate void LuaFuncWithPointerEventDataDelegate (BaseEventData eventData);

    private LuaFuncWithPointerEventDataDelegate onBeginDrag;
    private LuaFuncWithPointerEventDataDelegate onDrag;
    private LuaFuncWithPointerEventDataDelegate onEndDrag;

    public void OnBeginDrag(PointerEventData eventData)
    {
        if(onBeginDrag != null)
            onBeginDrag(eventData);
    }

    public void OnDrag(PointerEventData eventData)
    {
        if(onDrag != null)
            onDrag(eventData);
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if(onEndDrag != null)
            onEndDrag(eventData);
    }

    public bool IsRaycastLocationValid(Vector2 sp, Camera eventCamera)
    {
        return true;
    }

    public void AddOrRemoveListener(LuaFuncWithPointerEventDataDelegate fun,E_DragFun_Type type, bool isAdd = true)
    {
        switch(type)
        {
            case E_DragFun_Type.OnBeginDrag:
                if(isAdd)
                    onBeginDrag += fun;
                else 
                    onBeginDrag -= fun;
                break;
            case E_DragFun_Type.OnDrag:
                if(isAdd)
                    onDrag += fun;
                else
                    onDrag -= fun;
                break;
            case E_DragFun_Type.OnEndDrag:
                if(isAdd)
                    onEndDrag += fun;
                else 
                    onEndDrag -= fun;
                break;
        }
    } 
}

public enum E_DragFun_Type
{
    OnDrag,
    OnBeginDrag,
    OnEndDrag
}