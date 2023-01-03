/****************************************************
    文件：NewBehaviourScript.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;

public class My_CallVariables : MonoBehaviour 
{
    private void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        //获取lua全局变量
        int i = LuaMgr.GetInstance().Globle.Get<int>("testNumber");
        Debug.Log("testNumber " + i);
        //set全局变量
        LuaMgr.GetInstance().Globle.Set("testNumber", 2);
        
    }
}