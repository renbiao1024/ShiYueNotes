/****************************************************
    文件：MotionControl.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：通过四元数控制cube2运动
*****************************************************/

using UnityEngine;

public class MotionControl : MonoBehaviour 
{
    public float speed = 3.0f;

    private void Update()
    {
        transform.Translate(Input.GetAxis("Horizontal") * speed * Time.deltaTime, Input.GetAxis("Vertical") * speed * Time.deltaTime, 0);
    }
}