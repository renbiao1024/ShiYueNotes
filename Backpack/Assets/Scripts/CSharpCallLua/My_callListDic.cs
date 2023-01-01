/****************************************************
    文件：My_callListDic.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using System.Collections.Generic;
using UnityEngine;

public class My_callListDic : MonoBehaviour 
{
    private void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");
        //唯一类型
        List<int> list = LuaMgr.GetInstance().Globle.Get<List<int>>("testList");
        for(int i = 0; i < list.Count; ++i)
        {
            Debug.Log(list[i]);
        }
        //任意类型
        List<object> list2 = LuaMgr.GetInstance().Globle.Get<List<object>>("testList2");
        for (int i = 0; i < list2.Count; ++i)
        {
            Debug.Log(list2[i]);
        }

        Dictionary<string, int> dic = LuaMgr.GetInstance().Globle.Get<Dictionary<string, int>>("testDic");
        foreach(string item in dic.Keys)
        {
            Debug.Log(item + dic[item]);
        }

        Dictionary<object, object> dic2 = LuaMgr.GetInstance().Globle.Get<Dictionary<object, object>>("testDic2");
        foreach (object item in dic2.Keys)
        {
            Debug.Log(item +" "+ dic2[item]);
        }
    }
}