/****************************************************
    文件：ABTest.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    功能：AB包操作
*****************************************************/

using System.Collections;
using UnityEngine;

public class ABTest : MonoBehaviour 
{
    private void Start()
    {
        //同步加载AB包
        AssetBundle ab = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "cubeab");
        //AssetBundle ab2 = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "sphereab");

        //加载AB包的资源——注意：  AB包不能重复加载
        //                          AB包有依赖的话，需要把依赖的资源包也加载，否则会出现丢失问题
        //泛型方式
        //GameObject obj2 = ab.LoadAsset<GameObject>("Sphere");
        //普通方式,lua没有泛型只能用这种
        //GameObject obj = ab.LoadAsset("cube", typeof(GameObject)) as GameObject;



        //异步加载AB包
        //StartCoroutine(LoadABRes("sphereab", "Sphere"));

        //通过主包得到依赖信息,主包知道某个包需要的的所有依赖
        //加载主包
        AssetBundle abMain = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "PC");
        //加载主包的固定文件
        AssetBundleManifest abMainfest = abMain.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
        //从固定文件中获得依赖信息
        string[] strs = abMainfest.GetAllDependencies("cubeab");

        foreach(var i in strs)
        {
            AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + i);
        }

        GameObject obj = ab.LoadAsset<GameObject>("Cube");
        Instantiate(obj);

        //卸载单个资源ab包
        //ab.Unload(false);
        //卸载所有AB包资源
        AssetBundle.UnloadAllAssetBundles(false); // 如果为true 加载到场景的资源也会卸载
    }

    IEnumerator LoadABRes(string ABName, string resName)
    {
        AssetBundleCreateRequest abcr = AssetBundle.LoadFromFileAsync(Application.streamingAssetsPath + "/" + ABName);
        yield return abcr;

        AssetBundleRequest abr = abcr.assetBundle.LoadAssetAsync(resName,typeof(GameObject));
        yield return abr;

        Instantiate(abr.asset);
    }

}