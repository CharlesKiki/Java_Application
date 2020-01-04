
《JAVA错误：The public type ***must be defined in its own file***》
　　出现The public type xxx must be defined in its own file这个问题，是由于定义的JAVA类同文件名不一致。public类必须定义在它自己的文件中。

　　解决方法：

　　1、把文件名修改同公共类一样的名字；

　　2、把类名修改成同文件名；

　　3、子类继承父类时，不需要再用public修饰。

　　同一文件中，不能有多于一个public声明的类出现，可以将其中一个public去掉，即不加任何修饰符，通常称为“默认访问模式”，在该模式下，这个类只能被同一个包中的类访问或引用，这一访问特性又称包访问性。

注意，如果在根目录下有一个.vscode配置，并且它的子目录中仍然有其他的vscode项目，那么这种打开根目录是不会正常的以项目的形式访问编辑其他的项目的。
需要以文件夹的形式单独用VScode打开。

例如:Java Spring Dashboard插件需要指定的一个项目打开才能正常的读取Spring项目并启动。(SpringBoot项目，这种Web项目可以使用框架内置的Tomcat。)