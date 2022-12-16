/****************************************************
    文件：LookAtPoint.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;

[ExecuteInEditMode]
public class LookAtPoint : MonoBehaviour 
{
    public Vector3 Point= Vector3.zero;

    private void Update()
    {
        transform.LookAt(Point);
    }
}