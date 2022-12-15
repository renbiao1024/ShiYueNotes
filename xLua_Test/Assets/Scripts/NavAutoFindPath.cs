/****************************************************
    文件：NavAutoFindPath.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：导航网格体自动寻路
*****************************************************/

using UnityEngine;
using UnityEngine.AI;

public class NavAutoFindPath : MonoBehaviour 
{
    public Transform target;
    NavMeshAgent agent;
    public GameObject bridge;
    bool isActive = true;
    private void Start()
    {
        agent = transform.GetComponent<NavMeshAgent>();
        target.gameObject.SetActive(false);
    }

    private void Update()
    {
        if(Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hitInfo;
            if(Physics.Raycast(ray, out hitInfo))
            {
                target.position = hitInfo.point;
                target.gameObject.SetActive(true);
                agent.destination = hitInfo.point;
            }
        }
        if(Input.GetKeyDown(KeyCode.Space)) 
        {
            agent.isStopped = !agent.isStopped;
        }

        if(Input.GetKeyDown(KeyCode.A))
        {
            isActive = !isActive;
            bridge.SetActive(isActive);
            agent.areaMask = isActive? -1 : 7;

        }
    }
}