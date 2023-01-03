/****************************************************
    文件：LuaMgrTest.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;

public class LuaMgrTest : MonoBehaviour 
{
    private void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");
    }
}