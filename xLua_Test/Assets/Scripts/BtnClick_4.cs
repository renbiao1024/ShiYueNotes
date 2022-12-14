/****************************************************
    文件：BtnClick_4.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class BtnClick_4 : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler, IDragHandler
{
    public void OnDrag(PointerEventData eventData)
    {
        Debug.Log("拖动");
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        Debug.Log("点击");

    }

    public void OnPointerDown(PointerEventData eventData)
    {
        Debug.Log("鼠标按下");

    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        Debug.Log("移入");

    }

    public void OnPointerExit(PointerEventData eventData)
    {
        Debug.Log("移出");

    }
}