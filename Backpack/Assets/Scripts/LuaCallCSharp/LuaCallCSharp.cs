/****************************************************
    文件：LuaCallCSharp.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using System.Collections.Generic;
using UnityEngine;
using XLua;

public class Test
{
    public void Speak(string str)
    {
        Debug.Log(str);
    }
}

namespace R
{
    public class Test2
    {
        public void Speak(string str)
        {
            Debug.Log(str);
        }
    }

}

public enum E_MyEnum
{
    Idle,
    Move,
    Atk
}

public class Lesson3
{
    public int[] arr = new int[5] { 1, 2, 3, 4, 5 };
    public List<int> list = new List<int>();
    public Dictionary<int, string> dic = new Dictionary<int, string>();
}

[LuaCallCSharp]
public static class Tools
{
    public static void Move(this Lesson4 obj)
    {
        Debug.Log(obj.name + "移动");
    }
}

public class Lesson4
{
    public string name = "RB";
    public void Speak(string str)
    {
        Debug.Log(str);
    }

    public static void Eat()
    {
        Debug.Log("吃东西");
    }
}

public class LuaCallCSharp : MonoBehaviour 
{

}