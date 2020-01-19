    <servlet>
    <servlet-name>这个值可以任意的设置，不必和class一致</servlet-name>
    <servlet-class>包名.类名</servlet-class>    
    </servlet>
    <servlet-mapping>
    <servlet-name>和servletname一致</servlet-name>
    <url-pattern>在URL中访问的地址</url-pattern>
    </servlet-mapping>


项目本身在被加载的时候出错会导致Tomcat加载失败。

Web.xml中的配置出错会导致404错误。

对项目中的配置文件和源码进行改动后应该重新编译后重新启动容器后测试。

配置<servlet-class>方法



Web.xml对Welcome页的访问无法在Web-INFO中，该文件夹中的内容是受到保护的。



Tomacat是由缓存的，这意味着如果Tomcat的报错看起来是上次的运行结果，尝试从Eclipsing中Project->Clean重新生成。项目中的META-INF里面就没有缓存的classes文件了

但是需要注意的是，这可能仍然需要在Eclipse下方的Server面板中右键CleanTomcat的缓存。不建议手动进行文件夹之间的手工发布这个操作。

部署到tomcat下的工程没有更新造成的，就是说eclipse中的工程清理了也重新编译了，比如存在E盘下的某个目录，而你发布的程序在D盘tomcat中，如果你没有设置自动更新的话，你的D盘中的内容还是以前的。
建议你查看下tomcat中的class文件是否已经更新了，最简单的就是看下class的修改时间是否是最新的。

如果还不行的话，我是直接将eclipse工程下的bin目录直接删除，然后编译肯定是最新的。然后去tomcat下的工程目录下找到class所在的目录，一般是在webapps\项目名称\WEB-INF\classes中，直接删除掉classes下所有文件，拷贝新生成的bin目录下的所有文件到这个classes文件夹即可。

这个不是根本的解决办法，还是找找哪里配置的不正确吧。eclipse不自动编译不太可能，因为你勾选自动编译了。有可能还是发布的问题。