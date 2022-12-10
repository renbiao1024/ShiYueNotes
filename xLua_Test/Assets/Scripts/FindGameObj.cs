/****************************************************
    文件：FindGameObj.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：查找游戏对象
*****************************************************/

using UnityEngine;

public class FindGameObj : MonoBehaviour 
{
    GameObject cube;
    GameObject mainCam;
    GameObject[] cubes;
    private void Start()
    {
        //遍历递归查找场景中指定名称或者路径的游戏对象的引用，不能查找隐藏对象
            //1.GameObject只能查找到active的物体
            //2.如果name指定路径，则按路径查找；否则递归查找，直到查找到第一个符合条件的GameObject或者返回null

        cube = GameObject.Find("Cube");//名称查找
        mainCam = GameObject.Find("fa/Main Camera");//路径查找

        //根据tag标签查找
        cube = GameObject.FindWithTag("shapes"); //找到第一个
        cubes = GameObject.FindGameObjectsWithTag("shapes"); //找到全部存到数组里

        //通过名字或者路径查找子对象，可以查找隐藏对象
            //用于查找子节点，它并不会递归的查找物体，也就是说它只会查找它的子节点，并不会查找子节点的子节点。
        cube = transform.Find("ma/Cube").gameObject;
        mainCam = transform.Find("fa/Main Camera").gameObject;
    }
}