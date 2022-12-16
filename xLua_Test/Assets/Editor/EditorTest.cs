/****************************************************
    文件：EditorTest.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：创建编辑器窗口
*****************************************************/

using UnityEditor;
using UnityEngine;

public class EditorTest : EditorWindow 
{
    [MenuItem("Window/MyWindow")]
    static void AddWindow()
    {
        EditorTest window = (EditorTest)EditorWindow.GetWindow(typeof(EditorTest),true, "MyWindow");
        window.Show();
    }

    private Texture texture;
    private string myString = "";
    private bool myBool = false;
    private float myFloat = 0f;
    private bool groupEnabled = true;

    private void OnGUI()
    {
        if(GUILayout.Button("Open Text", GUILayout.Width(200)))
        {
            this.ShowNotification(new GUIContent("This is a Notification"));
        }
        if (GUILayout.Button("Close Text", GUILayout.Width(200)))
        {
            this.RemoveNotification();
        }

        texture = EditorGUILayout.ObjectField("Add Texture", texture, typeof(Texture), true) as Texture;
        GUILayout.Label("Base Settings", EditorStyles.boldLabel);
        myString= EditorGUILayout.TextField("Text Field",myString, GUILayout.Width(300));
        groupEnabled = EditorGUILayout.BeginToggleGroup("ToggleGroup", groupEnabled);
        myBool = EditorGUILayout.Toggle("Toggle", myBool);
        myFloat = EditorGUILayout.Slider("Slider", myFloat, 0, 1);
        EditorGUILayout.EndToggleGroup();
        if(GUILayout.Button("Close Window", GUILayout.Width(200)))
        {
            this.Close();
        }
    }
}