/****************************************************
    文件：ProfilerExample.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEngine;
using UnityEngine.Profiling;

public class ProfilerExample : MonoBehaviour 
{
    private int sum = 0;
    private void Update()
    {
        Profiler.BeginSample("MyProfiler");
        for(int i = 0; i < 10; i++) {
            sum += 1;
            print(sum);
        }
        Profiler.EndSample();
    }
}