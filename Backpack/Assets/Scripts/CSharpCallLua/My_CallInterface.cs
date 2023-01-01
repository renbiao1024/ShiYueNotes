/****************************************************
    文件：My_CallInterface.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;
using UnityEngine.Events;
using XLua;

[CSharpCallLua]
public interface ICSharpCallInterface
{
    //用属性接收lua成员变量/函数
    int testInt { get; set; }
    bool testBool { get; set; }
    float testFloat { get; set; }
    string testString { get; set; }

    UnityAction testFunc { get; set; }
}

public class My_CallInterface : MonoBehaviour 
{
    private void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        ICSharpCallInterface obj = LuaMgr.GetInstance().Globle.Get<ICSharpCallInterface>("testClass");
        Debug.Log(obj.testInt);
        Debug.Log(obj.testBool);
        Debug.Log(obj.testFloat);
        Debug.Log(obj.testString);
        Debug.Log(obj.testFunc);
        //接口是深拷贝，修改后lua侧也被修改
        obj.testInt = 2000;
        ICSharpCallInterface obj2 = LuaMgr.GetInstance().Globle.Get<ICSharpCallInterface>("testClass");
        Debug.Log(obj2.testInt);
    }
}