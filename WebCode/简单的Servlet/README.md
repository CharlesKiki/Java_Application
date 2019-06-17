Web.xml是用来服务器的容器(Tomcat)对客户端的请求进行匹配用的，例如，
http://localhost:8080/简单的Servlet/ServletDemo--FromWebXML
其中，/简单的Servlet是Webapp下Web项目的上下文，对这个站点的请求都是在这个之上的。
/ServletDemo--FromWebXML是客户端对一个特定资源的请求，但是这里看不出来是什么请求，实际上它是一个名为ServletDemo的servlet，但是在Web.xml的映射下，它被访问的方式从
http://localhost:8080/简单的Servlet/ServletDemo
改编成后来的名称的了。
``` xml
	<!-- 配置一个servlet -->
	<!-- servlet的配置 -->
	<servlet>
	    <!-- servlet的内部名称，自定义。尽量有意义 -->
	    <servlet-name>ServletDemo--FromWebXML</servlet-name>
	    <!-- servlet的类全名： 包名+简单类名 -->
	    <servlet-class>servlet.ServletDemo</servlet-class>
	</servlet>
	<!-- servlet的映射配置 -->
	<servlet-mapping>
	    <!-- servlet的内部名称，一定要和上面的内部名称保持一致！！ -->
	    <servlet-name>ServletDemo--FromWebXML</servlet-name>
	    <!-- servlet的映射路径（访问servlet的名称） -->
	    <url-pattern>/ServletDemo--FromWebXML</url-pattern>
	</servlet-mapping>
```