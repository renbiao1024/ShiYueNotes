/****************************************************
    文件：My_CallFunction.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using System;
using UnityEngine;
using XLua;

public delegate void CustomCall();

[CSharpCallLua]
public delegate int CustomCall2(int a);

[CSharpCallLua]
public delegate int CustomCall3(int a, out int b, out bool c, out string d, out int e);

[CSharpCallLua]
public delegate int CustomCall4(int a, ref int b, ref bool c, ref string d, ref int e);

public delegate void CustomCall5(string a, params int[] args);

public class My_CallFunction : MonoBehaviour 
{
    private async void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

//无参无返回
        //使用委托调用
        CustomCall call = LuaMgr.GetInstance().Globle.Get<CustomCall>("testFun");
        call();
        // 也可以用UnityAction Action LuaFunction(少用) 调用
        //建议用UnityAction Action
       
//有参有返回
        CustomCall2 call2 = LuaMgr.GetInstance().Globle.Get<CustomCall2>("testFun2");
        Debug.Log(call2(10));

        //建议方法
        Func<int, int> sFun = LuaMgr.GetInstance().Globle.Get<Func<int, int>>("testFun2");
        Debug.Log(call2(11));

        LuaFunction lf = LuaMgr.GetInstance().Globle.Get<LuaFunction>("testFun2");
        Debug.Log(lf.Call(12)[0]);

//多返回值
        //使用 out ref 接收
        CustomCall3 call3 = LuaMgr.GetInstance().Globle.Get<CustomCall3>("testFun3");
        int b;
        bool c;
        string d;
        int e;
        Debug.Log(call3(12, out b, out c, out d, out e));

        //ref需要初始化
        CustomCall4 call4 = LuaMgr.GetInstance().Globle.Get<CustomCall4>("testFun3");
        int b1 = 0;
        bool c1 = true;
        string d1 = "";
        int e1 = 0;
        Debug.Log(call4(12, ref b1, ref c1, ref d1, ref e1));

        LuaFunction lf3 = LuaMgr.GetInstance().Globle.Get<LuaFunction>("testFun3");
        object[] objs = lf3.Call(1000);
        for(int i = 0; i < objs.Length; ++i)
        {
            Debug.Log(objs[i]);
        }

//变长参数
        CustomCall5 call5 = LuaMgr.GetInstance().Globle.Get<CustomCall5>("testFun4");
        call5("123", 1,2,3,4,5);

        LuaFunction lf4 = LuaMgr.GetInstance().Globle.Get<LuaFunction>("testFun4");
        lf4.Call("123", 1, 2, 3, 4, 5);
    }
}