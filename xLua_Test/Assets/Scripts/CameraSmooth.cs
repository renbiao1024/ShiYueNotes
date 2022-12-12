/****************************************************
    文件：CameraSmooth.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：把相机缓慢移动到物体视角
*****************************************************/

using UnityEngine;

public class CameraSmooth : MonoBehaviour 
{
    public Transform target;

    public float smoothTime = 0.3f;
    private float xVelocity = 0.0f;
    private float yVelocity = 0.0f;
    private float zVelocity = 0.0f;

    private void Update()
    {
        float newXPos = Mathf.SmoothDamp(transform.position.x, target.position.x, ref xVelocity, smoothTime);
        float newYPos = Mathf.SmoothDamp(transform.position.y, target.position.y, ref yVelocity, smoothTime);
        float newZPos = Mathf.SmoothDamp(transform.position.z, target.position.z, ref zVelocity, smoothTime);
        transform.position = new Vector3(newXPos, newYPos, newZPos);
    }
}