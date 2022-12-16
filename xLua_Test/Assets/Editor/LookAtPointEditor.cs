/****************************************************
    文件：LookAtPointEditor.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：
*****************************************************/

using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(LookAtPoint))]
public class LookAtPointEditor : Editor 
{
    public override void OnInspectorGUI()
    {
        LookAtPoint p = (LookAtPoint)target;
        p.Point = EditorGUILayout.Vector3Field("Look At Point", p.Point);
        if (GUI.changed)
        {
            EditorUtility.SetDirty(p);
        }
    }

    private void OnSceneGUI()
    {
        LookAtPoint p = (LookAtPoint)target;
        p.Point = Handles.PositionHandle(p.Point, Quaternion.identity);
        if (GUI.changed)
            EditorUtility.SetDirty(p);
    }
}