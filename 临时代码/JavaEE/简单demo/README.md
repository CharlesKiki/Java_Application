如何开发本项目指南
首先，将整个JavaWeb文件夹放置到webapps下，接着，启动Tomcat之后在浏览器访问：
http://localhost:8080/Java_Application/JavaWeb/WebContent/index.jsp

注意EclispeIDE在默认情况下会使用它自身的workspace作为Web部署目录，这会导致不能正常的使用Tomcat访问到项目，解决方法为在IDE的下方标签Server中的右键指定Tomcat服务器右键Open选项，更改默认的部署目录。

Web开发基础

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
意思是：设置页面的编码格式，以及引入jar包

关于WEB-INF文件夹
WEB-INF是Java的WEB应用的安全目录。所谓安全就是客户端无法访问，只有服务端可以访问的目录。如果想在页面中直接访问其中的文件，必须通过web.xml文件对要访问的文件进行相应映射才能访问。
    作用，应该Git提交。内部存放部分需要登陆验证之后才能访问的网页。提高网站安全性。
    
关于架构 SSH2+
spring 配置-- 一个MVC设计模式
    Spring的引入主要依赖Web.XML的编写，以及在WEB-INF下的lib文件夹存放Spring的jar包
Hibernate配置 --对象关系映射框架
Struts2配置

Web.XML的编写方法 配置文件编写方法

额外的内容
普通的Java项目和动态Web项目有何不同?
从Java的运行原理来看：JavaWeb项目中的Java文件是tomcat服务器来触发的，脱离了web服务器就无法启动。而Java项目是由main()方法来开始的，直接依赖JVM就能被编译执行。Tomcat相当于一个能够运行Java的环境。
从配置文件.project来看：这可能取决于对配置文件中要求的Tomcat服务器版本号以及定义的编译位置有关。

``` stylus
<nature>org.eclipse.wst.common.project.facet.core.nature</nature> 
<nature>org.eclipse.wst.common.modulecore.ModuleCoreNature</nature> 
<nature>org.eclipse.jem.workbench.JavaEMFNature</nature> 
```

关键语句。具有以上语句之后可以从MyEclispe转换为Eclispe并转换为Web项目。
    如何从普通Java项目转换到Web项目？
    直接项目右键进入Properties配置，点击Project Facets，再点击Convert to faceted form进入属性设置
    
    
.project是项目文件，项目的结构都在其中定义，比如lib的位置,src的位置,classes的位置
