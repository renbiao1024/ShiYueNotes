/****************************************************
    文件：MoveTo.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：让cube1追着cube2运动
*****************************************************/

using UnityEngine;

public class MoveTo : MonoBehaviour 
{
    public Transform endTrans;

    private void Start()
    {
        
    }

    private void Update()
    {
        float dis = Vector3.Distance(transform.position, endTrans.position);
        if(dis > 0.01f)
            transform.position = Vector3.Lerp(transform.position,endTrans.position,Time.deltaTime);
        else 
            transform.position = endTrans.position;

        Vector3 relativePos = endTrans.position - transform.position;
        transform.rotation = Quaternion.LookRotation(relativePos);
    }
}