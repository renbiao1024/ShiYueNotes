/****************************************************
    文件：My_CallClass.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;
using UnityEngine.Events;

public class CallLuaClass
{
    public int testInt;//名字要和lua侧一样且public
    public bool testBool;
    public float testFloat;
    public string testString;
    public UnityAction testFunc;
    //名字不同就是c#侧的函数或者变量
}

public class My_CallClass : MonoBehaviour 
{
    private void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        CallLuaClass obj = LuaMgr.GetInstance().Globle.Get<CallLuaClass>("testClass");
        Debug.Log(obj.testInt);
        Debug.Log(obj.testBool);
        Debug.Log(obj.testFloat);
        Debug.Log(obj.testString);
        Debug.Log(obj.testFunc);
    }


}