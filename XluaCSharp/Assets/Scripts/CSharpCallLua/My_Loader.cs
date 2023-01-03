/****************************************************
    文件：My_Loader.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using System.IO;
using UnityEngine;
using XLua;

public class My_Loader : MonoBehaviour 
{
    private void Start()
    {
        LuaEnv env = new LuaEnv(); //解析器

        //用于自定义加载lua文件的规则,如果自定义路径为空则检查默认路径
        env.AddLoader(MyCustomLoader);
        env.DoString("require('Main')");

    }

    private byte[] MyCustomLoader(ref string filePath)
    {
        //传入的是reqire的脚本文件路径
        string path = Application.dataPath + "/LuaScripts/" + filePath + ".lua";
        Debug.Log(path);

        if(File.Exists(path))
        {
            return File.ReadAllBytes(path);
        }
        else
        {
            Debug.Log(filePath + " 重定向失败");
        }
        return null;
    }
}