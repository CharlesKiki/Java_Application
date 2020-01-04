package DesignPattern;

import java.io.File;
import java.io.IOException;

public class CommandPattern {
}

//接收者
/*
* 在这个模式中所谓的接收者就是承担了一定服务的类和对象
* */
class MakeFile {

//新建文件

    public void createFile(String name) throws IOException {

        File file = new File(name);

        file.createNewFile();

    }

//删除文件

    public boolean deleteFile(String name) {

        File file = new File(name);

        if (file.exists() && file.isFile()) {

            file.delete();

            return true;

        }

        return false;

    }

}


//命令接口
/*
* 命令接口需要被实现
* */
interface Command {

    /*
    * 虽然这里的Command是接口的形式，但是它面向的是一个参数，这个参数直接用来给执行者对象
    * 在实现中，Command直接和目标对象代码耦合。
    * */
    void execute(String name) throws Exception;

}


//新建文件命令
/*
* 命令的形式是以一个对象的方法出现的
* 所谓的命令类似一个字符串类型的参数来控制对象的行为
* */
class CommandCreate implements Command {
    /*
    * MakeFile本身携带删除和新建的方法
    * */
    MakeFile makeFile;

    /*
    * 创建指令方法需要一个参数，该参数为执行命令的执行对象
    * */
    public CommandCreate(MakeFile makeFile) {
        this.makeFile = makeFile;
    }


    /*
    * 执行方法意味着执行体的方法执行
    * */
    @Override
    public void execute(String name) throws Exception {
        makeFile.createFile(name);
    }
}

//删文件命令
class CommandDelete implements Command {

    MakeFile makeFile;

    public CommandDelete(MakeFile makeFile) {

        this.makeFile = makeFile;

    }

    @Override

    public void execute(String name) throws Exception {

        makeFile.deleteFile(name);

    }

}

//请求者
/*
* 模拟请求者
* */
class Client {
    /*
    * 声明一个接口引用
    * */
    Command command;

    /*
    * 公共接口，调用后返回该方法的对象
    * */
    public Client setCommand(Command command) {
        this.command = command;
        return this;
    }

    public void executeCommand(String name) throws Exception {
        if (command == null)
            throw new Exception("命令不能为空！");
        command.execute(name);
    }
}


class CommandPatternTestUse {
    public static void main(String args[]) throws Exception {

        //接收者

        MakeFile makeFile = new MakeFile();

        //命令

        CommandCreate create = new CommandCreate(makeFile);

        CommandDelete delete = new CommandDelete(makeFile);

        //请求者

        Client client = new Client();

        //执行命令

        client.setCommand(create).executeCommand("d://test1.txt");
        /*
        * 这句话的写法似乎也有这样的等价
        * client.setCommand(create);
        * client.executeCommand("d://test1.txt");
        * */

        client.setCommand(create).executeCommand("d://test2.txt");

        client.setCommand(delete).executeCommand("d://test2.txt");

    }

}//执行完后在D盘会有一个test1.txt的文件，test2.txt本页创建了，不过又被删除了。


