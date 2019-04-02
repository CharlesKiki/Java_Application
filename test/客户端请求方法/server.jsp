import java.io.*;

import java.net.*;


class serverSocket
{
    //自定义服务器
    public static void main(String[] agrs) throws Exception
    {
        ServerSocket ss =new ServerSocket(9090);                 //初始化服务器对象并指定端口号

        Socket s = ss.accept();                                  //获取客户端对象

        System.out.println(s.getInetAddress().getHostAddress()); //打印客户端主机ip

        InputStream is= s.getInputStream();                      //获取客户端输入流

        byte[] buf =new byte[1024];                              //自定义容器用来装数据

        int len=is.read(buf);                                    //将客户端输入流读出到数组

        System.out.println(new String(buf,0,len));                 //将数组中的数据输出

        PrintWriter pw =new PrintWriter(s.getOutputStream(),true); //通过写出对象对客户端进行反馈

        pw.println("<font color='green' size='7'>注册成功</font>"); //反馈内容

        s.close();      //关连接流

        ss.close();     //关服务器流
    }

}