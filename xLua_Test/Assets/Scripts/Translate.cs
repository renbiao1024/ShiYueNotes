/****************************************************
    文件：Translate.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：测试transform的函数
*****************************************************/

using UnityEngine;

public class Translate : MonoBehaviour 
{
    public float speed = 10f;

    private void Update()
    {
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
        transform.Rotate(Vector3.up * speed * Time.deltaTime);
    }
}