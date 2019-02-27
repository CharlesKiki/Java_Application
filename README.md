# Java_Application
Java的语言特性，以及Web开发，桌面应用程序，移动开发的学习例子。

## 测试环境 
Windows10
Tomcat9.0
    解压版本的Tomcat需要指定JavaSDK的安装位置。
    推荐在Tomcat根目录下的bin中找到startup.bat。
    在文件第一行@echo off下添加
    SET JAVA_HOME=C:\Program Files\Java\jdk1.8.0_131
    使用startup.bat即可开启服务器。(不要关闭命令行窗口，这会关闭Tomcat)
Eclispe Neon版本
    需要注意的是，Neon版本的Eclispe需要额外的JavaEE开发环境，并且需要对Server进行额外的插件安装。
    安装方法为 帮助 - 安装新软件 - 添加软件安装源 http://download.eclipse.org/releases/neon
    以下是需要安装的扩展包：
        Eclipse Java EE Developer Tools
        Eclipse Java Web Developer Tools
        Eclipse Web Developer Tools
        Eclipse XML Editors and Tools
        JST Server Adapters
        JST Server Adapters Extentions
        如果不嫌弃安装了额外的包，可以直接全选Web,XAML,JaveEE……的所有包。
    注：如果没有安装以上的内容看可能会导致无法配置Server Runtime，这是在创建动态Web应用的一个必须过程。并且甚至看看可能无法创建动态Web应用。

## 部署方法
没有使用虚拟目录，所以直接使用了Tomcat下的wabapps目录下创建JavaWeb应用。

## EclisprjavaWeb项目
该项目使用的SDK环境以及Tomcat版本都会影响项目的正常编译运行。
在打开项目之前要保证Eclispe安装了正确的包，以及Tomcat的版本是正确的。(在Eclispe中需要对Tomcat的安装目录进行设定。)

## BasicJava项目
该项目是纯粹的Java项目，目的在于学习Java的IDE(Eclispe)开发技巧，语言特性，编程模式的代码样例。