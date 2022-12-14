/****************************************************
    文件：SpawnEffect.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：生成粒子特效
*****************************************************/

using UnityEngine;

public class SpawnEffect : MonoBehaviour 
{
    public GameObject effect;

    private void Update()
    {
        if(Input.GetMouseButtonDown(0))
        {
            RaycastHit raycastHit;
            if(Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out raycastHit))
            {
                Instantiate(effect, raycastHit.point, Quaternion.identity);
            }
        }
    }

}