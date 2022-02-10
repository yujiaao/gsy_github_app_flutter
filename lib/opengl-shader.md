# 什么是 shader ？
Shader， 即着色器，是一种类C语法的程序，用于封装硬件相关部分的代码。与普通程序的区别在于 shader 是通过GPU来执行的。

需要给GPU而不是CPU写程序的原因是GPU在处理图形相关运算时远远快于CPU。


不同的 shader 程序在使用时编译成本机硬件支持的机器指令。

shader 主要有两种：
 - 顶点着色程序 vertex shader 
 - 片段着色程序 fragment shader，也称做像素着色器 pixel shader

当然，不只这两种，还有很多其他的着色器程序， 如模板着色器，几何着色器等等。

 
vertex shader 用于修改(平移，旋转，扭曲)顶点的位置： potision 和确定顶点的颜色
fragment shader 用于确定每个像素的颜色，使用照明，材质等等

# 编写 shader 程序

* 编译 vertex shader，到ID
* 编译 fragment shader，得到ID
* 检查是否有编译错误
* 链接以上两个 shader 程序， 得到ID
	* 保持这个ID
	* 着色三角形时，使用这个ID
	* 不同的模型可以有不同的shader程序
	

# 举个例子

顶点着色器 vertex shader: 

```
in vec4 s_vPosition;
void main () {
  // 看，我不需要任何矩阵操作
  // s_vPosition 的值需要在 -1.0 和 1.0 之间
  gl_Position = s_vPosition;
}
```

片段着色器 fragment shader:
```
out vec4 s_vColor;
void main() {
   //不管三七二十一，像素都搞成红的!
   fColor =  vec4 (1.0, 0.0, 0.0, 1.0);
}
```
与C语言一样，main函数是必须的入口函数。双斜杆为注释。

之所以分为这两部分程序，主要是从性能考虑：画一个三角形，顶点着色器只调用3次，但片段着色器（或像素着色器）可能调用数百万次，取决于你的三角形在屏幕上显示的大小，包含多个像素。



# 编译着色器

可以通过调用一些OpenGL函数来编译着色器程序。


编译着色器分三步： 创建id，绑定代码, 编译。

* `<GLuint> glCreateShader (<type>)`
    * 创建一个着色器ID, 具有 GLuint 类型
    * 如 `GLuint ID = glCreateShader(GL_VERTEX_SHADER);`
* `glShaderSource (<id>, <count>, <src code>, <lengths>)`
	* 绑定代码到着色器程序
	* 发生在编译之前
* `glCompileShader (<id>)`
	* 编译一*部分*着色器程序


# 创建、链接、使用着色器	
上面只是搞了一个部分着色器，完整的程序需要再来四步：

* `<GLuint> glCreateProgram ()`
    * 创建一个着色器程序，返回ID, 整个程序生命周期需要保持这个ID    
* `glAttachShader (<prog id>, <shader id>)`
	* 这个调用需要分别对顶点和片段着色器搞两次
* `glLinkProgram (<prog id>)`
	* 真正的链接着色器程序
* `glUseProgram (<prog id>)`
	* 需要画三角形的时候使用着色器程序

好了，就这些。详细的例子可以看[这篇文章](https://webglfundamentals.org/webgl/lessons/zh_cn/webgl-fundamentals.html).




	







# 什么是 shader ？
Shader， 即着色器，是一种类C语法的程序，用于封装硬件相关部分的代码。与普通程序的区别在于 shader 是通过GPU来执行的。

需要给GPU而不是CPU写程序的原因是GPU在处理图形相关运算时远远快于CPU。


不同的 shader 程序在使用时编译成本机硬件支持的机器指令。

shader 主要有两种：
 - 顶点着色程序 vertex shader 
 - 片段着色程序 fragment shader，也称做像素着色器 pixel shader

当然，不只这两种，还有很多其他的着色器程序， 如模板着色器，几何着色器等等。

 
vertex shader 用于修改(平移，旋转，扭曲)顶点的位置： potision 和确定顶点的颜色
fragment shader 用于确定每个像素的颜色，使用照明，材质等等

# 编写 shader 程序

* 编译 vertex shader，到ID
* 编译 fragment shader，得到ID
* 检查是否有编译错误
* 链接以上两个 shader 程序， 得到ID
	* 保持这个ID
	* 着色三角形时，使用这个ID
	* 不同的模型可以有不同的shader程序
	

# 举个例子

顶点着色器 vertex shader: 

```
in vec4 s_vPosition;
void main () {
  // 看，我不需要任何矩阵操作
  // s_vPosition 的值需要在 -1.0 和 1.0 之间
  gl_Position = s_vPosition;
}
```

片段着色器 fragment shader:
```
out vec4 s_vColor;
void main() {
   //不管三七二十一，像素都搞成红的!
   fColor =  vec4 (1.0, 0.0, 0.0, 1.0);
}
```
与C语言一样，main函数是必须的入口函数。双斜杆为注释。

之所以分为这两部分程序，主要是从性能考虑：画一个三角形，顶点着色器只调用3次，但片段着色器（或像素着色器）可能调用数百万次，取决于你的三角形在屏幕上显示的大小，包含多个像素。



# 编译着色器

可以通过调用一些OpenGL函数来编译着色器程序。


编译着色器分三步： 创建id，绑定代码, 编译。

* `<GLuint> glCreateShader (<type>)`
    * 创建一个着色器ID, 具有 GLuint 类型
    * 如 `GLuint ID = glCreateShader(GL_VERTEX_SHADER);`
* `glShaderSource (<id>, <count>, <src code>, <lengths>)`
	* 绑定代码到着色器程序
	* 发生在编译之前
* `glCompileShader (<id>)`
	* 编译一*部分*着色器程序


# 创建、链接、使用着色器	
上面只是搞了一个部分着色器，完整的程序需要再来四步：

* `<GLuint> glCreateProgram ()`
    * 创建一个着色器程序，返回ID, 整个程序生命周期需要保持这个ID    
* `glAttachShader (<prog id>, <shader id>)`
	* 这个调用需要分别对顶点和片段着色器搞两次
* `glLinkProgram (<prog id>)`
	* 真正的链接着色器程序
* `glUseProgram (<prog id>)`
	* 需要画三角形的时候使用着色器程序

好了，就这些。详细的例子可以看[这篇文章](https://webglfundamentals.org/webgl/lessons/zh_cn/webgl-fundamentals.html).




	







