/****************************************************
    文件：DataHierarchy.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：学习unity数据结构
*****************************************************/

using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using XLuaTest;

public class DataHierarchy : MonoBehaviour 
{
    //一维数组
    public int[] arr = new int[10];
    //二维数组
    public int[,] arr2 = new int[2, 3];
    //链表
    List<int> mList = new List<int>();


    private void Start()
    {

        for(int i = 0; i < arr.Length; i++)
        {
            arr[i] = arr.Length - i;
        }

        /*
        foreach(int it in arr)
        {
            Debug.Log(it);
        }

        for(int i = 0; i < arr2.GetLength(0); ++i)
        {
            for(int j = 0; j < arr2.GetLength(1); ++j)
            {
                arr2[i, j] = i + j;
            }
        }
        foreach (int it in arr2)
        {
            Debug.Log(it);
        }
        */

        /*
        //链表操作
        mList.Clear();
        mList.Add(0);
        mList.AddRange(arr);
        mList.Insert(0, 123);
        mList.Remove(123);
        mList.RemoveAt(0);
        mList.RemoveRange(0, 2);
        mList.Contains(0);
        mList.Sort();
        mList.Count();
        int[] n = mList.ToArray(); // 链表转换成数组
        */

    }

    private void DebugList(List<int> mList)
    {
        for(int i = 0; i < mList.Count; i++)
        {
            Debug.Log(mList[i]);
        }
    }
}