/****************************************************
    文件：DropDownTest.cs
    作者：Biu
    邮箱: 1024906432@qq.com
    日期：#CreateTime#
    功能：下拉菜单学习
*****************************************************/

using UnityEngine;
using UnityEngine.UI;

public class DropDownTest : MonoBehaviour 
{
    public Dropdown dropdown;
    private void Start()
    {
        dropdown.onValueChanged.AddListener(OnValueChanged);
        
        //添加单个数据
        Dropdown.OptionData op1 = new Dropdown.OptionData();
        op1.text = "hello";
        dropdown.options.Add(op1);

        
    }

    private void OnValueChanged(int val)
    {
        Debug.Log(val);
    }
}