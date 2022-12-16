/****************************************************
    文件：ExportAssetBundle.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：打包自己的bundle
*****************************************************/

using UnityEngine;
using UnityEditor;
using System.IO;
using System.Collections.Generic;

public class ExportAssetBundle : MonoBehaviour 
{
    [MenuItem("Export/Build AssetBundles")]
    static void CreateAssetBundleMain()
    {
        if(!Directory.Exists(Application.dataPath + "/StreamingAssets"))
        {
            Directory.CreateDirectory(Application.dataPath + "/StreamingAssets");
        }
        BuildPipeline.BuildAssetBundles("Assets/StreamingAssets", BuildAssetBundleOptions.DeterministicAssetBundle, BuildTarget.StandaloneWindows64);
    }
}