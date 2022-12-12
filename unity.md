# 常用快捷键

Q：手形工具

W：移动工具

E：旋转工具

R：缩放工具

T：矩形工具

Y：变换工具

F：聚焦

ALT+鼠标左键：以对象为中心旋转（直接用鼠标右键旋转是以当前的视窗旋转）

ALT+鼠标右键：拉近拉远场景距离（鼠标滚轮）

WSADQE+鼠标右键：飞行浏览模式，shift加速

# 3D资源参数

## Model

### Scene

- Scale Factor：缩放系数，矫正不同软件的单位不同问题![img](./assets/DDDCF9692DFB011D1D8BB0F4715CADEA.png)
- Preserve Hierarchy：是否保留文件层次结构
- Mesh Compression：网格压缩的程度
- Read/Write Enabled：网格是否可以被实时读写
- Optimize Mesh：优化网格

### Meshes

- Keep Quads：保留四边形
- Weld Vertices：合并相同位置的顶点
- Index Format：定义网格索引缓存区的大小

## Rig

设置模型支持动画

## Animation

从模型文件中导入动画

## Materials

从导入的模型中提取和调整材质

Location

- use embedded materials：将导入的材质提取为外部资源
- use external materials：将导入的资源保留在导入的模型中

# 图片资源

## 类型

![image-20221209090211630](./assets/image-20221209090211630.png)

# 数学

## 旋转表示

![image-20221209095346803](./assets/image-20221209095346803.png)

## 四元数函数

![image-20221209095837681](./assets/image-20221209095837681.png)

## 坐标系变换

![image-20221209101005643](./assets/image-20221209101005643.png)

# 必然事件

![image-20221210181445489](./assets/image-20221210181445489.png)

# 函数控制符

![image-20221210184832938](./assets/image-20221210184832938.png)

![image-20221210185231479](./assets/image-20221210185231479.png)

# 数据结构

## 链表操作

![image-20221210191325762](./assets/image-20221210191325762.png)

![image-20221210192428961](./assets/image-20221210192428961.png)

<img src="./assets/image-20221210192435946.png" alt="image-20221210192435946" style="zoom:80%;" />

# MonoBehavior类

- unity的脚本都要继承自MonoBehavior

![image-20221210193126417](./assets/image-20221210193126417.png)

## 访问游戏对象

![image-20221210200443862](./assets/image-20221210200443862.png)

## 组件

![image-20221210200700562](./assets/image-20221210200700562.png)

![image-20221210200713904](./assets/image-20221210200713904.png)

# 常用API

![image-20221212092327404](./assets/image-20221212092327404.png)

![image-20221212092533820](./assets/image-20221212092533820.png)

![image-20221212093500557](./assets/image-20221212093500557.png)

![image-20221212093548327](./assets/image-20221212093548327.png)

![image-20221212093634043](./assets/image-20221212093634043.png)

![image-20221212095116849](./assets/image-20221212095116849.png)

> Yield Return关键字的作用就是退出当前函数，并且会保存当前函数执行到什么地方，也就上下文。你发现没下次执行这个函数上次跑来的代码是不会重复执行的，
>
> 但是你一般的return result 假如你在循环体提前return ,下面调这个函数是会从第一步开始重新执行的。不会记录上次执行的地方。

![image-20221212100715051](./assets/image-20221212100715051.png)

![image-20221212100736329](./assets/image-20221212100736329.png)

# 脚本生命周期

![image-20221212100927787](./assets/image-20221212100927787.png)

![image-20221212101954484](./assets/image-20221212101954484.png)

![image-20221212102102424](./assets/image-20221212102102424.png)

![image-20221212102135873](./assets/image-20221212102135873.png)

# 输入——Input类

![image-20221212102521584](./assets/image-20221212102521584.png)

![image-20221212102531698](./assets/image-20221212102531698.png)

![image-20221212102538415](./assets/image-20221212102538415.png)

![image-20221212103751673](./assets/image-20221212103751673.png)

![image-20221212104839141](./assets/image-20221212104839141.png)

![image-20221212104848198](./assets/image-20221212104848198.png)

![image-20221212104902450](./assets/image-20221212104902450.png)

![image-20221212105849440](./assets/image-20221212105849440.png)

# 物理系统
