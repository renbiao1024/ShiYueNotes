
/****************************************************
    文件：AutoEffect.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：粒子效果的自己控制
*****************************************************/

using UnityEngine;

public class AutoEffect : MonoBehaviour 
{
    private void Start()
    {
        ParticleSystem sys = GetComponent<ParticleSystem>();
        sys.Play();
        Destroy(this.gameObject, sys.main.duration);
    }
}