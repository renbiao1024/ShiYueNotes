/****************************************************
    文件：My_CallLuaTable.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;
using XLua;
public class My_CallLuaTable : MonoBehaviour 
{
    private void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");
        //不建议luatable/luafunction，效率低
        //引用对象
        LuaTable table = LuaMgr.GetInstance().Globle.Get<LuaTable>("testClass");
        Debug.Log(table.Get<int>("testInt"));
        table.Get<LuaFunction>("testFunc").Call();
        table.Set("testInt", 55);
        Debug.Log(table.Get<int>("testInt"));

        //用完一定要清理
        table.Dispose();
    }
}