/****************************************************
    文件：ScreenToWorldPoint.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：世界坐标和屏幕坐标转换
*****************************************************/

using UnityEngine;

public class ScreenToWorldPoint : MonoBehaviour 
{
    Vector3 screenPos;

    private void Start()
    {
        screenPos = Camera.main.WorldToScreenPoint(transform.position);
    }

    private void Update()
    {
        if(Input.GetMouseButtonDown(0))
        {
            Vector3 mousePos = Input.mousePosition;
            mousePos.z = screenPos.z;
            Vector3 worldPos = Camera.main.ScreenToWorldPoint(mousePos);
            transform.position = worldPos;
        }
    }
}