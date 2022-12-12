/****************************************************
    文件：CoroutineTest.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：测试协程
*****************************************************/

using System.Collections;
using UnityEngine;

public class CoroutineTest : MonoBehaviour 
{
    IEnumerator Start()
    {
        Debug.Log("Start:" + Time.time);
        yield return StartCoroutine(WaitAndDebug());
        Debug.Log("Done" + Time.time);
    }

    IEnumerator WaitAndDebug()
    {
        yield return new WaitForSeconds(5);
        Debug.Log("wait and debug:" + Time.time);
    }
}