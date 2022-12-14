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

![image-20221213132943731](./assets/image-20221213132943731.png)

![image-20221213133311794](./assets/image-20221213133311794.png)

## 物理材质

![image-20221213133646438](./assets/image-20221213133646438.png)

# 粒子系统

## 主模块

![image-20221213164811815](./assets/image-20221213164811815.png)

## 发射模块

![image-20221213165011764](./assets/image-20221213165011764.png)

## 形状模块

发射粒子的形状

![image-20221213165037826](./assets/image-20221213165037826.png)

![image-20221213165056450](./assets/image-20221213165056450.png)

![image-20221213165111345](./assets/image-20221213165111345.png)

![image-20221213165123153](./assets/image-20221213165123153.png)

## 生命周期速度模块

![image-20221213165326537](./assets/image-20221213165326537.png)

![image-20221213165311964](./assets/image-20221213165311964.png)

## 生命周期速度限制模块

![image-20221213165509747](./assets/image-20221213165509747.png)

![image-20221213165442068](./assets/image-20221213165442068.png)

## 速度继承模块

- 例子随着时间推移，速度对于父对象运动的反应

![image-20221213165647785](./assets/image-20221213165647785.png)

## 生命周期模块

![image-20221213170726986](./assets/image-20221213170726986.png)

![image-20221213170743337](./assets/image-20221213170743337.png)

![image-20221213170829664](./assets/image-20221213170829664.png)

## 速度模块

![image-20221213170800161](./assets/image-20221213170800161.png)

![image-20221213170817668](./assets/image-20221213170817668.png)

![image-20221213170838916](./assets/image-20221213170838916.png)

## 外部力量模块

![image-20221213170908058](./assets/image-20221213170908058.png)

## 噪声模块

![image-20221213171018793](./assets/image-20221213171018793.png)

## 碰撞模块

- 控制粒子和场景中的对象碰撞

![image-20221213171058563](./assets/image-20221213171058563.png)

## 触发模块

![image-20221213171159837](./assets/image-20221213171159837.png)

## 子发射器模块

![image-20221213171213892](./assets/image-20221213171213892.png)

## 纹理动画模块

![image-20221213171230423](./assets/image-20221213171230423.png)

## 灯光模块

![image-20221213171249549](./assets/image-20221213171249549.png)

## 拖尾模块

- 为粒子添加拖尾特效

## 自定义数据模块

![image-20221213171358295](./assets/image-20221213171358295.png)

## 渲染模块

![image-20221213171417066](./assets/image-20221213171417066.png)

![image-20221213171423533](./assets/image-20221213171423533.png)

# 动画

## Aratar

- 骨骼

## Muscle

- 用于设置骨骼运动范围，模拟肌肉

![image-20221213174159072](./assets/image-20221213174159072.png)

## 动画混合

- 混合树
  - 1D
  - 2D
  - 直接混合

# Timeline

- 创建一个TimelineAssit会影响到他的每一个TimelineInstance

# UGUI

## 添加按钮事件的4种方式

- 写好回调函数直接在button onclick列表添加

![image-20221214140130038](./assets/image-20221214140130038.png)

- 脚本监听

![image-20221214140147065](./assets/image-20221214140147065.png)

- 通过Trigger组件，类似方法1

- 继承自对应的类接口实现事件的监听

![image-20221214143425037](./assets/image-20221214143425037.png)

## Nav Mesh

![img](./assets/8484664D7B1530946FA432D2CD2423E5.png)
