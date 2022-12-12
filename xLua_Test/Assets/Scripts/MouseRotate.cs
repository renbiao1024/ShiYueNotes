/****************************************************
    文件：MouseRotate.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：鼠标控制cube旋转
*****************************************************/

using UnityEngine;

public class MouseRotate : MonoBehaviour 
{
    private void Update()
    {
        if(Input.GetMouseButton(0))
        {
            float xRot = Input.GetAxis("Mouse X");
            float yRot = Input.GetAxis("Mouse Y");
            if (xRot != 0 || yRot != 0)
            {
                transform.Rotate(yRot, -xRot, 0);
            }
        }
    }
}