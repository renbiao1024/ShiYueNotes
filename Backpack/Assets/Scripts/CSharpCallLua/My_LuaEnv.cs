/****************************************************
    文件：My_LuaEnv.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;
using XLua;
public class My_LuaEnv: MonoBehaviour 
{
    private void Start()
    {
        //lua解析器：让我们能在 unity 中执行lua
        LuaEnv env = new LuaEnv();
        env.DoString("print('hello world')");

        //默认寻找的路径在 resources 下，需要加.txt
        env.DoString("require('Main')");

        //GC
        env.Tick();

        //销毁lua解析器
        env.Dispose();
    }
}