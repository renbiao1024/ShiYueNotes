/****************************************************
    文件：RefVal.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：区分引用和值
*****************************************************/

using UnityEngine;

public class RefVal : MonoBehaviour 
{
    private void Start()
    {
        int num = 0;
        valFunc(num);
        Debug.Log(num);
        refFunc(ref num);
        Debug.Log(num);
    }

    private void refFunc(ref int num)
    {
        num++;
    }

    private void valFunc(int num)
    {
        num++;
    }
}