/****************************************************
    文件：LuaCallCSharp.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
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
[CSharpCallLua]

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
[CSharpCallLua]

public class Lesson5
{
    public int RefFun(int a, ref int b)
    {
        return a + b;
    }

    public int OutFun(int a, out int b)
    {
        b = 2;
        return a+b;
    }

    public int RefOutFun(int a, ref int b, out int c)
    {
        b = a;
        c = 2;
        return a + b + c;
    }

}

[LuaCallCSharp]
public class Lesson6
{
    public int Calc()
    {
        return 100;
    }

    public int Calc(int a, int b)
    {
        return a + b;
    }

    public int Calc(int a)
    {
        return a;
    }

    public float Calc(float a) 
    {
        return a;
    }
}
[CSharpCallLua]

public class Lesson7
{
    public UnityAction del;
    public event UnityAction eventAction;
    public void DoEvent()
    {
        if(eventAction != null)
        {
            eventAction();
        }
    }

    public void ClearEvent()
    {
        eventAction = null;
    }
}
[CSharpCallLua]

public class Lesson8
{
    public int[,] array = new int[2, 3] { { 1, 2, 3 }, { 2, 3, 4 } };
    public Lesson8()
    {
        array[0, 0] = 1;
    }
}

[LuaCallCSharp]
public static class Lesson9
{
    //为lua扩展一个为object判空的方法
    public static bool IsNull(this System.Object obj)
    {
        return obj == null;
    }
}
[CSharpCallLua]
public static class Lesson10
{
    [CSharpCallLua]
    public static List<Type> csharpCallLuaList = new List<Type>()
    {
        typeof(UnityAction<float>)
    };

    [LuaCallCSharp]
    public static List<Type> luaCallCSharpList = new List<Type>()
    {
        typeof(GameObject)
    };
}


public class Lesson12
{
    public interface ITest { }
    public class TestFather
    {

    }

    public class TestChild : TestFather, ITest
    {

    }
    public void TestFun1<T>(T a, T b) where T: TestFather
    {
        Debug.Log("有参数有约束的泛型方法");
    }

    public void TestFun2<T>(T a)
    {
        Debug.Log("有参数没有约束");
    }

    public void TestFun3<T>() where T: TestFather
    {
        Debug.Log("有约束无参数的泛型");
    }
    public void TestFun4<T>(T a) where T : ITest
    {
        Debug.Log("有约束有参数，约束是接口");
    }
}

[CSharpCallLua]
public class LuaCallCSharp : MonoBehaviour 
{

}