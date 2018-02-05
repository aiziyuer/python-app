项目说明
===


### 开发环境搭建


假设在win下做开发, 第一次使用的时候需要生成一个`干净`的环境:

```bash
# 创建一个私有的pip环境
virtualenv --no-site-packages env-win 
# 加载私有的pip环境
.\env-win\Scripts\activate.bat 
# 根据需要安装依赖
pip install -r requirements.txt 
```

到这一步执行完成后开发环境就搭好了, 直接执行我们工程中的源码应该
不会报错, 如果有`__main__`函数的话应该`python src`就可以直接启动
应用.


### 生产打包

这里提供了`pack.bash`脚本完成源码和依赖的打包, 最终应用名称是`app.zip`,
如果在`linux`环境下直接`./app.zip`就可以启动应用。