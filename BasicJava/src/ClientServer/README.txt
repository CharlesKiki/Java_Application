编译以上两个 java 文件代码，并执行以下命令来启动服务，使用端口号为 6066：

$ javac GreetingServer.java 
$ java GreetingServer 6066
等待远程连接，端口号为：6066...

新开一个命令窗口，执行以上命令来开启客户端：

$ javac GreetingClient.java 
$ java GreetingClient localhost 6066
连接到主机：localhost ，端口号：6066
远程主机地址：localhost/127.0.0.1:6066
服务器响应： 谢谢连接我：/127.0.0.1:6066
Goodbye!

这两个文件应该不适用Eclispe用包的形式管理。这会导致无法找到class，并且也会导致无法运行main方法。
配置全局JavaSDK后用命令行进行编译，运行。