/****************************************************
    文件：ABMgrTest.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    功能：对ABMgr功能进行测试
*****************************************************/

using UnityEngine;

public class ABMgrTest : MonoBehaviour 
{
    private void Start()
    {
        GameObject obj1 = ABMgr.GetInstance().LoadRes("cubeab", "Cube") as GameObject;
        obj1.transform.position = new Vector3(1f,1f,1f);

        GameObject obj2 = ABMgr.GetInstance().LoadRes("cubeab", "Cube", typeof(GameObject)) as GameObject;

        GameObject obj3 = ABMgr.GetInstance().LoadRes<GameObject>("cubeab", "Cube");
        obj3.transform.position = new Vector3(2f, 2f, 2f);

        ABMgr.GetInstance().LoadResAsync("sphereab", "Sphere", (obj) =>
        {
            (obj as GameObject).transform.position = new Vector3(3f, 3f, 3f);
        });

        ABMgr.GetInstance().LoadResAsync("sphereab", "Sphere", typeof(GameObject), (obj) =>
        {
            (obj as GameObject).transform.position = new Vector3(4f, 4f, 4f);
        });

        ABMgr.GetInstance().LoadResAsync<GameObject>("sphereab", "Sphere", (obj) =>
        {
            obj.transform.position = new Vector3(5f, 5f, 5f);
        });
    }
}